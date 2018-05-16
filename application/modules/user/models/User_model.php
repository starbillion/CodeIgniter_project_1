<?php

class User_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        $this->user_id = isset($this->session->get_userdata()['user_details'][0]->id) ? $this->session->get_userdata()['user_details'][0]->users_id : '1';
    }

    /**
     * This function is used authenticate user at login
     */
    function auth_user()
    {
        $email = $this->input->post('email');
        $password = $this->input->post('password');
        $this->db->where("deleted_at IS NULL AND (name='$email' OR email='$email')");

        $result = $this->db->get('users')->result();

        if (!empty($result)) {
            if (password_verify($password, $result[0]->password)) {
                if ($result[0]->status == 'Suspended') {
                    return 'not_varified';
                }
                return $result;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * This function is used to delete user
     * @param: $id - id of user table
     */
    function delete($id = '')
    {
        $this->db->where('users_id', $id);
        $this->db->delete('users');
    }

    /**
     * This function is used to delete user
     * @param: $id - id of user table
     */
    function deleteRow($id = '', $table = '', $col = '')
    {
        $this->db->where($col, $id);
        $this->db->delete($table);
    }

    /**
     * This function is used to load view of reset password and varify user too
     */
    function mail_varify()
    {
        $ucode = $this->input->get('code');
        $this->db->select('email as e_mail');
        $this->db->from('users');
        $this->db->where('var_key', $ucode);
        $query = $this->db->get();
        $result = $query->row();
        if (!empty($result->e_mail)) {
            return $result->e_mail;
        } else {
            return false;
        }
    }

    function CheckEmail()
    {
        $email = $this->input->post('email');
        $this->db->from('users');
        $this->db->where('email', $email);
        $query = $this->db->get();
        $result = $query->row();
        if (!empty($result->email)) {
            echo json_encode(array(
                'valid' => false,
            ));
        } else {
            echo json_encode(array(
                'valid' => true,
            ));
        }
    }

    function CheckUserName()
    {
        $name = $this->input->post('name');
        $this->db->from('users');
        $this->db->where('name', $name);
        $query = $this->db->get();
        $result = $query->row();
        if (!empty($result->email)) {
            echo json_encode(array(
                'valid' => false,
            ));
        } else {
            echo json_encode(array(
                'valid' => true,
            ));
        }
    }

    function otpNumber($phone_number, $country_code, $otp_number = '')
    {
        $this->db->select('client_id');
        $this->db->from('client_details');
        $this->db->where('client_phone', $phone_number);
        $this->db->where('country_code', $country_code);
        if (!empty($otp_number)) {
            $this->db->where('otp_number', $otp_number);
        }
        $query = $this->db->get();
        $result = $query->row();
        if (!empty($result->client_id)) {
            return $result->client_id;
        } else {
            return array();
        }
    }

    function otpNumberData($phone_number, $country_code, $otp_number = '')
    {
        $this->db->select('*');
        $this->db->from('client_details');
        $this->db->where('client_phone', $phone_number);
        $this->db->where('country_code', $country_code);
        if (!empty($otp_number)) {
            $this->db->where('otp_number', $otp_number);
        }
        $query = $this->db->get();
        $result = $query->row();
        if (!empty($result->client_id) && !empty($result->client_first_name) && !empty($result->client_last_name) && !empty($result->client_email)) {
            return 1;
        } else {
            return 0;
        }
    }

    function favDriver($driver_id, $client_id)
    {
        $this->db->select('favourite_driver_id');
        $this->db->from('favourite_driver');
        $this->db->where('driver_id', $driver_id);
        $this->db->where('client_id', $client_id);
        $query = $this->db->get();
        $result = $query->row();
        if (!empty($result->favourite_driver_id)) {
            return $result->favourite_driver_id;
        } else {
            return array();
        }
    }


    function favDrivers($client_id)
    {
        $this->db->select('users.*');
        $this->db->from('users');
        $this->db->join('favourite_driver', 'favourite_driver.driver_id = users.users_id');
        $this->db->where('favourite_driver.client_id', $client_id);
        $query = $this->db->get();
        $result = $query->result();

        if (!empty($result)) {
            return $result;
        } else {
            return array();
        }
    }

    function favDriversInfo($client_id, $driver_id)
    {
        $this->db->select('users.*');
        $this->db->from('users');
        $this->db->join('favourite_driver', 'favourite_driver.driver_id = users.users_id');
        $this->db->where('favourite_driver.client_id', $client_id);
        $this->db->where('favourite_driver.driver_id', $driver_id);
        $query = $this->db->get();
        $result = $query->result();
        if (!empty($result)) {
            return $result;
        } else {
            return array();
        }
    }

    /**
     * This function is used Reset password
     */
    function ResetPpassword()
    {
        $email = $this->input->post('email');
        if ($this->input->post('password_confirmation') == $this->input->post('password')) {
            $npass = password_hash($this->input->post('password'), PASSWORD_DEFAULT);
            $data['password'] = $npass;
            $data['var_key'] = '';
            return $this->db->update('users', $data, "email = '$email'");
        }
    }

    /**
     * This function is used to select data form table
     */
    function get_data_by($tableName = '', $value = '', $colum = '', $condition = '')
    {
        if ((!empty($value)) && (!empty($colum))) {
            $this->db->where($colum, $value);
        }

        $this->db->select('*');
        $this->db->from($tableName);
        $query = $this->db->get();
        return $query->result();
    }

    /**
     * This function is used to select data form table
     */
    function get_data_bys($tableName = '', $value = '', $colum = '', $condition = '')
    {
        if ((!empty($value)) && (!empty($colum))) {
            $this->db->where($colum, $value);
        }
        $this->db->where('deleted_at IS NULL', null);
        $this->db->select('*');
        $this->db->from($tableName);
        $query = $this->db->get();
        return $query->result();
    }

    /**
     * This function is used to check user is alredy exist or not
     */
    function check_exists($table = '', $colom = '', $colomValue = '', $id = '', $id_CheckCol = '')
    {
        $this->db->where($colom, $colomValue);
        if (!empty($id) && !empty($id_CheckCol)) {
            $this->db->where($id_CheckCol . ' !=', $id);
        }
        $res = $this->db->get($table)->row();
        if (!empty($res)) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * This function is used to get users detail
     */
    function get_users($userID = '')
    {
        //$this->db->where('is_deleted', '0');
        if (isset($userID) && $userID != '') {
            $this->db->where('id', $userID);
        } else if ($this->session->userdata('user_details')[0]->user_type == 'admin') {
            $this->db->where('user_type', 'admin');
        } else {
            $this->db->where('users.users_id !=', '1');
        }
        $result = $this->db->get('users')->result();
        return $result;
    }

    /**
     * This function is used to get email template
     */
    function get_template($code)
    {
        $this->db->where('code', $code);
        return $this->db->get('templates')->row();
    }

    /**
     * This function is used to Insert record in table
     */
    public function insertRow($table, $data)
    {
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }

    /**
     * This function is used to Update record in table
     */
    public function updateRow($table, $col, $colVal, $data)
    {
        $this->db->where($col, $colVal);
        $this->db->update($table, $data);
        return true;
    }

    /*  	public function get_list_box_data($qr) {
              $exe = $this->db->query($qr);
              return $exe->result();
          }
    */
    public function getQrResult($qr)
    {
        $exe = $this->db->query($qr);
        return $exe->result();
    }

    public function getAllBooking($driver_id)
    {
        $this->db->select('client_details.*,booking_time_slot.*,fare.fare_name,payments.plan_amount');
        $this->db->from('booking_time_slot');
        $this->db->where('booking_time_slot.driver_id', $driver_id);
        $this->db->join('client_details', 'client_details.client_id = booking_time_slot.client_id', 'right');
        $this->db->join('payments', 'payments.book_id = booking_time_slot.book_id', 'right');
        $this->db->join('fare', 'fare.id = booking_time_slot.fare_id', 'left');
        $this->db->order_by("booking_time_slot.date_time_slot", "ASC");
        $query = $this->db->get();
        return $query->result();
    }

    public function getAllBookingStatus($driver_id, $Status)
    {
        $this->db->select('client_details.*,booking_time_slot.*');
        $this->db->from('client_details');
        $this->db->where('client_details.driver_id', $driver_id);
        $this->db->where('appointments.rides_status', $Status);
        $this->db->join('payments', 'payments.client_id = client_details.client_id', 'right');
        $this->db->join('booking_time_slot', 'booking_time_slot.client_id = payments.client_id', 'right');
        $this->db->join('appointments', 'appointments.rides_id = booking_time_slot.book_id', 'right');
        $query = $this->db->get();
        return count($query->result());
    }

    public function getBooking($client_id)
    {
        $this->db->select('client_details.*,booking_time_slot.*');
        $this->db->from('client_details');
        $this->db->where('client_details.client_id', $client_id);
        $this->db->join('payments', 'payments.client_id = client_details.client_id', 'right');
        $this->db->join('booking_time_slot', 'booking_time_slot.client_id = payments.client_id', 'right');
        $query = $this->db->get();
        return $query->row();
    }

    public function getSingleBooking($book_id)
    {
        $this->db->select('client_details.*,booking_time_slot.*,fare.*');
        $this->db->from('booking_time_slot');
        $this->db->where('booking_time_slot.book_id', $book_id);
        $this->db->join('client_details', 'client_details.client_id = booking_time_slot.client_id', 'left');
        $this->db->join('payments', 'payments.book_id = booking_time_slot.book_id', 'left');
        $this->db->join('fare', 'fare.fare_id = booking_time_slot.fare_id', 'left');
        $query = $this->db->get();
        return $query->row();
    }

    public function get_bar_chart_data($qr)
    {
        $exe = $this->db->query($qr);
        $res = $exe->result();
        $result = [];
        $i = 1;
        while ($i <= 12) {
            $result[$i] = 0;
            foreach ($res as $key => $value) {
                if ($value->months == $i) {
                    //$result[$i] += $value->mka_sum;
                    $result[$i] += ( int )str_replace(',', '', $value->mka_sum);
                }
            }
            $i++;
        }
        return implode(',', $result);
    }

    public function getAllBookingClient($client_id, $rider_Type = 'all')
    {
        if ($rider_Type == 'upcoming') {
            $this->db->select('client_details.*,booking_time_slot.book_id AS booking_time_slot_book_id,
		booking_time_slot.client_id AS booking_time_slot_client_id,
		booking_time_slot.driver_id AS booking_time_slot_driver_id,
		booking_time_slot.date_time_slot AS booking_time_slot_date_time_slot,
		booking_time_slot.book_duration AS booking_time_slot_book_duration,
		booking_time_slot.status AS booking_time_slot_status_p1,
		booking_time_slot.payment_status AS booking_time_slot_status,
		booking_time_slot.created_at AS booking_time_slot_created_at,
		booking_time_slot.client_collection_point AS client_collection_point,
		booking_time_slot.drop_point AS drop_point,
		users.name AS driver_name,users.fullname AS fullname,users.first_name AS user_first_name,users.last_name AS user_last_name,users.profile_pic,payments.*,fare.fare_name as fare_name');
            $this->db->from('client_details');
            $this->db->where('booking_time_slot.date_time_slot >=', date('Y-m-d H:i:s'));
            $this->db->where('payments.client_id', $client_id);
            $this->db->join('booking_time_slot', 'booking_time_slot.client_id = client_details.client_id', 'left');
            $this->db->join('payments', 'payments.book_id = booking_time_slot.book_id', 'right');
            $this->db->join('users', 'users.users_id = booking_time_slot.driver_id', 'left');
            $this->db->join('fare', 'fare.fare_id = booking_time_slot.fare_id', 'left');
            $this->db->order_by("booking_time_slot.date_time_slot", "ASC");
            $query = $this->db->get();
        } else if ($rider_Type == 'past') {
            $this->db->select('client_details.*,booking_time_slot.book_id AS booking_time_slot_book_id,
		booking_time_slot.client_id AS booking_time_slot_client_id,
		booking_time_slot.driver_id AS booking_time_slot_driver_id,
		booking_time_slot.date_time_slot AS booking_time_slot_date_time_slot,
		booking_time_slot.book_duration AS booking_time_slot_book_duration,
		booking_time_slot.status AS booking_time_slot_status_p1,
		booking_time_slot.payment_status AS booking_time_slot_status,
		booking_time_slot.created_at AS booking_time_slot_created_at,
		booking_time_slot.client_collection_point AS client_collection_point,
		booking_time_slot.drop_point AS drop_point,
		users.name AS driver_name,users.fullname AS fullname,users.first_name AS user_first_name,users.last_name AS user_last_name,users.profile_pic,payments.*,fare.fare_name as fare_name');
            $this->db->from('client_details');
            //$this->db->where('booking_time_slot.date_time_slot <=', date('Y-m-d H:i:s'));
            $this->db->where('payments.client_id', $client_id);
            $this->db->where('appointments.rides_message', 'completed');
            $this->db->join('booking_time_slot', 'booking_time_slot.client_id = client_details.client_id', 'left');
            $this->db->join('payments', 'payments.book_id = booking_time_slot.book_id', 'right');
            $this->db->join('users', 'users.users_id = booking_time_slot.driver_id', 'left');
            $this->db->join('appointments', 'appointments.rides_id = booking_time_slot.book_id', 'left');
            $this->db->join('fare', 'fare.fare_id = booking_time_slot.fare_id', 'left');
            $this->db->order_by("booking_time_slot.date_time_slot", "ASC");
            $query = $this->db->get();
        } else {
            $this->db->select('client_details.*,booking_time_slot.book_id AS booking_time_slot_book_id,
		booking_time_slot.client_id AS booking_time_slot_client_id,
		booking_time_slot.driver_id AS booking_time_slot_driver_id,
		booking_time_slot.date_time_slot AS booking_time_slot_date_time_slot,
		booking_time_slot.book_duration AS booking_time_slot_book_duration,
		booking_time_slot.status AS booking_time_slot_status_p1,
		booking_time_slot.payment_status AS booking_time_slot_status,
		booking_time_slot.created_at AS booking_time_slot_created_at,
		booking_time_slot.client_collection_point AS client_collection_point,
		booking_time_slot.drop_point AS drop_point,
		users.name AS driver_name,users.fullname AS fullname,users.first_name AS user_first_name,users.last_name AS user_last_name,users.profile_pic,payments.*,fare.fare_name as fare_name');
            $this->db->from('client_details');
            $this->db->where('payments.client_id', $client_id);
            $this->db->where('appointments.rides_message', 'cancel');
            $this->db->join('booking_time_slot', 'booking_time_slot.client_id = client_details.client_id', 'left');
            $this->db->join('payments', 'payments.book_id = booking_time_slot.book_id', 'right');
            $this->db->join('users', 'users.users_id = booking_time_slot.driver_id', 'left');
            $this->db->join('fare', 'fare.fare_id = booking_time_slot.fare_id', 'left');
            $this->db->join('appointments', 'appointments.rides_id = booking_time_slot.book_id', 'left');
            $this->db->order_by("booking_time_slot.date_time_slot", "ASC");
            $query = $this->db->get();
        }
        return $query->result_array();
    }


    /**
     * This function is used to delete user
     * @param: $id - id of user table
     */
    function deleteFavouriteDriver($driver_id = '', $client_id = '')
    {
        $this->db->where('client_id', $client_id);
        $this->db->where('driver_id', $driver_id);
        $this->db->delete('favourite_driver');
    }


    function createPreferpences($data = array())
    {
        $preferpences_user_id = isset($data['preferpences_user_id']) ? $data['preferpences_user_id'] : '';
        $data['preferpences_datetiime'] = date('Y-m-d H:i:s');
        if (!empty($preferpences_user_id)) {
            $this->db->where('preferpences_user_id', $preferpences_user_id);
            $res = $this->db->get('preferpences')->row();
            if (!empty($res)) {
                unset($data['preferpences_user_id']);
                $this->updateRow('preferpences', 'preferpences_user_id', $preferpences_user_id, $data);
            } else {
                $this->insertRow('preferpences', $data);
            }
        }//echo"<PRE>";print_r($data);die("AMINU");
    }

    function getPreferpencesClient($preferpences_user_id = '')
    {
        if (!empty($preferpences_user_id)) {
            $this->db->where('preferpences_user_id', $preferpences_user_id);
            $res = $this->db->get('preferpences')->row();
            //$query = $this->db->get();
            if (empty($res)) {
                $res = array();
            }
            return $res;
        }//echo"<PRE>";print_r($data);die("AMINU");
    }

    function rattingDriver($data = array())
    {
        $ratting_driver_id = isset($data['ratting_driver_id']) ? $data['ratting_driver_id'] : '';
        $ratting_client_id = isset($data['ratting_client_id']) ? $data['ratting_client_id'] : '';
        $ratting_booking_book_id = isset($data['ratting_booking_book_id']) ? $data['ratting_booking_book_id'] : '';
        $data['ratting_datetime'] = date('Y-m-d H:i:s');
        //echo"<PRE> $ratting_driver_id - $ratting_client_id -$ratting_booking_book_id ";print_r($data);

        if (!empty($ratting_driver_id) && !empty($ratting_client_id) && !empty($ratting_booking_book_id)) {
            $this->db->where('ratting_driver_id', $ratting_driver_id);
            $this->db->where('ratting_client_id', $ratting_client_id);
            $this->db->where('ratting_booking_book_id', $ratting_booking_book_id);
            $res = $this->db->get('ratting')->row();
            //print_r($res);
            if (!empty($res)) {
                //unset($data['preferpences_user_id']);
                $this->updateRow('ratting', 'ratting_id', $res->ratting_id, $data);
            } else {
                $this->insertRow('ratting', $data);
            }
            //die("AMINU");
        }//
    }

    function getrattinfDriverById($data = array())
    {
        $ratting_driver_id = isset($data['ratting_driver_id']) ? $data['ratting_driver_id'] : '';
        $ratting_client_id = isset($data['ratting_client_id']) ? $data['ratting_client_id'] : '';
        $ratting_booking_book_id = isset($data['ratting_booking_book_id']) ? $data['ratting_booking_book_id'] : '';
        //echo"<PRE> $ratting_driver_id - $ratting_client_id -$ratting_booking_book_id ";print_r($data);

        if (!empty($ratting_driver_id) && !empty($ratting_client_id) && !empty($ratting_booking_book_id)) {
            $this->db->where('ratting_driver_id', $ratting_driver_id);
            $this->db->where('ratting_client_id', $ratting_client_id);
            $this->db->where('ratting_booking_book_id', $ratting_booking_book_id);
            $res = $this->db->get('ratting')->row();
            if (!empty($res)) {
                return $res;
            } else {
                return array('status' => 'empty');
            }
        }
    }

    function getrattingClientById($data = array())
    {
        $book_id = isset($data['book_id']) ? $data['book_id'] : '';

        $this->db->select('*');
        $this->db->from('booking_time_slot');
        $this->db->where('book_id', $book_id);
        $query = $this->db->get();
        return $query->row();

    }

    function getClientName($client_id)
    {
        $this->db->select('*');
        $this->db->from('client_details');
        $this->db->where('client_id', $client_id);
        $query = $this->db->get();
        $row = $query->row();
        return !empty($row) ? $row->client_first_name . ' ' . $row->client_last_name : '';
    }

    function getRattingsAndCommentsDriverId($ratting_driver_id = '')
    {
        $this->db->select('*');
        $this->db->from('ratting');
        $this->db->where('ratting_driver_id', $ratting_driver_id);
        $query = $this->db->get();
        return $query->result_array();

    }

    function settingClientSave($data = array())
    {
        $client_id = isset($data['client_id']) ? $data['client_id'] : '';
        if (!empty($client_id)) {
            $this->db->where('client_id', $client_id);
            $res = $this->db->get('client_details')->row();
            if (!empty($res)) {
                $this->updateRow('client_details', 'client_id', $client_id, $data);
            }
            return $res;
        }

    }

    function get_subscription()
    {
        $this->db->select('*');
        $this->db->from('subscription');
        $this->db->where('expire_date', date('Y-m-d'));
        $this->db->where('is_clone', 0);
        $this->db->order_by('subs_id', 'DESC');
        $this->db->group_by('users_id');
        $query = $this->db->get();
        return $query->result();
    }

    function get_subscription_passenger()
    {
        $this->db->select('*');
        $this->db->from('passenger_subs');
        $this->db->where("DATE_FORMAT(`created_at`, '%Y-%m-%d')=", date('Y-m-d'));
        $this->db->where('is_clone', 0);
        $this->db->where('deleted_at', NULL);
        $this->db->order_by('passenger_subs_id', 'DESC');
        $this->db->group_by('client_id');
        $query = $this->db->get();
        $this->db->last_query();
        return $query->result();
    }

}