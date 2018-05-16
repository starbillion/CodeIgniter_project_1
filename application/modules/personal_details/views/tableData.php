<?php 
			$tablename = "personal_details";
			$tab_id = $tablename.'_id';
			if(isset($view_data) && is_array($view_data) && !empty($view_data)) { 
  foreach ($view_data as $key => $value) {?>
  <tr>
<td>
				<?php
					 
					if(CheckPermission("personal_details", "all_delete")){
					      echo '<input type="checkbox" name="selData" value="'.$value->$tab_id.'">';}
					      else if(CheckPermission("personal_details", "own_delete") && (CheckPermission("personal_details", "all_delete")!=true)){
					        $user_id =getRowByTableColomId("personal_details",$value->$tab_id,$tab_id,"user_id");
					        if($user_id==$this->user_id){
    			echo '<input type="checkbox" name="selData" value="'.$value->$tab_id.'">';
					        }
					      }
					?>
			</td>
<td><?php echo $value->personal_details_name; ?></td>
<td><?php echo $value->personal_details_address; ?></td>
<td><?php echo $value->personal_details_mobile_number; ?></td>
<td><?php echo $value->personal_details_email; ?></td>
<td>
								<?php
									if(isset($value->personal_details_upload_photo)){
										$imgExt_array = array("jpg","jpeg","gif","bmp","png");
										$img_array = explode(",", $value->personal_details_upload_photo);
										foreach ($img_array as $key => $Ivalue) {
											$arr = explode(".", $Ivalue);
											$ext = end($arr);
										 	if(in_array($ext, $imgExt_array)){ echo '<img src="'.base_url().'assets/images/'.$Ivalue.'" height="50" width="50" style="margin:3px;" />'; }else{ echo $Ivalue; } 
										}						
									}
									?>
									</td><td><?php 
	      if(CheckPermission("personal_details", "all_update")){
	      echo '<a sty id="btnEditRow" class="modalButton mClass"  href="javascript:;" type="button" data-src="'.$value->$tab_id.'" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
	      }else if(CheckPermission("personal_details", "own_update") && (CheckPermission("personal_details", "all_update")!=true)){
	        $user_id =getRowByTableColomId("personal_details",$value->$tab_id,$tab_id,"user_id");
	        if($user_id==$this->user_id){
	     	echo '<a sty id="btnEditRow" class="modalButton mClass"  href="javascript:;" type="button" data-src="'.$value->$tab_id.'" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
	        }
	      }
	      
	      if(CheckPermission("personal_details", "all_delete")){
	      echo '<a data-toggle="modal" class="mClass" style="cursor:pointer;"  data-target="#cnfrm_delete" title="delete" onclick="setId('.$value->$tab_id.', \'personal_details\')"><i class="fa fa-trash-o" ></i></a>';}
	      else if(CheckPermission("personal_details", "own_delete") && (CheckPermission("personal_details", "all_delete")!=true)){
	        $user_id =getRowByTableColomId("personal_details",$value->$tab_id,$tab_id,"user_id");
	        if($user_id==$this->user_id){
		echo '<a data-toggle="modal" class="mClass" style="cursor:pointer;"  data-target="#cnfrm_delete" title="delete" onclick="setId('.$value->$tab_id.', \'personal_details\')"><i class="fa fa-trash-o" ></i></a>';
	        }
	      } ?>
	    </td>
	  </tr>    

	  
	<?php } } ?>
