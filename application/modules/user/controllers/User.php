<?php
defined('BASEPATH') OR exit('No direct script access allowed ');

class User extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model('User_model');
        $this->load->library('Braintree_lib');
        $this->user_id = isset($this->session->get_userdata()['user_details'][0]->users_id) ? $this->session->get_userdata()['user_details'][0]->users_id : '1';
    }

    /**
     * This function is redirect to users profile page
     * @return Void
     */
    public function index()
    {
        if (is_login()) {
            redirect(base_url() . 'user/dashboard', 'refresh');
        }
    }

    /**
     * This function to load dashboard
     * @return Void
     */
    public function dashboard()
    {
        is_login();
        if (!isset($id) || $id == '') {
            $id = $this->session->userdata('user_details')[0]->users_id;
        }
        $subscription = checkSubscaription($id);


        if ($subscription) {
            redirect(base_url() . 'user/subscription', 'refresh');
        } else {
            $status = checkApproved($id);
            if ($status == 'Approved') {
                $data['user_data'] = $this->User_model->get_users($id);
                $data['avail_data'] = getDataByid('availability', $id, 'users_id');
                $data['fareDatas'] = getAllDataTable('fare', $id, 'users_id', 'fare_status');
                $data['subs_data'] = getDataByidDesc('subscription', $id, 'users_id', 'subs_id');

                $query = $this->db->query("SELECT make_id, make_name from make");
                $data['makes'] = $query->result_array();

                $this->load->view('include/script');
                $this->load->view('profile', $data);
            } elseif ($status == 'Canceled') {
                redirect(base_url() . 'user/subscription', 'refresh');
            } else {
                redirect(base_url() . 'user/message', 'refresh');
            }
        }

    }

    public function message()
    {
        is_login();
        if (!isset($id) || $id == '') {
            $id = $this->session->userdata('user_details')[0]->users_id;
        }

        $data['user_data'] = $this->User_model->get_users($id);
        $data['avail_data'] = getDataByid('availability', $id, 'users_id');
        $data['fareDatas'] = getAllDataTable('fare', $id, 'users_id', 'fare_status');
        $data['subs_data'] = getDataByidDesc('subscription', $id, 'users_id', 'subs_id');

        $this->load->view('include/script');
        $this->load->view('message', $data);

    }

    public function subscription()
    {
        is_login();
        if (!isset($id) || $id == '') {
            $id = $this->session->userdata('user_details')[0]->id;
        }
        $data['user_data'] = $this->User_model->get_users($id);
        $data['planDatas'] = getAllDataTable('subcriptions', '', '');


        $this->load->view('include/script');
        $this->load->view('subscription', $data);
    }

    /**
     * This function is used to load login view page
     * @return Void
     */
    public function login()
    {
        if (isset($_SESSION['user_details'])) {
            redirect(base_url() . 'user/dashboard', 'refresh');
        }
        $this->load->view('include/script');
        $this->load->view('login');
    }

    /**
     * This function is used to logout user
     * @return Void
     */
    public function logout()
    {
        is_login();
        $this->session->unset_userdata('user_details');
        redirect(base_url() . 'user/login', 'refresh');
    }

    /**
     * This function is used to registr user
     * @return Void
     */
    public function registration()
    {
        if (isset($_SESSION['user_details'])) {
            redirect(base_url() . 'user/profile', 'refresh');
        }
        //Check if admin allow to registration for user
        if (setting_all('register_allowed') == 1) {
            if ($this->input->post()) {
                $this->add_edit();
                $this->session->set_flashdata('messagePr', 'Successfully Registered..');
            } else {
                $this->load->view('include/script');
                $this->load->view('register');
            }
        } else {
            $this->session->set_flashdata('messagePr', 'Registration Not allowed..');
            redirect(base_url() . 'user/login', 'refresh');
        }
    }

    /**
     * This function is used for user authentication ( Working in login process )
     * @return Void
     */
    public function auth_user($page = '')
    {
        $return = $this->User_model->auth_user();
        if (empty($return)) {
            $this->session->set_flashdata('messagePr', 'Invalid details');
            redirect(base_url() . 'user/login', 'refresh');
        } else {
            if ($return == 'not_varified') {
                $this->session->set_flashdata('messagePr', 'This account is not verified. Please contact to your admin..');
                redirect(base_url() . 'user/login', 'refresh');
            } else {
                /*mkaPackageCodeAuth*/
                $this->session->set_userdata('user_details', $return);
            }

            redirect(base_url() . 'user/dashboard', 'refresh');
        }
    }

    /**
     * This function is used send mail in forget password
     * @return Void
     */
    public function forgetpassword()
    {
        header("Access-Control-Allow-Origin: *");
        $page['title'] = 'Forgot Password';
        if ($this->input->post()) {
            $setting = settings();
            $res = $this->User_model->get_data_by('users', $this->input->post('email'), 'email', 1);
            if (isset($res[0]->users_id) && $res[0]->users_id != '') {
                $var_key = $this->getVarificationCode();
                $this->User_model->updateRow('users', 'users_id', $res[0]->users_id, array('var_key' => $var_key));
                $sub = "Reset password";
                $email = $this->input->post('email');
                $data = array(
                    'user_name' => $res[0]->name,
                    'action_url' => base_url(),
                    'sender_name' => $setting['company_name'],
                    'website_name' => $setting['website'],
                    'varification_link' => base_url() . 'user/mail_varify?code=' . $var_key,
                    'url_link' => base_url() . 'user/mail_varify?code=' . $var_key,
                );
                $body = $this->User_model->get_template('forgot_password');
                $body = $body->html;
                foreach ($data as $key => $value) {
                    $body = str_replace('{var_' . $key . '}', $value, $body);
                }
                if ($setting['mail_setting'] == 'php_mailer') {
                    $this->load->library("send_mail");
                    $emm = $this->send_mail->email($sub, $body, $email, $setting);
                } else {
                    // content-type is required when sending HTML email
                    $headers = "MIME-Version: 1.0" . "\r\n";
                    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                    $headers .= 'From: ' . $setting['EMAIL'] . "\r\n";
                    $emm = mail($email, $sub, $body, $headers);
                }
                if ($emm) {
                    $this->session->set_flashdata('messagePr', 'To reset your password, link has been sent to your email');
                    redirect(base_url() . 'user/login', 'refresh');
                }
            } else {
                $this->session->set_flashdata('forgotpassword', 'This account does not exist');//die;
                redirect(base_url() . "user/forgetpassword");
            }
        } else {
            $this->load->view('include/script');
            $this->load->view('forget_password');
        }
    }

    /**
     * This function is used send mail in forget password
     * @return Void
     */
    public function forget_password()
    {
        header("Access-Control-Allow-Origin: *");
        if ($this->input->post()) {
            $setting = settings();
            $res = $this->User_model->get_data_by('users', $this->input->post('email'), 'email', 1);
            if (isset($res[0]->users_id) && $res[0]->users_id != '') {
                $var_key = $this->getVarificationCode();
                $this->User_model->updateRow('users', 'users_id', $res[0]->users_id, array('var_key' => $var_key));
                $sub = "Reset password";
                $email = $this->input->post('email');
                $data = array(
                    'user_name' => $res[0]->name,
                    'action_url' => base_url(),
                    'sender_name' => $setting['company_name'],
                    'website_name' => $setting['website'],
                    'varification_link' => base_url() . 'user/mail_varify?code=' . $var_key,
                    'url_link' => base_url() . 'user/mail_varify?code=' . $var_key,
                );
                $body = $this->User_model->get_template('forgot_password');
                $body = $body->html;
                foreach ($data as $key => $value) {
                    $body = str_replace('{var_' . $key . '}', $value, $body);
                }
                if ($setting['mail_setting'] == 'php_mailer') {
                    $this->load->library("send_mail");
                    $emm = $this->send_mail->email($sub, $body, $email, $setting);
                    echo json_encode(array('status' => 'success'));
                    die;
                } else {
                    // content-type is required when sending HTML email
                    $headers = "MIME-Version: 1.0" . "\r\n";
                    $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                    $headers .= 'From: ' . $setting['EMAIL'] . "\r\n";
                    $emm = mail($email, $sub, $body, $headers);
                    echo json_encode(array('status' => 'success'));
                    die;
                }


            }
        }
        echo json_encode(array('status' => 'error'));
        die;
    }

    /**
     * This function is used to load view of reset password and varify user too
     * @return : void
     */
    public function mail_varify()
    {
        $return = $this->User_model->mail_varify();
        $this->load->view('include/script');
        if ($return) {
            $data['email'] = $return;
            $this->load->view('set_password', $data);
        } else {
            $data['email'] = 'allredyUsed';
            $this->load->view('set_password', $data);
        }
    }

    public function checkEmail()
    {
        echo $this->User_model->CheckEmail();
    }


    public function checkUsername()
    {
        echo $this->User_model->CheckUserName();
    }

    /**
     * This function is used to reset password in forget password process
     * @return : void
     */
    public function reset_password()
    {
        $return = $this->User_model->ResetPpassword();
        if ($return) {
            $this->session->set_flashdata('messagePr', 'Password Changed Successfully..');
            redirect(base_url() . 'user/login', 'refresh');
        } else {
            $this->session->set_flashdata('messagePr', 'Unable to update password');
            redirect(base_url() . 'user/login', 'refresh');
        }
    }

    /**
     * This function is generate hash code for random string
     * @return string
     */
    public function getVarificationCode()
    {
        $pw = $this->randomString();
        return $varificat_key = password_hash($pw, PASSWORD_DEFAULT);
    }


    /**
     * This function is used for show users list
     * @return Void
     */
    public function userTable()
    {
        is_login();
        if (CheckPermission("user", "own_read") || CheckPermission("user", "all_read")) {
            $this->load->view('include/header');
            $this->load->view('user_table');
            $this->load->view('include/footer');
        } else {
            $this->session->set_flashdata('messagePr', 'You don\'t have permission to access.');
            redirect(base_url() . 'user/profile', 'refresh');
        }
    }

    /**
     * This function is used to create datatable in users list page
     * @return Void
     */
    public function dataTable()
    {
        is_login();
        $table = 'users';
        $primaryKey = 'users_id';
        $columns = array(
            array('db' => 'users_id', 'dt' => 0), array('db' => 'user_type', 'dt' => 1),
            array('db' => 'email', 'dt' => 2),
            array('db' => 'name', 'dt' => 3),
            array('db' => 'status', 'dt' => 4),
            array('db' => 'create_date', 'dt' => 5),
            array('db' => 'users_id', 'dt' => 6)
        );

        $sql_details = array(
            'user' => $this->db->username,
            'pass' => $this->db->password,
            'db' => $this->db->database,
            'host' => $this->db->hostname
        );
        if (CheckPermission("user", "all_read") || $this->session->get_userdata()['user_details'][0]->user_type == 'admin') {
            $where = array("user_type != 'admin'", "users_id != $this->user_id");
        } else {
            $where = array("user_type != 'admin'", "user_id = $this->user_id");
        }

        $output_arr = SSP::complex($_GET, $sql_details, $table, $primaryKey, $columns, $where);
        foreach ($output_arr['data'] as $key => $value) {
            $id = $output_arr['data'][$key][count($output_arr['data'][$key]) - 1];
            $output_arr['data'][$key][count($output_arr['data'][$key]) - 1] = '';
            if (CheckPermission('user', "all_update")) {
                $output_arr['data'][$key][count($output_arr['data'][$key]) - 1] .= '<a id="btnEditRow" class="modalButtonUser mClass"  href="javascript:;" type="button" data-src="' . $id . '" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
            } else if (CheckPermission('user', "own_update") && (CheckPermission('user', "all_update") != true)) {
                $user_id = getRowByTableColomId($table, $id, 'users_id', 'user_id');
                if ($user_id == $this->user_id) {
                    $output_arr['data'][$key][count($output_arr['data'][$key]) - 1] .= '<a id="btnEditRow" class="modalButtonUser mClass"  href="javascript:;" type="button" data-src="' . $id . '" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
                }
            }

            if (CheckPermission('user', "all_delete")) {
                $output_arr['data'][$key][count($output_arr['data'][$key]) - 1] .= '<a style="cursor:pointer;" data-toggle="modal" class="mClass" onclick="setId(' . $id . ', \'user\')" data-target="#cnfrm_delete" title="delete"><i class="fa fa-trash-o" ></i></a>';
            } else if (CheckPermission('user', "own_delete") && (CheckPermission('user', "all_delete") != true)) {
                $user_id = getRowByTableColomId($table, $id, 'users_id', 'user_id');
                if ($user_id == $this->user_id) {
                    $output_arr['data'][$key][count($output_arr['data'][$key]) - 1] .= '<a style="cursor:pointer;" data-toggle="modal" class="mClass" onclick="setId(' . $id . ', \'user\')" data-target="#cnfrm_delete" title="delete"><i class="fa fa-trash-o" ></i></a>';
                }
            }
            $output_arr['data'][$key][0] = '<input type="checkbox" name="selData" value="' . $output_arr['data'][$key][0] . '">';
        }
        echo json_encode($output_arr);
    }

    /**
     * This function is Showing users profile
     * @return Void
     */
    public function profile($id = '')
    {
        is_login();
        if (!isset($id) || $id == '') {
            $id = $this->session->userdata('user_details')[0]->users_id;
        }
        $data['user_data'] = $this->User_model->get_users($id);
        $data['avail_data'] = getDataByid('availability', $id, 'users_id');
        $data['fareDatas'] = getAllDataTable('fare', $id, 'users_id');
        $data['subs_data'] = getDataByidDesc('subscription', $id, 'users_id', 'subs_id');

        $this->load->view('include/script');
        $this->load->view('profile', $data);
        //$this->load->view('include/footer');
    }

    /**
     * This function is used to show popup of user to add and update
     * @return Void
     */
    public function get_modal()
    {
        is_login();
        if ($this->input->post('id')) {
            $data['userData'] = getDataByid('users', $this->input->post('id'), 'users_id');
            $data['viewForm'] = $this->input->post('viewForm');
            echo $this->load->view('add_user', $data, true);
        } else {
            echo $this->load->view('add_user', '', true);
        }
        exit;
    }


    public function get_modal_available()
    {
        is_login();
        if ($this->input->post('id')) {
            $data['availData'] = getDataByid('availability', $this->input->post('id'), 'users_id');
            echo $this->load->view('avail_user', $data, true);
        } else {
            echo $this->load->view('avail_user', '', true);
        }
        exit;
    }

    public function get_modal_fare()
    {
        is_login();
        if ($this->input->post('id')) {
            $id = $this->input->post('id');
            $users = getDataByid('users', $this->input->post('id'), 'users_id');
            $model = getDataByid('model', $users->model, 'model_id');
            $category = !empty($model->category) ? $model->category : '';

            $this->db->from('plans_names');
            $this->db->join('fare', 'fare.plan_id = plans_names.id', 'left');
            $this->db->where('fare.fare_status', 'duration');
            $this->db->where('fare.users_id', $id);
            if (!empty($category)) {
                $this->db->where('plans_names.category', $category);
            }
            $this->db->where('plans_names.deleted_at IS NULL', null, false);
            $result = $this->db->get();
            $data['fares_1'] = $result->result();

            if (empty($data['fares_1'])) {
                $this->db->from('plans_names');
                $this->db->where('plans_names.type', 'duration');
                if (!empty($category)) {
                    $this->db->where('plans_names.category', $category);
                }
                $this->db->where('plans_names.deleted_at IS NULL', null, false);
                $result = $this->db->get();
                $data['fares'] = $result->result();
            } else {
                $this->db->from('plans_names');
                $this->db->join('fare', 'fare.plan_id = plans_names.id', 'left');
                $this->db->where('plans_names.type', 'duration');
                if (!empty($category)) {
                    $this->db->where('plans_names.category', $category);
                }
                $this->db->where('fare.users_id IS NULL', null, false);
                $this->db->where('plans_names.deleted_at IS NULL', null, false);
                $result = $this->db->get();
                $data['fares_2'] = $result->result();
                $data['fares'] = array_merge($data['fares_1'], $data['fares_2']);
            }

            $this->db->from('plans_names');
            $this->db->join('fare', 'fare.plan_id = plans_names.id', 'left');
            $this->db->where('fare.fare_status', 'mile');
            if (!empty($category)) {
                $this->db->where('plans_names.category', $category);
            }
            $this->db->where('fare.users_id', $id);
            $this->db->where('plans_names.deleted_at IS NULL', null);
            $result_1 = $this->db->get();
            $data['m_fares_1'] = $result_1->result();

            if (empty($data['m_fares_1'])) {
                $this->db->from('plans_names');
                $this->db->where('plans_names.type', 'mile');
                if (!empty($category)) {
                    $this->db->where('plans_names.category', $category);
                }
                $this->db->where('plans_names.deleted_at IS NULL', null, false);
                $result = $this->db->get();
                $data['m_fares'] = $result->result();
            } else {
                $this->db->from('plans_names');
                $this->db->join('fare', 'fare.plan_id = plans_names.id', 'left');
                $this->db->where('plans_names.type', 'mile');
                if (!empty($category)) {
                    $this->db->where('plans_names.category', $category);
                }
                $this->db->where('fare.users_id IS NULL', null, false);
                $this->db->where('plans_names.deleted_at IS NULL', null, false);
                $result = $this->db->get();
                $data['m_fares_2'] = $result->result();
                $data['m_fares'] = array_merge($data['m_fares_1'], $data['m_fares_2']);
            }

            echo $this->load->view('fare_user', $data, true);
        } else {
            echo $this->load->view('fare_user', '', true);
        }
        exit;
    }

    /**
     * This function is used to upload file
     * @return Void
     */
    function upload($name)
    {
        foreach ($_FILES as $fileInfo) {
            $filename = $_FILES[$name]['name'];
            $tmpname = $_FILES[$name]['tmp_name'];
            $exp = explode('.', $filename);
            $ext = end($exp);
            $newname = $exp[0] . '_' . time() . "." . $ext;
            $config['upload_path'] = 'assets/images/';
            $config['upload_url'] = base_url() . 'assets/images/';
            $config['allowed_types'] = "gif|jpg|jpeg|png|iso|dmg|zip|rar|doc|docx|xls|xlsx|ppt|pptx|csv|ods|odt|odp|pdf|rtf|sxc|sxi|txt|exe|avi|mpeg|mp3|mp4|3gp";
            $config['max_size'] = '10000000';
            $config['file_name'] = $newname;
            $this->load->library('upload', $config);
            move_uploaded_file($tmpname, "assets/images/" . $newname);
            return $newname;
        }
    }

    /**
     * This function is used to add and update users
     * @return Void
     */
    public function add_edit($id = '')
    {
        $data = $this->input->post();
        $profile_pic = 'user.png';
        if ($this->input->post('users_id')) {
            $id = $this->input->post('users_id');
        }
        if (isset($this->session->userdata('user_details')[0]->users_id)) {
            if ($this->input->post('users_id') == $this->session->userdata('user_details')[0]->users_id) {
                $redirect = 'profile';
            } else {
                $redirect = 'userTable';
            }
        } else {
            $redirect = 'login';
        }


        foreach ($_FILES as $name => $fileInfo) {
            if (!empty($_FILES[$name]['name'])) {
                $newname = $this->upload($name);
                $data[$name] = $newname;
                $profile_pic = $newname;
            } else {
                if ($this->input->post('fileOld')) {
                    $newname = $this->input->post('fileOld');
                    $data[$name] = $newname;
                    $profile_pic = $newname;
                } else {
                    $data[$name] = '';
                    $profile_pic = 'user.png';
                }
            }
        }

        if ($id != '') {
            $data = $this->input->post();
            if ($this->input->post('status') != '') {
                $data['status'] = $this->input->post('status');
            }
            if ($this->input->post('users_id') == 1) {
                $data['user_type'] = 'admin';
                $data['status'] = 'active';
            }
            $checkValue = $this->User_model->check_exists('users', 'email', $this->input->post('email'), $id, 'users_id');
            if ($checkValue == false) {
                $this->session->set_flashdata('messagePr', 'This Email Already Registered with us..');
                redirect(base_url() . 'user/userTable', 'refresh');
            }
            $checkValue1 = $this->User_model->check_exists('users', 'name', $this->input->post('name'), $id, 'users_id');
            if ($checkValue1 == false) {
                $this->session->set_flashdata('messagePr', 'Username Already Registered with us..');
                redirect(base_url() . 'user/userTable', 'refresh');
            }
            if ($this->input->post('password') != '') {
                if ($this->input->post('currentpassword') != '') {
                    $old_row = getDataByid('users', $this->input->post('users_id'), 'users_id');
                    if (password_verify($this->input->post('currentpassword'), $old_row->password)) {
                        if ($this->input->post('password') == $this->input->post('confirmPassword')) {
                            $password = password_hash($this->input->post('password'), PASSWORD_DEFAULT);
                            $data['password'] = $password;
                        } else {
                            $this->session->set_flashdata('messagePr', 'Password and confirm password should be same...');
                            redirect(base_url() . 'user/' . $redirect, 'refresh');
                        }
                    } else {
                        $this->session->set_flashdata('messagePr', 'Enter Valid Current Password...');
                        redirect(base_url() . 'user/' . $redirect, 'refresh');
                    }
                } else {
                    $this->session->set_flashdata('messagePr', 'Current password is required');
                    redirect(base_url() . 'user/' . $redirect, 'refresh');
                }
            }
            $id = $this->input->post('users_id');
            unset($data['fileOld']);
            unset($data['currentpassword']);
            unset($data['confirmPassword']);
            unset($data['users_id']);
            unset($data['user_type']);
            if (isset($data['edit'])) {
                unset($data['edit']);
            }
            if (!empty($data['password'])) {
                unset($data['password']);
            }


            foreach ($data as $dkey => $dvalue) {
                if (is_array($dvalue)) {
                    $data[$dkey] = implode(',', $dvalue);
                }
            }
            $this->User_model->updateRow('users', 'users_id', $id, $data);
            $this->session->set_flashdata('messagePr', 'Your data updated Successfully..');
            redirect(base_url() . 'user/' . $redirect, 'refresh');
        } else {
            if ($this->input->post('user_type') != 'admin') {
                $data = $this->input->post();
                $password = password_hash($this->input->post('password'), PASSWORD_DEFAULT);
                $checkValue = $this->User_model->check_exists('users', 'email', $this->input->post('email'));
                if ($checkValue == false) {
                    $this->session->set_flashdata('messagePr', 'This Email Already Registered with us..');
                    redirect(base_url() . 'user/userTable', 'refresh');
                }
                $checkValue1 = $this->User_model->check_exists('users', 'name', $this->input->post('name'));
                if ($checkValue1 == false) {
                    $this->session->set_flashdata('messagePr', 'Username Already Registered with us..');
                    redirect(base_url() . 'user/userTable', 'refresh');
                }
                $data['status'] = 'active';
                if (setting_all('admin_approval') == 1) {
                    $data['status'] = 'deleted';
                }

                if ($this->input->post('status') != '') {
                    $data['status'] = $this->input->post('status');
                }
                //$data['token'] = $this->generate_token();
                $data['user_id'] = $this->user_id;
                $data['password'] = $password;
                $data['profile_pic'] = $profile_pic;
                $data['is_deleted'] = 0;
                $data['create_date'] = date('Y-m-d');
                if (isset($data['password_confirmation'])) {
                    unset($data['password_confirmation']);
                }
                if (isset($data['call_from'])) {
                    unset($data['call_from']);
                }
                unset($data['submit']);
                foreach ($data as $dkey => $dvalue) {
                    if (is_array($dvalue)) {
                        $data[$dkey] = implode(',', $dvalue);
                    }
                }
                /*mkaPackageCodeAddUser*/
                $this->User_model->insertRow('users', $data);
                redirect(base_url() . 'user/' . $redirect, 'refresh');
            } else {
                $this->session->set_flashdata('messagePr', 'You Don\'t have this autherity ');
                redirect(base_url() . 'user/registration', 'refresh');
            }
        }

    }

    public function add_edit_available()
    {
        $data = $this->input->post();
        if ($this->input->post('users_id')) {
            unset($data['submit']);
            unset($data['save']);
            unset($data['users_id']);

            $this->User_model->updateRow('availability', 'users_id', $this->input->post('users_id'), $data);
            $this->session->set_flashdata('message', 'Your data updated Successfully..');
            redirect(base_url() . 'user/dashboard', 'refresh');
        } else {

            unset($data['submit']);
            unset($data['save']);
            $data['users_id'] = $this->user_id;
            $this->User_model->insertRow('availability', $data);
            $this->session->set_flashdata('message', 'Your data inserted Successfully..');
            redirect(base_url() . 'user/dashboard', 'refresh');
        }
    }


    public function add_edit_available_api()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        if ($this->input->post('users_id')) {
            $name = $data['name'];
            $time = $data['time'];
            $savedata["$name"] = $time;
            $this->User_model->updateRow('availability', 'users_id', $this->input->post('users_id'), $savedata);
            $data['message'] = 'Your data updated Successfully..';
        }
    }


    /*public function searchDriver(){

       header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $datas=array();
        $fav = array();
        if($this->input->post('driver_number')) {
                 if(!empty($data['bookingNew'])){
                   $datas = getDataByid('users',$this->input->post('driver_number'),'users_id');
                 }else{
                   $datas = getDataByid('users',$this->input->post('driver_number'),'encrypt_user_id');
                 }

                if(!empty($datas)){
                if(!empty($data['client_id']) && $datas->status == 'Approved'){
                    $fav = getFav('favourite_driver',$datas->users_id,'driver_id',$data['client_id'],'client_id');
                   }
                 }

                if(!empty($datas) && $datas->status == 'Approved'){
                 $make=getDataByid('make',$datas->make,'make_id');
                 $model=getDataByid('model',$datas->model,'model_id');
                 $datas->make_value=!empty($make->make_value)?$make->make_value:'';
                 $datas->model_value=!empty($model->model_value)?$model->model_value:'';
                     if(!empty($fav)){
                        $datas->fav=1;
                    }else{
                        $datas->fav=0;
                    }
                }

                echo json_encode($datas);
            }
      }*/


    public function searchDriver()
    {

        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $datas = array();
        $fav = array();
        if ($this->input->post('driver_number')) {
            if (!empty($data['bookingNew'])) {
                $datas = getDataByid('users', $this->input->post('driver_number'), 'users_id');
                if (!empty($datas)) {
                    if (!empty($data['client_id']) && $datas->status == 'Approved') {
                        $fav = getFav('favourite_driver', $datas->users_id, 'driver_id', $data['client_id'], 'client_id');
                    }
                }

                if (!empty($datas) && $datas->status == 'Approved') {
                    $make = getDataByid('make', $datas->make, 'make_id');
                    $model = getDataByid('model', $datas->model, 'model_id');
                    $datas->make_value = !empty($make->make_value) ? $make->make_value : '';
                    $datas->model_value = !empty($model->model_value) ? $model->model_value : '';
                    if (!empty($fav)) {
                        $datas->fav = 1;
                    } else {
                        $datas->fav = 0;
                    }
                }

                echo json_encode($datas);
                die;
            } else {
                $datas = array();
                $datas = getAllSearchData('users', $this->input->post('driver_number'), 'encrypt_user_id');

                if (!empty($datas)) {
                    $i = 0;
                    foreach ($datas as $key => $value) {

                        if (!empty($data['client_id']) && $datas[$i]->status == 'Approved') {

                            $fav = getFav('favourite_driver', $datas[$i]->users_id, 'driver_id', $data['client_id'], 'client_id');

                            $datas[$i]->myRating = rattingDriver($datas[$i]->users_id);
                            $make = getDataByid('make', $datas[$i]->make, 'make_id');
                            $model = getDataByid('model', $datas[$i]->model, 'model_id');
                            $datas[$i]->make_value = !empty($make->make_value) ? $make->make_value : '';
                            $datas[$i]->model_value = !empty($model->model_value) ? $model->model_value : '';
                            if (!empty($fav)) {
                                $datas[$i]->fav = 1;
                            } else {
                                $datas[$i]->fav = 0;
                            }
                            $i++;
                        }
                    }
                }

                echo json_encode($datas);
                die;

            }
        }

    }

    public function clientDetail()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        if ($this->input->post('client_id')) {
            $data = getDataByid('client_details', $this->input->post('client_id'), 'client_id');
            $data->myRatting = ratting($this->input->post('client_id'));
            echo json_encode($data);
        }
    }


    public function deviceDriver()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $datas = array();
        if ($this->input->post('driver_id') && $this->input->post('client_id')) {
            $subs = getAllDataTables('passenger_subscriptions');
            $free_subs = 0;
            $subscription_price = getAllDataTables('passenger_subscriptions', '0.0', 'subscription_price');
            $free_subs = !empty($subscription_price[0]->subscription_driver) ? $subscription_price[0]->subscription_driver : 3;

            foreach ($subs as $sub) {
                if ($sub->subscription_price > 0) {
                    $favourite_driver = $this->User_model->favDrivers($data['client_id']);
                    $subscription_drivers = getAllDataTables('passenger_subs', $data['client_id'], 'client_id');
                    $driver = 0;
                    foreach ($subscription_drivers as $subscription_driver) {
                        $driver += !empty($subscription_driver) ? $subscription_driver->subscription_driver : 0;
                    }

                    $drivers = $driver + $free_subs;
                    if ($drivers <= count($favourite_driver)) {
                        $datas['p_subs'] = 1;
                        $datas['subscription_driver'] = $sub->subscription_driver;
                        $datas['subscription_price'] = $sub->subscription_price;
                        $datas['subscription_id'] = $sub->id;
                        echo json_encode($datas);
                        die;
                    }
                }
            }
            $insertRow = $this->User_model->favDriver($this->input->post('driver_id'), $this->input->post('client_id'));
            if (empty($insertRow)) {
                $data['driver_id'] = $this->input->post('driver_id');
                $data['client_id'] = $this->input->post('client_id');
                $this->User_model->insertRow('favourite_driver', $data);
            }

            $data['p_subs'] = 0;
            $data['status'] = 'success';
            echo json_encode($data);

        }
    }

    public function subcriptionPassengerCancel()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $datas['deleted_at'] = date('Y-m-d');
        $data['passenger_subs_id'];
        $free_subs = 0;

        $dataOutput = getAllDataTables('passenger_subs', $data['client_id'], 'client_id');

        $favourite_driver = getAllDataTables('favourite_driver', $data['client_id'], 'client_id');

        $subscription_drivers = getAllDataTables('passenger_subs', $data['client_id'], 'client_id');
        $driver = 0;
        foreach ($subscription_drivers as $subscription_driver) {
            $driver += !empty($subscription_driver) ? $subscription_driver->subscription_driver : 0;
        }

        $drivers = $driver + $free_subs;

        $subscription_price = getAllDataTables('passenger_subscriptions', '0.0', 'subscription_price');
        $free_subs = !empty($subscription_price[0]->subscription_driver) ? $subscription_price[0]->subscription_driver : 3;

        for ($i = 0; $i < count($favourite_driver) - $free_subs; $i++) {
            $this->User_model->deleteRow($favourite_driver[$i]->favourite_driver_id, 'favourite_driver', 'favourite_driver_id');
        }
        $this->User_model->updateRow('passenger_subs', 'passenger_subs_id', $data['passenger_subs_id'], $datas);
        echo json_encode($dataOutput);
    }

    public function rattingDrivers($driver_id)
    {
        $data['rate'] = rattingDriver($driver_id);
        echo json_encode($data);
    }

    /*public function deviceDriver(){
       header("Access-Control-Allow-Origin: *");
       $data = $this->input->post();
       $datas= array();
       if($this->input->post('driver_id') && $this->input->post('client_id')) {
             $insertRow = $this->User_model->favDriver($this->input->post('driver_id'),$this->input->post('client_id'));
             if(empty($insertRow)){
             $data['driver_id']=$this->input->post('driver_id');
             $data['client_id']=$this->input->post('client_id');
             $this->User_model->insertRow('favourite_driver', $data);
            }

            $data['p_subs'] = 0;
            $data['status'] = 'success';
            echo json_encode($data);

       }
   }*/
    public function sendSMSOTPAPI()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $dataOutput = array();
        if ($this->input->post('phone_number')) {
            $otp_number = mt_rand(100000, 999999);

            $insertRow = $this->User_model->otpNumber($data['phone_number'], $data['country_code']);
            if (empty($insertRow)) {
                $saveData['otp_number'] = $otp_number;
                $saveData['client_phone'] = $data['phone_number'];
                $saveData['country_code'] = $data['country_code'];
                $this->User_model->insertRow('client_details', $saveData);
                $insertRow = $this->db->insert_id();
            } else {
                $saveData['otp_number'] = $otp_number;
                $saveData['client_phone'] = $data['phone_number'];
                $saveData['country_code'] = $data['country_code'];
                $this->User_model->updateRow('client_details', 'client_id', $insertRow, $saveData);
            }
            $dataOutput['status'] = 'success';
            $dataOutput['user_id'] = $insertRow;
            //$dataOutput['is_active'] = 0;     
            $message = 'Enter the OTP Number ' . $otp_number;
            $url = 'http://dev1.ibrinfotech.com/landingpage_driver/twilio-php/index.php';

            $phone_number = $saveData['client_phone'];
            $country_code = $saveData['country_code'];
            $infoNew = "message=$message"
                . "&phone_number=$phone_number"
                . "&country_code=$country_code";
            $dataOutput['sid'] = $this->CallAPi($url, $infoNew);

        }

        echo json_encode($dataOutput);
    }

    public function subcriptionPassenger()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $dataOutput = getAllDataTables('passenger_subs', $data['client_id'], 'client_id');
        echo json_encode($dataOutput);
    }

    public function CallAPi($url, $info)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $info);
        curl_setopt($curl, CURLOPT_POST, 1);
        $result = curl_exec($curl);
        $ch = curl_init();
        curl_close($ch);
        return $result;
    }

    public function createClient()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        if ($this->input->post('user_id')) {
            $saveData['client_first_name'] = $this->input->post('first_name');
            $saveData['client_last_name'] = $this->input->post('last_name');
            $saveData['client_phone'] = $this->input->post('mobile');
            $saveData['client_email'] = $this->input->post('email');
            $user_id = $this->input->post('user_id');
            $this->User_model->updateRow('client_details', 'client_id', $user_id, $saveData);
            $data['status'] = 'success';
            echo json_encode($data);

        }
    }


    public function favDrivers()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $outputData = $this->User_model->favDrivers($data['client_id']);
        if (!empty($outputData)) {
            foreach ($outputData as $kay => $outputDat) {
                $outputData[$kay] = $outputData[$kay];
                $re = $this->getRattingsAndCommentsDriverId($outputDat->users_id, 'return');
                $make = getDataByid('make', $outputDat->make, 'make_id');
                $model = getDataByid('model', $outputDat->model, 'model_id');
                $outputData[$kay]->myRating = $re['myRating'];
                $outputData[$kay]->make_value = !empty($make->make_value) ? $make->make_value : '';
                $outputData[$kay]->model_value = !empty($model->model_value) ? $model->model_value : '';
            }
        }
        echo json_encode($outputData);
    }


    public function favDriversInfo()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $outputData = $this->User_model->favDriversInfo($data['client_id'], $data['driver_id']);
        if (!empty($outputData)) {
            foreach ($outputData as $kay => $outputDat) {
                $outputData[$kay] = $outputData[$kay];
                $re = $this->getRattingsAndCommentsDriverId($outputDat->users_id, 'return');
                $make = getDataByid('make', $outputDat->make, 'make_id');
                $model = getDataByid('model', $outputDat->model, 'model_id');
                $outputData[$kay]->myRating = $re['myRating'];
                $outputData[$kay]->make_value = !empty($make->make_value) ? $make->make_value : '';
                $outputData[$kay]->model_value = !empty($model->model_value) ? $model->model_value : '';
            }
        }
        echo json_encode($outputData);
    }


    public function sendOTPConfirm()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $dataOutput = array();
        $insertRow = $this->User_model->otpNumber($data['phone_number'], $data['country_code'], $data['otp_number']);
        if (empty($insertRow)) {
            $dataOutput['is_active'] = 0;
        } else {
            $dataOutput['is_active'] = 1;
            $row = $this->User_model->otpNumberData($data['phone_number'], $data['country_code'], $data['otp_number']);

            if ($row == 0) {
                $dataOutput['active_page'] = 0;
            } else {
                $dataOutput['active_page'] = 1;
            }
        }
        echo json_encode($dataOutput);
    }


    public function add_edit_user()
    {

        $data = $this->input->post();


        foreach ($_FILES as $name => $fileInfo) {
            if (!empty($_FILES[$name]['name'])) {
                $newname = $this->upload($name);
                $data[$name] = $newname;
                $profile_pic = $newname;
            }
        }
        unset($data['fileOld']);
        unset($data['fileOlds']);
        unset($data['fileOldLic']);


        if (isset($data['edit'])) {
            unset($data['edit']);
        }

        if (isset($_FILES['profile_pic'])) {
            $data['profile_pic'] = !empty($data['profile_pic']) ? $data['profile_pic'] : $_POST['fileOld'];
        }

        if (isset($_FILES['upload_doc'])) {
            $data['upload_doc'] = !empty($data['upload_doc']) ? $data['upload_doc'] : $_POST['fileOld'];
        }

        if (isset($_FILES['upload_mot_doc'])) {
            $data['upload_mot_doc'] = !empty($data['upload_mot_doc']) ? $data['upload_mot_doc'] : $_POST['fileOlds'];
        }

        if (isset($_FILES['license'])) {
            $data['license'] = !empty($data['license']) ? $data['license'] : $_POST['fileOldLic'];
        }

        if (isset($_FILES['pco_doc'])) {
            $data['pco_doc'] = !empty($data['pco_doc']) ? $data['pco_doc'] : $_POST['fileOld'];
        }

        if (isset($_FILES['insurance_doc'])) {
            $data['insurance_doc'] = !empty($data['insurance_doc']) ? $data['insurance_doc'] : $_POST['fileOlds'];
        }
        if (isset($_FILES['license_pic'])) {
            $data['license_pic'] = !empty($data['license_pic']) ? $data['license_pic'] : $_POST['fileOlds'];
        }
        if ($this->input->post('users_id')) {
            unset($data['submit']);
            unset($data['save']);
            unset($data['users_id']);


            $this->User_model->updateRow('users', 'users_id', $this->input->post('users_id'), $data);
            $this->session->set_flashdata('message', 'Your data updated Successfully..');
            redirect(base_url() . 'user/dashboard', 'refresh');
        } else {

            unset($data['submit']);
            unset($data['save']);
            $data['users_id'] = $this->user_id;
            $data['password_mobile'] = $data['password'];
            $this->User_model->insertRow('users', $data);
            $this->session->set_flashdata('message', 'Your data inserted Successfully..');
            redirect(base_url() . 'user/dashboard', 'refresh');
        }
    }

    public function add_edit_fare()
    {
        $datas = $this->input->post();
        $i = 0;
        foreach ($datas['d_fare_name'] as $data) {
            $savedata['fare_name'] = $datas['d_fare_name'][$i];
            $savedata['fare_duration'] = $datas['d_fare_duration'][$i];
            $savedata['fare_price'] = $datas['d_fare_price'][$i];
            $savedata['fare_status'] = 'duration';
            $savedata['users_id'] = $this->user_id;
            $savedata['plan_id'] = $datas['plan_id'][$i];
            $savedata['is_deleted'] = 0;

            if (!empty($datas['d_fare_id'][$i])) {
                $this->User_model->updateRow('fare', 'fare_id', $datas['d_fare_id'][$i], $savedata);
                $this->session->set_flashdata('message', 'Your data updated Successfully..');
            } else {
                $this->User_model->insertRow('fare', $savedata);
                $this->session->set_flashdata('message', 'Your data inserted Successfully..');
            }

            $i++;
        }


        $j = 0;
        if (!empty($datas['m_fare_name'])) {
            foreach ($datas['m_fare_name'] as $data) {
                $savedata['fare_name'] = $datas['m_fare_name'][$j];
                $savedata['fare_duration'] = $datas['m_fare_duration'][$j];
                $savedata['fare_price'] = $datas['m_fare_price'][$j];
                $savedata['fare_status'] = 'mile';
                $savedata['plan_id'] = $datas['m_plan_id'][$j];
                $savedata['users_id'] = $this->user_id;
                $savedata['is_deleted'] = 0;

                if (!empty($datas['m_fare_id'][$j])) {
                    $this->User_model->updateRow('fare', 'fare_id', $datas['m_fare_id'][$j], $savedata);
                    $this->session->set_flashdata('message', 'Your data updated Successfully..');
                } else {
                    $this->User_model->insertRow('fare', $savedata);
                    $this->session->set_flashdata('message', 'Your data inserted Successfully..');
                }
                $j++;
            }
        }

        redirect(base_url() . 'user/dashboard', 'refresh');
    }

    public function faretypePrice()
    {
        header("Access-Control-Allow-Origin: *");
        $data_o = $this->input->post();
        $data = array();
        $this->db->select('*');
        $this->db->from('fare');
        $this->db->where('users_id', $data_o['driver_id']);
        $this->db->where('fare_status', $data_o['fare_type']);
        $query = $this->db->get();
        $result = $query->result();
        if (!empty($result)) {
            if ($data_o['fare_type'] == 'mile') {
                $r = array();
                $res = explode('/', $result[0]->fare_price);
                $r['per_mile'] = !empty($res[0]) ? $res[0] : '0.00';
                $r['per_min'] = !empty($res[1]) ? $res[1] : '0.00';
                $r['fare_id'] = $result[0]->fare_id;
                $data = $r;
            } else {
                $data = $result;
            }
        } else {

        }
        echo json_encode($data);
    }

    public function add_edit_fare_api()
    {
        header("Access-Control-Allow-Origin: *");
        $data_o = $this->input->post();

        if (!empty($data_o['fare_status']) && $data_o['fare_status'] == 'duration') {
            $savedata['fare_name'] = $data_o['fare_name'];
            $savedata['fare_duration'] = $data_o['fare_duration'];
            $savedata['fare_price'] = $data_o['fare_price'];
            $savedata['fare_status'] = $data_o['fare_status'];
            $savedata['is_deleted'] = 0;
            $this->User_model->updateRow('fare', 'fare_id', $data_o['fare_id'], $savedata);
        }

        if (!empty($data_o['fare_status']) && $data_o['fare_status'] == 'mile') {
            $row = getDataByid('fare', $data_o['fare_id'], 'fare_id');
            $price = explode('/', $row->fare_price);

            if ($data_o['fare_name'] == 'Per Mile') {
                $p = !empty($price[1]) ? $price[1] : '0.00';
                $savedata['fare_price'] = $data_o['fare_price'] . '/' . $p;
            }

            if ($data_o['fare_name'] == 'Per Min') {
                $p = !empty($price[0]) ? $price[0] : '0.00';
                $savedata['fare_price'] = $p . '/' . $data_o['fare_price'];
            }

            $this->User_model->updateRow('fare', 'fare_id', $data_o['fare_id'], $savedata);
            //$data_m['message'] = 'Your data updated Successfully..';
        }
        $data_m['message'] = 'Your data updated Successfully..';
        echo json_encode($data_m);
        exit;

    }

    public function deleteFare()
    {
        $data['is_deleted'] = 1;
        $this->User_model->updateRow('fare', 'fare_id', $this->input->post('id'), $data);
    }

    /**
     * This function is used to delete users
     * @return Void
     */
    public function delete($id)
    {
        is_login();
        $ids = explode('-', $id);
        foreach ($ids as $id) {
            $this->User_model->delete($id);
        }
        redirect(base_url() . 'user/userTable', 'refresh');
    }

    /**
     * This function is used to send invitation mail to users for registration
     * @return Void
     */
    public function InvitePeople()
    {
        is_login();
        if ($this->input->post('emails')) {
            $setting = settings();
            $var_key = $this->randomString();
            $emailArray = explode(',', $this->input->post('emails'));
            $emailArray = array_map('trim', $emailArray);
            $body = $this->User_model->get_template('invitation');
            $result['existCount'] = 0;
            $result['seccessCount'] = 0;
            $result['invalidEmailCount'] = 0;
            $result['noTemplate'] = 0;
            if (isset($body->html) && $body->html != '') {
                $body = $body->html;
                foreach ($emailArray as $mailKey => $mailValue) {
                    if (filter_var($mailValue, FILTER_VALIDATE_EMAIL)) {
                        $res = $this->User_model->get_data_by('users', $mailValue, 'email');
                        if (is_array($res) && empty($res)) {
                            $link = (string)'<a href="' . base_url() . 'user/registration?invited=' . $var_key . '">Click here</a>';
                            $data = array('var_user_email' => $mailValue, 'var_inviation_link' => $link);
                            foreach ($data as $key => $value) {
                                $body = str_replace('{' . $key . '}', $value, $body);
                            }
                            if ($setting['mail_setting'] == 'php_mailer') {
                                $this->load->library("send_mail");
                                $emm = $this->send_mail->email('Invitation for registration', $body, $mailValue, $setting);
                            } else {
                                // content-type is required when sending HTML email
                                $headers = "MIME-Version: 1.0" . "\r\n";
                                $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                                $headers .= 'From: ' . $setting['EMAIL'] . "\r\n";
                                $emm = mail($mailValue, 'Invitation for registration', $body, $headers);
                            }
                            if ($emm) {
                                $darr = array('email' => $mailValue, 'var_key' => $var_key);
                                $this->User_model->insertRow('users', $darr);
                                $result['seccessCount'] += 1;;
                            }
                        } else {
                            $result['existCount'] += 1;
                        }
                    } else {
                        $result['invalidEmailCount'] += 1;
                    }
                }
            } else {
                $result['noTemplate'] = 'No Email Template Availabale.';
            }
        }
        echo json_encode($result);
        exit;
    }

    /**
     * This function is used to Check invitation code for user registration
     * @return TRUE/FALSE
     */
    public function chekInvitation()
    {
        if ($this->input->post('code') && $this->input->post('code') != '') {
            $res = $this->User_model->get_data_by('users', $this->input->post('code'), 'var_key');
            $result = array();
            if (is_array($res) && !empty($res)) {
                $result['email'] = $res[0]->email;
                $result['users_id'] = $res[0]->users_id;
                $result['result'] = 'success';
            } else {
                $this->session->set_flashdata('messagePr', 'This code is not valid..');
                $result['result'] = 'error';
            }
        }
        echo json_encode($result);
        exit;
    }

    /**
     * This function is used to registr invited user
     * @return Void
     */
    public function register_invited($id)
    {
        $data = $this->input->post();
        $password = password_hash($this->input->post('password'), PASSWORD_DEFAULT);
        $data['password'] = $password;
        $data['var_key'] = NULL;
        $data['is_deleted'] = 0;
        $data['status'] = 'active';
        $data['user_id'] = 1;
        if (isset($data['password_confirmation'])) {
            unset($data['password_confirmation']);
        }
        if (isset($data['call_from'])) {
            unset($data['call_from']);
        }
        if (isset($data['submit'])) {
            unset($data['submit']);
        }
        $this->User_model->updateRow('users', 'users_id', $id, $data);
        $this->session->set_flashdata('messagePr', 'Successfully Registered..');
        redirect(base_url() . 'user/login', 'refresh');
    }

    /**
     * This function is used to check email is alredy exist or not
     * @return TRUE/FALSE
     */
    public function checEmailExist()
    {
        $result = 1;
        $res = $this->User_model->get_data_by('users', $this->input->post('email'), 'email');
        if (!empty($res)) {
            if ($res[0]->users_id != $this->input->post('uId')) {
                $result = 0;
            }
        }
        echo $result;
        exit;
    }

    /**
     * This function is used to Generate a token for varification
     * @return String
     */
    public function generate_token()
    {
        $alpha = "abcdefghijklmnopqrstuvwxyz";
        $alpha_upper = strtoupper($alpha);
        $numeric = "0123456789";
        $special = ".-+=_,!@$#*%<>[]{}";
        $chars = $alpha . $alpha_upper . $numeric;
        $token = '';
        $up_lp_char = $alpha . $alpha_upper . $special;
        $chars = str_shuffle($chars);
        $token = substr($chars, 10, 10) . strtotime("now") . substr($up_lp_char, 8, 8);
        return $token;
    }

    /**
     * This function is used to Generate a random string
     * @return String
     */
    public function randomString()
    {
        $alpha = "abcdefghijklmnopqrstuvwxyz";
        $alpha_upper = strtoupper($alpha);
        $numeric = "0123456789";
        $special = ".-+=_,!@$#*%<>[]{}";
        $chars = $alpha . $alpha_upper . $numeric;
        $pw = '';
        $chars = str_shuffle($chars);
        $pw = substr($chars, 8, 8);
        return $pw;
    }


    public function sign_up()
    {
        $this->load->view('include/script');
        $query = $this->db->query("SELECT make_id, make_name from make");
        $data['makes'] = $query->result_array();
        $this->load->view('sign_up_page', $data);
    }

    public function get_models()
    {
        $id = $this->input->post('id');
        $query = $this->db->query("SELECT model_id, model_name from model WHERE make_id=" . $id);
        $result = $query->result_array();
        echo json_encode($result);
    }

    public function get_colours()
    {
        $id = $this->input->post('id');
        $query = $this->db->query("SELECT colours_id, colours_name from colours WHERE make_id=" . $id);
        $result = $query->result_array();
        echo json_encode($result);
    }

    public function getModelVal()
    {

        $res = $this->User_model->get_data_bys('model', $this->input->post('make_id'), 'make_id');
        $option = '';
        foreach ($res as $reidd) {
            $option .= '<option value="' . $reidd->model_id . '" >' . $reidd->model_value . '</option>';
        }
        echo '<select class="form-control" id="model" name="model">
        <option value="">Select</option>
        ' . $option . '
    </select>';


    }

    public function calendar()
    {
        is_login();
        if (!isset($id) || $id == '') {
            $id = $this->session->userdata('user_details')[0]->users_id;
        }
        $data['user_data'] = $this->User_model->get_users($id);
        //$data['planDatas'] = getAllDataTable('plan','','');
        $data['bookDatas'] = $this->User_model->getAllBooking($id);
        $this->load->view('include/script');
        $this->load->view('calendar_view', $data);
    }

    public function getAllBooking()
    {
        is_login();
        if (!isset($id) || $id == '') {
            $id = $this->session->userdata('user_details')[0]->users_id;
        }
        $bookDatas = $this->User_model->getAllBooking($id);
        //$bookDatas = getAllBooking('booking_time_slot',$id,'driver_id','','status');
        // $client = clientDetails($bookDatas[0]->client_id);
        $events = array();
        foreach ($bookDatas as $key => $bookData) {
            $data = array();
            $data['id'] = $bookData->client_id;
            $data['title'] = $bookData->client_first_name . ' ' . $bookData->client_last_name;
            $data['start'] = $bookData->date_time_slot;
            $data['end'] = $bookData->date_time_slot;
            array_push($events, $data);
        }

        echo json_encode($events);
        exit;
    }

    public function getBooking()
    {
        $id = $this->input->post('eventid');
        $bookData = $this->User_model->getBooking($id);

        $data['datetime'] = strtoupper(date('l, F d, Y', strtotime($bookData->date_time_slot)));
        $data['duration'] = convertToHoursMins($bookData->book_duration, $format = '%02d:%02d');
        $data['heading'] = strtoupper(date('H:i', strtotime($bookData->date_time_slot)));
        $data['client_name'] = strtoupper($bookData->client_first_name) . ' ' . strtoupper($bookData->client_last_name);
        $data['client_phone'] = strtoupper($bookData->client_phone);
        $data['time_slot'] = strtoupper(date('H:i', strtotime($bookData->date_time_slot))) . '-' . strtoupper(date('H:i', strtotime(date('Y-m-d H:i', strtotime($bookData->date_time_slot) + $bookData->book_duration * 60))));
        $data['fare_name'] = strtoupper(fare($bookData->fare_id, 'fare_name'));

        $data['status'] = 'success';
        echo json_encode($data);
        exit;
    }

    public function bookingDetails()
    {
        is_login();
        if (!isset($id) || $id == '') {
            $id = $this->session->userdata('user_details')[0]->users_id;
        }
        $data['status'] = ($this->input->post('filter')) ? $this->input->post('filter') : '';
        $data['user_data'] = $this->User_model->get_users($id);
        //$data['planDatas'] = getAllDataTable('plan','','');
        $data['bookDatasRecord'] = 0;
        $data['bookDatas'] = $this->User_model->getAllBooking($id);
        if (!empty($data['status']) && $data['status'] != 'pending') {
            $data['bookDatasRecord'] = $this->User_model->getAllBookingStatus($id, $data['status']);
        } else {
            $data['bookDatasRecord'] = count($data['bookDatas']);
        }
        $this->load->view('include/script');
        $this->load->view('booking_view', $data);

    }

    /*
    public function bookingInfo($id){
        $bookDatas = $this->User_model->getAllBooking($id);
        foreach($bookDatas as $bookData){
           $bookDatas->myRatting = $bookData->client_id;
        }
        
        echo json_encode($bookDatas);
        exit;
    }*/
    public function bookingInfo($id)
    {
        $bookDatas = $this->User_model->getAllBooking($id);
        $i = 0;
        foreach ($bookDatas as $bookData) {
            $bookDatas[$i]->myRatting = ratting($bookData->client_id);
            $i++;
        }

        echo json_encode($bookDatas);
        exit;
    }

    public function bookingSingleInfo($id)
    {
        $bookDatas = $this->User_model->getSingleBooking($id);
        echo json_encode($bookDatas);
        exit;
    }

    public function submitForm()
    {
        $data = $this->input->post();
        $postoldfiles = array();
        foreach ($data as $okey => $ovalue) {
            if (strstr($okey, "wpb_old_")) {
                $postoldfiles[$okey] = $ovalue;
            }
        }
        $newfiles = array();
        foreach ($_FILES as $fkey => $fvalue) {
            if (!empty($fvalue['name'])) {
                foreach ($fvalue['name'] as $key => $fileInfo) {
                    if (!empty($_FILES[$fkey]['name'][$key])) {
                        $filename = $_FILES[$fkey]['name'][$key];
                        $tmpname = $_FILES[$fkey]['tmp_name'][$key];
                        $exp = explode('.', $filename);
                        $ext = end($exp);
                        $newname = $exp[0] . '_' . time() . "." . $ext;
                        $config['upload_path'] = 'assets/images/';
                        $config['upload_url'] = base_url() . 'assets/images/';
                        $config['allowed_types'] = "gif|jpg|jpeg|png|iso|dmg|zip|rar|doc|docx|xls|xlsx|ppt|pptx|csv|ods|odt|odp|pdf|rtf|sxc|sxi|txt|exe|avi|mpeg|mp3|mp4|3gp";
                        $config['max_size'] = '2000000';
                        $config['file_name'] = $newname;
                        $this->load->library('upload', $config);
                        move_uploaded_file($tmpname, "assets/images/" . $newname);
                        $newfiles[$fkey][] = $newname;
                    } else {
                        $newfiles[$fkey] = '';

                    }
                }
            }
            if (!empty($postoldfiles)) {

                if (!empty($postoldfiles['wpb_old_' . $fkey])) {
                    $oldfiles = $postoldfiles['wpb_old_' . $fkey];
                } else {
                    $oldfiles = array();
                }
                if (!empty($newfiles[$fkey])) {
                    $all_files = array_merge($oldfiles, $newfiles[$fkey]);
                } else {
                    $all_files = $postoldfiles['wpb_old_' . $fkey];
                }

            } else {
                $all_files = !empty($newfiles) ? $newfiles[$fkey] : array();
            }
            if (!empty($all_files)) {
                $data[$fkey] = implode(',', $all_files);
            }

        }

        if ($this->input->post('users_id')) {
            foreach ($postoldfiles as $pkey => $pvalue) {
                unset($data[$pkey]);
            }
            unset($data['submit']);
            unset($data['save']);
            unset($data['users_id']);

            foreach ($data as $dkey => $dvalue) {
                if (is_array($dvalue)) {
                    $data[$dkey] = implode(',', $dvalue);
                }
            }
            $this->User_model->updateRow('users', 'users_id', $this->input->post('users_id'), $data);
            $this->session->set_flashdata('message', 'Your data updated Successfully..');
            redirect(base_url() . 'user/dashboard', 'refresh');
        } else {
            unset($data['submit']);
            unset($data['save']);
            $data['user_id'] = $this->user_id;
            $data['is_deleted'] = 0;
            $data['status'] = 'Pending';
            $data['user_type'] = 'user';
            $data['telephone'] = str_replace(' ', '', $data['telephone']);
            $data['mobile_number'] = str_replace(' ', '', $data['mobile_number']);
            $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
            $data['password_mobile'] = $data['password'];
            foreach ($data as $dkey => $dvalue) {
                if (is_array($dvalue)) {
                    $data[$dkey] = implode(',', $dvalue);
                }
            }
            $id = $this->User_model->insertRow('users', $data);

            $dataId['encrypt_user_id'] = encrypt_id($id);
            $dataId['users_id'] = $id;

            $this->User_model->updateRow('users', 'id', $id, $dataId);

            $model = getDataByid('model', $this->input->post('model'), 'model_id');

            $category = !empty($model->category) ? $model->category : '';

            $plans_names = getAllDataTables('plans_names', $category, 'category');

            if (!empty($plans_names)) {
                foreach ($plans_names as $plans_name) {
                    $newFare['users_id'] = $id;
                    $newFare['plan_id'] = $plans_name->id;
                    $newFare['fare_name'] = $plans_name->plan_name;
                    $newFare['fare_duration'] = $plans_name->hour_ride;
                    $newFare['fare_price'] = $plans_name->plan_price;
                    $newFare['fare_status'] = $plans_name->type;
                    $newFare['is_deleted'] = 0;
                    $this->User_model->insertRow('fare', $newFare);
                }
            }

            $this->db->select('*');
            $this->db->from('set_availabilities');
            $this->db->where('deleted_at IS NULL', null);
            $query = $this->db->get();
            $set_availabilitie = $query->row();
            $set_availabilities = json_decode(json_encode($set_availabilitie), true);
            unset($set_availabilities['deleted_at']);
            unset($set_availabilities['created_at']);
            unset($set_availabilities['updated_at']);
            unset($set_availabilities['id']);
            $set_availabilities['users_id'] = $id;
            $this->User_model->insertRow('availability', $set_availabilities);

            $this->session->set_flashdata('message', 'Your data inserted Successfully..');
            $return = $this->User_model->auth_user();

            if (empty($return)) {
                $this->session->set_flashdata('messagePr', 'Invalid details');
                redirect(base_url() . 'user/login', 'refresh');
            } else {
                if ($return == 'not_varified') {
                    $this->session->set_flashdata('messagePr', 'This account is not verified. Please contact to your admin..');
                    redirect(base_url() . 'user/login', 'refresh');
                } else {
                    /*mkaPackageCodeAuth*/
                    $this->session->set_userdata('user_details', $return);
                }
                redirect(base_url() . 'user/subscription', 'refresh');
            }

        }
    }

    public function favDeletDriver()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $client_id = isset($data['client_id']) ? $data['client_id'] : 0;
        $driver_id = isset($data['driver_id']) ? $data['driver_id'] : 0;
        $data['re'] = $this->User_model->deleteFavouriteDriver($driver_id, $client_id);
        echo json_encode($data);
        // echo"<pre>"; print($data);die;
    }

    public function sendGetClientBooking($client_id = '')
    {
        header("Access-Control-Allow-Origin: *");
        $baseURL = base_url() . 'assets/images/';
        if (empty($client_id)) {
            $data = $this->input->post();
            $client_id = $data['client_id'];
        }

        $rider_Type = isset($data['rider_Type']) ? $data['rider_Type'] : 'all';
        $dataOutput = $dataOutput1 = array();
        $dataOutput = $this->User_model->getAllBookingClient($client_id, $rider_Type);

        $rows = array();

        if ($rider_Type == 'upcoming') {
            $uprows = getAllDataTables('appointments');
            foreach ($uprows as $key => $val) {
                $rows[] = $val->rides_id;
            }
        }
        $i = 0;
        foreach ($dataOutput as $key => $val) {

            if (!in_array($val['book_id'], $rows)) {

                $dataOutput1[$i]['booking_time_slot_date_time_slot'] = isset($val['booking_time_slot_date_time_slot']) ? $val['booking_time_slot_date_time_slot'] : date();
                $dataOutput1[$i]['fullname'] = isset($val['fullname']) ? $val['fullname'] : 'None';
                $dataOutput1[$i]['first_name'] = isset($val['user_first_name']) ? $val['user_first_name'] : 'None';
                $dataOutput1[$i]['last_name'] = isset($val['user_last_name']) ? $val['user_last_name'] : 'None';
                $dataOutput1[$i]['amount'] = isset($val['amount']) ? $val['amount'] : 'None';
                $dataOutput1[$i]['client_collection_point'] = isset($val['client_collection_point']) ? $val['client_collection_point'] : '';
                $dataOutput1[$i]['drop_point'] = isset($val['drop_point']) ? $val['drop_point'] : '';
                $dataOutput1[$i]['profile_pic'] = isset($val['profile_pic']) ? $baseURL . '' . $val['profile_pic'] : $baseURL . 'user.png';
                $dataOutput1[$i]['booking_time_slot_driver_id'] = isset($val['booking_time_slot_driver_id']) ? $val['booking_time_slot_driver_id'] : '';
                $dataOutput1[$i]['booking_time_slot_book_id'] = isset($val['booking_time_slot_book_id']) ? $val['booking_time_slot_book_id'] : '';
                $dataOutput1[$i]['booking_time_slot_status'] = isset($val['booking_time_slot_status']) ? $val['booking_time_slot_status'] : '';
                $dataOutput1[$i]['booking_phone'] = isset($val['client_phone']) ? '+' . $val['country_code'] . ' ' . $val['client_phone'] : '';
                $dataOutput1[$i]['book_id'] = isset($val['book_id']) ? $val['book_id'] : '';
                $dataOutput1[$i]['fare_name'] = isset($val['fare_name']) ? $val['fare_name'] : '';
                $i++;

            }
        }

        echo json_encode($dataOutput1);
    }

    public function createPreferpences($client_id = '')
    {
        header("Access-Control-Allow-Origin: *");
        $baseURL = base_url() . 'assets/images/';
        $data = $this->input->post();
        $outputData = $this->User_model->createPreferpences($data);
        echo json_encode($outputData);
    }

    public function getPreferpencesClient()
    {
        header("Access-Control-Allow-Origin: *");
        $baseURL = base_url() . 'assets/images/';
        $data = $this->input->post();
        $client_id = isset($data['client_id']) ? $data['client_id'] : '';
        $dataOutput = $dataOutput1 = array();
        $dataOutput = $this->User_model->getPreferpencesClient($client_id);
        // echo"<PRE>";print_r($data);print_r($dataOutput); die;  
        echo json_encode($dataOutput);
    }

    public function getrattinfDriverById($data = array())
    {
        header("Access-Control-Allow-Origin: *");
        $baseURL = base_url() . 'assets/images/';
        $data = $this->input->post();
        $dataOutput = $dataOutput1 = array();
        $dataOutput = $this->User_model->getrattinfDriverById($data);
        // echo"<PRE>";print_r($data);print_r($dataOutput); die;
        echo json_encode($dataOutput);
    }

    public function getrattingClientById($data = array())
    {
        header("Access-Control-Allow-Origin: *");
        $baseURL = base_url() . 'assets/images/';
        $data = $this->input->post();
        $dataOutput = $dataOutput1 = array();
        $dataOutput = $this->User_model->getrattingClientById($data);
        $dataOutput->client_name = $this->User_model->getClientName($dataOutput->client_id);
        $dataOutput->status = 'success';
        echo json_encode($dataOutput);
    }

    public function rattingDriver()
    {
        header("Access-Control-Allow-Origin: *");
        $baseURL = base_url() . 'assets/images/';
        $data = $this->input->post();
        //$client_id = isset($data['client_id'])?$data['client_id']:'';
        $dataOutput = $dataOutput1 = array();
        $dataOutput = $this->User_model->rattingDriver($data);
        // echo"<PRE>";print_r($data);print_r($dataOutput); die;
        echo json_encode($data);
    }

    public function getRattingsAndCommentsDriverId($driver_id = '', $type = '')
    {
        header("Access-Control-Allow-Origin: *");
        $baseURL = base_url() . 'assets/images/';
        if (empty($driver_id)) {
            $data = $this->input->post();
            $driver_id = isset($data['driver_id']) ? $data['driver_id'] : '';
        }
        $dataOutput = $dataOutput1 = array();
        $sumArray = array();
        $amount = array();
        $i = 0;
        $dataOutput = $this->User_model->getRattingsAndCommentsDriverId($driver_id);
        foreach ($dataOutput as $bank) {
            $index = $this->ratting_existsDriver($bank['ratting_driver_id'], $amount);
            if ($index < 0) {
                $amount[] = $bank;
            } else {
                $amount[$index]['rate'] += $bank['rate'];
                $amount[$index]['total'] = count($dataOutput);
            }
            $i++;
            $amount['comments'][] = $bank['ratting_Comments'];
        }
        if (!empty($amount)) {
            $res = isset($amount[0]) ? $amount[0] : array('rate' => '', 'total' => '');
            $ratting = $res['rate'] / $res['total'];
            $ratting = round($ratting, 0);
            $dataOutput1 = array('myRating' => $ratting, 'comments' => $amount['comments']);
            if ($type == 'return') {
                return $dataOutput1;
            } else {
                echo json_encode($dataOutput1);
            }
        } else {
            if ($type == 'return') {
                return array('myRating' => 0, 'comments' => array());
            } else {
                echo json_encode(array('myRating' => 0, 'comments' => array()));
            }
        }
    }

    function ratting_existsDriver($bankname, $array)
    {
        $result = -1;
        for ($i = 0; $i < sizeof($array); $i++) {
            if ($array[$i]['ratting_driver_id'] == $bankname) {
                $result = $i;
                break;
            }
        }
        return $result;
    }

    public function settingClientSave($data = array())
    {
        header("Access-Control-Allow-Origin: *");
        $baseURL = base_url() . 'assets/images/';
        $data = $this->input->post();
        $dataOutput = $dataOutput1 = array();
        $dataOutput = $this->User_model->settingClientSave($data);
        $dataOutput->urlIMG = $baseURL;
        // echo"<PRE>";print_r($data);print_r($dataOutput);
        //  die;//
        echo json_encode($dataOutput);
    }


    public function home_page_message()
    {
        header("Access-Control-Allow-Origin: *");
        $baseURL = base_url() . 'assets/images/';
        $data = $this->input->post();
        $dataOutput = $dataOutput1 = array();
        $dataOutput = getAllDataTable('home_page_messages', 1, 'id');
        $dataOutput[0]->urlIMG = $baseURL;
        echo json_encode($dataOutput);
    }

    public function subcriptionPassengerAll()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $dataOutput = getAllDataTables('passenger_subscriptions');
        echo json_encode($dataOutput);

    }

    public function rattingClient()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $dataOutput = $this->User_model->insertRow('rattingclient', $data);
        echo json_encode($dataOutput);

    }

    public function cancel_subscription($id)
    {
        $data['status'] = 'Canceled';
        $this->User_model->updateRow('users', 'users_id', $id, $data);
        redirect(base_url() . 'user/dashboard');
    }

    public function renew_subscription()
    {
        $subscriptions = $this->User_model->get_subscription();

        foreach ($subscriptions as $key => $subscription) {
            $status = checkApproved($subscription->users_id);
            if ($status == 'Approved') {
                $result = $this->braintree_lib->clone_transaction($subscription->plan_amount, $subscription->transaction_id);

                if ($result->success || !is_null($result->transaction)) {
                    $transaction = $result->transaction;

                    $data['transaction_id'] = $transaction->id;
                    $data['plan_name'] = $subscription->plan_name;
                    $data['plan_id'] = $subscription->plan_id;
                    $data['plan_amount'] = $subscription->plan_amount;
                    $data['users_id'] = $subscription->users_id;
                    $data['expire_date'] = expireDate($subscription->plan_id, $subscription->expire_date);
                    $this->User_model->insertRow('subscription', $data);
                    $dataUpdate['is_clone'] = 1;
                    $this->User_model->updateRow('subscription', 'subs_id', $subscription->subs_id, $dataUpdate);
                }
            }
        }
    }

    public function renew_subscription_passenger()
    {
        $subscriptions = $this->User_model->get_subscription_passenger();

        foreach ($subscriptions as $key => $subscription) {

            $sale = array(
                'customerId' => $subscription->braintree_cust_id,
                'amount' => $subscription->subscription_price,
                'orderId' => $subscription->invoiceid,
                'options' => array('submitForSettlement' => true)
            );
            $result = $this->braintree_lib->sale_transaction($sale);

            if ($result->success || !is_null($result->transaction)) {
                $transaction = $result->transaction;

                $data['transaction_id'] = $transaction->id;
                $data['first_name'] = $subscription->first_name;
                $data['last_name'] = $subscription->last_name;
                $data['postal_code'] = $subscription->postal_code;
                $data['braintree_cust_id'] = $subscription->braintree_cust_id;
                $data['invoiceid'] = $subscription->invoiceid;
                $data['client_id'] = $subscription->client_id;
                $data['subscription_driver'] = $subscription->subscription_driver;
                $data['subscription_id'] = $subscription->subscription_id;
                $data['subscription_price'] = $subscription->subscription_price;
                $data['is_clone'] = $subscription->is_clone;

                $this->User_model->insertRow('passenger_subs', $data);
                $dataUpdate['is_clone'] = 1;
                $this->User_model->updateRow('passenger_subs', 'passenger_subs_id', $subscription->passenger_subs_id, $dataUpdate);
            }

        }
    }

    public function driverInfo()
    {
        header("Access-Control-Allow-Origin: *");
        $data = $this->input->post();
        $dataOutput = getDataByid('users', $data['driver_id'], 'users_id');
        $dataOutput->ratting = rattingDriver($data['driver_id']);
        echo json_encode($dataOutput);
    }
}