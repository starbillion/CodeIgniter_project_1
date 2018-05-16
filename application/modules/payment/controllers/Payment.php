<?php defined("BASEPATH") OR exit("No direct script access allowed");

class Payment extends CI_Controller {

  function __construct() {
    parent::__construct();
    $this->load->library('Braintree_lib');
    $this->load->model('user/User_model');
    $this->user_id = isset($this->session->get_userdata()['user_details'][0]->id)?$this->session->get_userdata()['user_details'][0]->id:'';
  }

  /**
     * This function is used to load page view
     * @return Void
     */
  public function index(){  
    is_login();
    if(!isset($id) || $id == '') {
//        $id = $this->session->userdata ('user_details')[0]->users_id;
        $id = $this->session->userdata ('user_details')[0]->id;

    }
    
    $data = $this->input->post();  
    $data['user_data'] = $this->User_model->get_users($id);
    $data['token'] = $this->braintree_lib->create_client_token(); 
	  $this->load->view("include/script");
    $this->load->view("index",$data);
    //$this->load->view("include/footer");
  }

  public function checkout(){
    $amount = !empty($_POST["amount"])?$_POST["amount"]:'';
    $plan_name = !empty($_POST["plan_name"])?$_POST["plan_name"]:'';
    $plan_id = !empty($_POST["plan_id"])?$_POST["plan_id"]:'';
    $nonce =  !empty($_POST["payment_method_nonce"])?$_POST["payment_method_nonce"]:'';
    $expire_date = !empty($_POST["expire_date"])?$_POST["expire_date"]:'';
    $result = $this->braintree_lib->transaction_sale($amount,$nonce); 

    if ($result->success || !is_null($result->transaction)) {
        $transaction = $result->transaction;

        $data['transaction_id'] = $transaction->id;
        $data['plan_name'] = $plan_name;
        $data['plan_id'] = $plan_id;
        $data['plan_amount'] = $amount;
        $data['users_id'] = $this->user_id;
        $data['expire_date'] = expireDate($plan_id,$expire_date);
        $data['subs_id'] = $plan_id;
        $this->User_model->insertRow('subscription', $data);  



        $dataUpdate['status']='Subscription';

        $this->User_model->updateRow('users', 'users_id', $this->user_id, $dataUpdate);
         if(!isset($id) || $id == '') {
            $id = $this->session->userdata('user_details')[0]->id;
        }
         if(checkApproved($id)){   
            $this->session->set_flashdata('messagePr', 'Payment Successfully..');
            redirect( base_url().'user/dashboard', 'refresh');
         }else{
            $this->session->set_flashdata('messagePr', 'Payment Successfully..');
            redirect( base_url().'user/message', 'refresh');
         }

        
    } else {
        $errorString = "";

        foreach($result->errors->deepAll() as $error) {
            $errorString .= 'Error: ' . $error->code . ": " . $error->message . "\n";
        }       
        $this->session->set_flashdata('errors', 'Payment UnSuccessfully..');
        redirect( base_url().'payment/index', 'refresh');
    }
  }
}
?>