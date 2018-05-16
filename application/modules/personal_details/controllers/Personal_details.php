<?php defined("BASEPATH") OR exit("No direct script access allowed");
class Personal_details extends CI_Controller {
  	function __construct() {
	    parent::__construct();
	    $this->load->model("Personal_details_model"); 
		if(true==1){
			is_login(); 
			$this->user_id =isset($this->session->get_userdata()['user_details'][0]->users_id)?$this->session->get_userdata()['user_details'][0]->users_id:'1';
		}else{ 	
			$this->user_id =1;
		}
  	}
  	/**
      * This function is used to view page
      */
  	public function index() {   
  		if(CheckPermission("personal_details", "all_read,own_read")){
			$data["view_data"]= $this->Personal_details_model->get_data();
			$this->load->view("include/header");
			$this->load->view("index",$data);
			$this->load->view("include/footer");
		} else {
			$this->session->set_flashdata('messagePr', 'You don\'t have permission to access.');
            redirect( base_url().'user/profile', 'refresh');
		}
  	}
  	/**
      * This function is used to Add and update data
      */
	public function add_edit() {	
		$data = $this->input->post();
		$postoldfiles = array();
		foreach ($data as $okey => $ovalue) {
    		if(strstr($okey, "wpb_old_")) {
			$postoldfiles[$okey]=$ovalue;
    		}
		}
		foreach ($_FILES as $fkey => $fvalue) {
			foreach($fvalue['name'] as $key => $fileInfo) {
				if(!empty($_FILES[$fkey]['name'][$key])){
					$filename=$_FILES[$fkey]['name'][$key];
					$tmpname=$_FILES[$fkey]['tmp_name'][$key]; 
					$exp=explode('.', $filename);
					$ext=end($exp);
					$newname=  $exp[0].'_'.time().".".$ext; 
					$config['upload_path'] = 'assets/images/';
					$config['upload_url'] =  base_url().'assets/images/';
					$config['allowed_types'] = "gif|jpg|jpeg|png|iso|dmg|zip|rar|doc|docx|xls|xlsx|ppt|pptx|csv|ods|odt|odp|pdf|rtf|sxc|sxi|txt|exe|avi|mpeg|mp3|mp4|3gp";
					$config['max_size'] = '2000000'; 
					$config['file_name'] = $newname;
					$this->load->library('upload', $config);
					move_uploaded_file($tmpname,"assets/images/".$newname);
					$newfiles[$fkey][]=$newname;
				}
				else{
					$newfiles[$fkey]='';
			
				}
			}
			if(!empty($postoldfiles)) {

				if(!empty($postoldfiles['wpb_old_'.$fkey])){
					$oldfiles = $postoldfiles['wpb_old_'.$fkey];
				}
				else{
					$oldfiles = array();
				}
					if(!empty($newfiles[$fkey])){
					$all_files = array_merge($oldfiles,$newfiles[$fkey]);	
					}
					else{
						$all_files = $postoldfiles['wpb_old_'.$fkey];
					}
					
			}
			else{
					$all_files = $newfiles[$fkey];
			}
					$data[$fkey] = implode(',', $all_files);
		}
		if($this->input->post('id')) {
			foreach ($postoldfiles as $pkey => $pvalue) {
			unset($data[$pkey]);		
			}
			unset($data['submit']);
			unset($data['save']);
			unset($data['id']);
			
			foreach ($data as $dkey => $dvalue) {
				if(is_array($dvalue)) {
					$data[$dkey] = implode(',', $dvalue); 
				}
			}
			$this->Personal_details_model->updateRow('personal_details', 'personal_details_id', $this->input->post('id'), $data);
			$this->session->set_flashdata('message', 'Your data updated Successfully..');
      		redirect('personal_details');
		} else { 
			unset($data['submit']);
			unset($data['save']);
			$data['user_id']=$this->user_id;
			foreach ($data as $dkey => $dvalue) {
				if(is_array($dvalue)) {
					$data[$dkey] = implode(',', $dvalue); 
				}
			}
			$this->Personal_details_model->insertRow('personal_details', $data);
			$this->session->set_flashdata('message', 'Your data inserted Successfully..');
			redirect('personal_details');
		}
	}
	
	/**
      * This function is used to show popup for add and update
      */
	public function get_modal() {
		if($this->input->post('id')){
			$data['data']= $this->Personal_details_model->Get_data_id($this->input->post('id'));
      		echo $this->load->view('add_update', $data, true);
	    } else {
	      	echo $this->load->view('add_update', '', true);
	    }
	    exit;
	}
	
