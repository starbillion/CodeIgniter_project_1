<?php
class User_model extends CI_Model {       
	function __construct(){            
	  	parent::__construct();
		$this->user_id =isset($this->session->get_userdata()['user_details'][0]->id)?$this->session->get_userdata()['user_details'][0]->users_id:'1';
	}

	/**
      * This function is used authenticate user at login
      */
  	function auth_user() {
		$email = $this->input->post('email');
		$password = $this->input->post('password');
    	$this->db->where("is_deleted='0' AND (name='$email' OR email='$email')");
    	//$this->db->where("is_deleted='0' AND email='$email' ");
		$result = $this->db->get('users')->result();
		if(!empty($result)){       
			if (password_verify($password, $result[0]->password)) {       
				if($result[0]->status != 'Approved') {
					return 'not_varified';
				}
				return $result;                    
			}
			else {             
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
	function delete($id='') {
		$this->db->where('users_id', $id);  
		$this->db->delete('users'); 
	}
	
	/**
      * This function is used to load view of reset password and varify user too 
      */
	function mail_varify() {    
		$ucode = $this->input->get('code');     
		$this->db->select('email as e_mail');        
		$this->db->from('users');
		$this->db->where('var_key',$ucode);
		$query = $this->db->get();     
		$result = $query->row();   
		if(!empty($result->e_mail)){      
			return $result->e_mail;         
		}else{     
			return false;
		}
	}

 	 function otpNumber($phone_number,$country_code,$otp_number=''){
    $this->db->select('client_id');        
		$this->db->from('client_details');
		$this->db->where('client_phone',$phone_number);
		$this->db->where('country_code',$country_code);
		if(!empty($otp_number)){
     $this->db->where('otp_number',$otp_number);
		}
		$query = $this->db->get();     
		$result = $query->row();   
		if(!empty($result->client_id)){      
			return $result->client_id;         
		}else{     
			return array();
		}
	 }

	 function favDriver($driver_id,$client_id){
	    $this->db->select('favourite_driver_id');        
			$this->db->from('favourite_driver');
			$this->db->where('driver_id',$driver_id);
			$this->db->where('client_id',$client_id);		
			$query = $this->db->get();     
			$result = $query->row();   
			if(!empty($result->favourite_driver_id)){      
				return $result->favourite_driver_id;         
			}else{     
				return array();
			}
	 }


	 function favDrivers($client_id){
	  	$this->db->select('users.*,make.make_value,model.model_value');        
			$this->db->from('users');
	    $this->db->join('favourite_driver', 'favourite_driver.driver_id = users.users_id');
	    $this->db->join('make', 'make.make_id = users.make');
	    $this->db->join('model', 'model.model_id = users.model');
			$this->db->where('favourite_driver.client_id',$client_id);		
			$query = $this->db->get();     
			$result = $query->result(); 
			if(!empty($result)){      
				return $result;         
			}else{     
				return array();
			}
	 }

	 function favDriversInfo($client_id,$driver_id){
	  	$this->db->select('users.*,make.make_value,model.model_value');        
			$this->db->from('users');
	    $this->db->join('favourite_driver', 'favourite_driver.driver_id = users.users_id');
	    $this->db->join('make', 'make.make_id = users.make');
	    $this->db->join('model', 'model.model_id = users.model');
			$this->db->where('favourite_driver.client_id',$client_id);
			$this->db->where('favourite_driver.driver_id',$driver_id);		
			$query = $this->db->get();     
			$result = $query->result(); 
			if(!empty($result)){      
				return $result;         
			}else{     
				return array();
			}
	 }

	/**
      * This function is used Reset password  
      */
	function ResetPpassword(){
		$email = $this->input->post('email');
		if($this->input->post('password_confirmation') == $this->input->post('password')){
			$npass = password_hash($this->input->post('password'), PASSWORD_DEFAULT);
			$data['password'] = $npass;
			$data['var_key'] = '';
			return $this->db->update('users',$data, "email = '$email'");
		}
	}
 
  	/**
      * This function is used to select data form table  
      */
	function get_data_by($tableName='', $value='', $colum='',$condition='') {	
		if((!empty($value)) && (!empty($colum))) { 
			$this->db->where($colum, $value);
		}
		$this->db->select('*');
		$this->db->from($tableName);
		$query = $this->db->get();
		return $query->result();
  	}

  	/**
      * This function is used to check user is alredy exist or not  
      */
	function check_exists($table='', $colom='',$colomValue='', $id='', $id_CheckCol=''){
		$this->db->where($colom, $colomValue);
                if(!empty($id) && !empty($id_CheckCol)){
                    $this->db->where($id_CheckCol.' !=' , $id);
                }
		$res = $this->db->get($table)->row();
		if(!empty($res)){ return false;} else{ return true;}
 	}

 	/**
      * This function is used to get users detail  
      */
	function get_users($userID = '') {
		$this->db->where('is_deleted', '0');                  
		if(isset($userID) && $userID !='') {
			$this->db->where('users_id', $userID); 
		} else if($this->session->userdata('user_details')[0]->user_type == 'admin') {
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
  	function get_template($code){
	  	$this->db->where('code', $code);
	  	return $this->db->get('templates')->row();
	}

	/**
      * This function is used to Insert record in table  
      */
  	public function insertRow($table, $data){
	  	$this->db->insert($table, $data);
	  	return  $this->db->insert_id();
	}

	/**
      * This function is used to Update record in table  
      */
  	public function updateRow($table, $col, $colVal, $data) {
  		$this->db->where($col,$colVal);
		$this->db->update($table,$data);
		return true;
  	}

/*  	public function get_list_box_data($qr) {
  		$exe = $this->db->query($qr);
  		return $exe->result();
  	}
*/
  	public function getQrResult($qr) {
  		$exe = $this->db->query($qr);
  		return $exe->result();
  	}

  	public function getAllBooking($driver_id) {
  		$this->db->select('client_details.*,booking_time_slot.*');
			$this->db->from('client_details');
			$this->db->where('client_details.driver_id', $driver_id);
			$this->db->join('payments', 'payments.client_id = client_details.client_id', 'right');
			$this->db->join('booking_time_slot', 'booking_time_slot.client_id = payments.client_id', 'right');
			$query = $this->db->get(); 
			return $query->result();			
  	}
    
    public function getAllBookingStatus($driver_id,$Status) {
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

  	public function getBooking($client_id) {
  		$this->db->select('client_details.*,booking_time_slot.*');
			$this->db->from('client_details');
			$this->db->where('client_details.client_id', $client_id);
			$this->db->join('payments', 'payments.client_id = client_details.client_id', 'right');
			$this->db->join('booking_time_slot', 'booking_time_slot.client_id = payments.client_id', 'right');
			$query = $this->db->get(); 
			return $query->row();			
  	}

  	 public function getSingleBooking($book_id) {
  		$this->db->select('client_details.*,booking_time_slot.*,fare.*');
			$this->db->from('client_details');
			$this->db->where('booking_time_slot.book_id', $book_id);
			$this->db->join('payments', 'payments.client_id = client_details.client_id', 'right');
			$this->db->join('booking_time_slot', 'booking_time_slot.client_id = payments.client_id', 'right');
			$this->db->join('fare', 'fare.fare_id = client_details.fare_id', 'right');
			$query = $this->db->get(); 
			return $query->row();			
  	}

    public function get_bar_chart_data($qr) {
      $exe = $this->db->query($qr);
      $res = $exe->result();
      $result = [];
      $i = 1;
      while ($i <= 12) {
        $result[$i] = 0;
        foreach ($res as $key => $value) {
          if($value->months == $i) {
            //$result[$i] += $value->mka_sum; 
            $result[$i] += ( int ) str_replace(',', '', $value->mka_sum);
          }
        } 
        $i++;
      }
      return implode(',', $result);
    }
	
	 public function getAllBookingClient($client_id,$rider_Type='all') {
     if($rider_Type=='upcoming'){
		$this->db->select('client_details.*,booking_time_slot.book_id AS booking_time_slot_book_id,
		booking_time_slot.client_id AS booking_time_slot_client_id,
		booking_time_slot.driver_id AS booking_time_slot_driver_id,
		booking_time_slot.date_time_slot AS booking_time_slot_date_time_slot,
		booking_time_slot.book_duration AS booking_time_slot_book_duration,
		booking_time_slot.status AS booking_time_slot_status,
		booking_time_slot.created_at AS booking_time_slot_created_at,
		users.name AS driver_name,users.profile_pic,payments.*');
		$this->db->from('client_details');
		$this->db->where('booking_time_slot.date_time_slot >=', date('Y-m-d H:i:s'));
		$this->db->where('client_details.client_id', $client_id);
		
		$this->db->join('payments', 'payments.client_id = client_details.client_id', 'left');
		$this->db->join('booking_time_slot', 'booking_time_slot.client_id = client_details.client_id', 'left');
		$this->db->join('users', 'users.users_id = booking_time_slot.driver_id', 'left');  
		$query = $this->db->get(); 
		}else if($rider_Type=='past'){
		$this->db->select('client_details.*,booking_time_slot.book_id AS booking_time_slot_book_id,
		booking_time_slot.client_id AS booking_time_slot_client_id,
		booking_time_slot.driver_id AS booking_time_slot_driver_id,
		booking_time_slot.date_time_slot AS booking_time_slot_date_time_slot,
		booking_time_slot.book_duration AS booking_time_slot_book_duration,
		booking_time_slot.status AS booking_time_slot_status,
		booking_time_slot.created_at AS booking_time_slot_created_at,
		users.name AS driver_name,users.profile_pic,payments.*');
		$this->db->from('client_details');
		$this->db->where('booking_time_slot.date_time_slot <=', date('Y-m-d H:i:s'));
		$this->db->where('client_details.client_id', $client_id);
		$this->db->join('payments', 'payments.client_id = client_details.client_id', 'left');
		$this->db->join('booking_time_slot', 'booking_time_slot.client_id = client_details.client_id', 'left');
		$this->db->join('users', 'users.users_id = booking_time_slot.driver_id', 'left');  
		$query = $this->db->get(); 
		}else {
		$this->db->select('client_details.*,booking_time_slot.book_id AS booking_time_slot_book_id,
		booking_time_slot.client_id AS booking_time_slot_client_id,
		booking_time_slot.driver_id AS booking_time_slot_driver_id,
		booking_time_slot.date_time_slot AS booking_time_slot_date_time_slot,
		booking_time_slot.book_duration AS booking_time_slot_book_duration,
		booking_time_slot.status AS booking_time_slot_status,
		booking_time_slot.created_at AS booking_time_slot_created_at,
		users.name AS driver_name,users.profile_pic,payments.*');
		$this->db->from('client_details');
		$this->db->where('client_details.client_id', $client_id);
		$this->db->join('payments', 'payments.client_id = client_details.client_id', 'left');
		$this->db->join('booking_time_slot', 'booking_time_slot.client_id = client_details.client_id', 'left');
		$this->db->join('users', 'users.users_id = booking_time_slot.driver_id', 'left');  
		$query = $this->db->get(); 
     }
   return $query->result_array();   
   }
   

	/**
	* This function is used to delete user
	* @param: $id - id of user table
	*/
	function deleteFavouriteDriver($driver_id='',$client_id='') {
		$this->db->where('client_id', $client_id); 
		$this->db->where('driver_id', $driver_id);  
		$this->db->delete('favourite_driver'); 
	}
}