	/**
      * This function is used to delete multiple records form table
      * @param : $ids is array if record id
      */
  	public function delete($ids) {
		$idsArr = explode('-', $ids);
		foreach ($idsArr as $key => $value) {
			$this->Personal_details_model->delete_data($value);		
		}
		redirect(base_url().'personal_details', 'refresh');
  	}
  	/**
      * This function is used to delete single record form table
      * @param : $id is record id
      */
  	public function delete_data($id) { 
		$this->Personal_details_model->delete_data($id);
	    $this->session->set_flashdata('message', 'Your data deleted Successfully..');
	    redirect('personal_details');
  	}
	/**
      * This function is used to create data for server side datatable
      */
  	public function ajx_data(){
		$primaryKey = 'personal_details_id';
		$table 		= 'personal_details';
		$columns 	= array(
array( 'db' => 'personal_details_id', 'dt' => 0 ),
array( 'db' => 'personal_details_name', 'dt' => 1 ),
array( 'db' => 'personal_details_address', 'dt' => 2 ),
array( 'db' => 'personal_details_mobile_number', 'dt' => 3 ),
array( 'db' => 'personal_details_email', 'dt' => 4 ),
array( 'db' => 'personal_details_upload_photo', 'dt' => 5 ),
array( 'db' => 'personal_details_id', 'dt' => 6 )
);
		$joinQuery 	= '';
		$aminkhan 	= '@banarsiamin@';
		$where = '';
		if($this->input->get('dateRange')) {
			$date = explode(' - ', $this->input->get('dateRange'));
			$where = " DATE_FORMAT(`$table`.`".$this->input->get('columnName')."`, '%Y/%m/%d') >= '".date('Y/m/d', strtotime($date[0]))."' AND  DATE_FORMAT(`$table`.`".$this->input->get('columnName')."`, '%Y/%m/%d') <= '".date('Y/m/d', strtotime($date[1]))."' ";
		}
		$sql_details = array(
			'user' => $this->db->username,
			'pass' => $this->db->password,
			'db'   => $this->db->database,
			'host' => $this->db->hostname
		);
		if(CheckPermission($table, "all_read")){}
		else if(CheckPermission($table, "own_read") && CheckPermission($table, "all_read")!=true){$where .= "`$table`.`user_id`=".$this->user_id." ";}
		$group_by = "";
		$having = "";
		$output_arr = SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns, $joinQuery, $where, $group_by, $having);
		foreach ($output_arr['data'] as $key => $value) 
		{
			$output_arr['data'][$key][0] = '<input type="checkbox" name="selData" value="'.$output_arr['data'][$key][0].'">';
			$id = $output_arr['data'][$key][array_pop(array_keys($output_arr['data'][$key]))];
			$output_arr['data'][$key][array_pop(array_keys($output_arr['data'][$key]))] = '';
			if(CheckPermission($table, "all_update")){
			$output_arr['data'][$key][array_pop(array_keys($output_arr['data'][$key]))] .= '<a sty id="btnEditRow" class="modalButton mClass"  href="javascript:;" type="button" data-src="'.$id.'" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
			}else if(CheckPermission($table, "own_update") && (CheckPermission($table, "all_update")!=true)){
				$user_id =getRowByTableColomId($table,$id,'id');
				if($user_id->user_id==$this->user_id){
			$output_arr['data'][$key][array_pop(array_keys($output_arr['data'][$key]))] .= '<a sty id="btnEditRow" class="modalButton mClass"  href="javascript:;" type="button" data-src="'.$id.'" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
				}
			}
			
			if(CheckPermission($table, "all_delete")){
			$output_arr['data'][$key][array_pop(array_keys($output_arr['data'][$key]))] .= '<a data-toggle="modal" class="mClass" style="cursor:pointer;"  data-target="#cnfrm_delete" title="delete" onclick="setId('.$id.', \''.$table.'\')"><i class="fa fa-trash-o" ></i></a>';}
			else if(CheckPermission($table, "own_delete") && (CheckPermission($table, "all_delete")!=true)){
				$user_id =getRowByTableColomId($table,$id,'id');
				if($user_id->user_id==$this->user_id){
			$output_arr['data'][$key][array_pop(array_keys($output_arr['data'][$key]))] .= '<a data-toggle="modal" class="mClass" style="cursor:pointer;"  data-target="#cnfrm_delete" title="delete" onclick="setId('.$id.', \''.$table.'\')"><i class="fa fa-trash-o" ></i></a>';
				}
			}
			$images = $output_arr['data'][$key][5];
									$output_arr['data'][$key][5] = "";
									$imgExt_array = array("jpg","jpeg","gif","bmp","png");
									$img_array = explode(",", $images);
									foreach ($img_array as $Ikey => $Ivalue) {
										$arr = explode(".", $Ivalue);
										$ext = end($arr);				
									 	if(in_array($ext, $imgExt_array)){
									 	 	$output_arr['data'][$key][5] .= "<img src='".base_url()."assets/images/".$Ivalue."' height='50' width='50' style='margin:3px;'>";
								 	  	}else{ 
									 	  	$output_arr['data'][$key][5] .= $Ivalue;
							 	  	 	} 
									}
		}
		echo json_encode($output_arr);
  	}
  	/**
      * This function is used to filter list view data by date range
      */
  	public function getFilterdata(){
  		$where = '';
		if($this->input->post('dateRange')) {
			$date = explode(' - ', $this->input->post('dateRange'));
			$where = " DATE_FORMAT(`personal_details`.`".$this->input->post('colName')."`, '%Y/%m/%d') >= '".date('Y/m/d', strtotime($date[0]))."' AND  DATE_FORMAT(`personal_details`.`".$this->input->post('colName')."`, '%Y/%m/%d') <= '".date('Y/m/d', strtotime($date[1]))."' ";
		}
		$data["view_data"]= $this->Personal_details_model->get_data($where);
		echo $this->load->view("tableData",$data, true);
		die;
  	}
}
?>