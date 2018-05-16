<?php 
			$tablename = "enter_username_and_password";
			$tab_id = $tablename.'_id';
			if(isset($view_data) && is_array($view_data) && !empty($view_data)) { 
  foreach ($view_data as $key => $value) {?>
  <tr>
<td>
				<?php
					 
					if(CheckPermission("enter_username_and_password", "all_delete")){
					      echo '<input type="checkbox" name="selData" value="'.$value->$tab_id.'">';}
					      else if(CheckPermission("enter_username_and_password", "own_delete") && (CheckPermission("enter_username_and_password", "all_delete")!=true)){
					        $user_id =getRowByTableColomId("enter_username_and_password",$value->$tab_id,$tab_id,"user_id");
					        if($user_id==$this->user_id){
    			echo '<input type="checkbox" name="selData" value="'.$value->$tab_id.'">';
					        }
					      }
					?>
			</td>
<td><?php echo $value->enter_username_and_password_username; ?></td>
<td><?php echo $value->enter_username_and_password_password; ?></td>
<td><?php 
	      if(CheckPermission("enter_username_and_password", "all_update")){
	      echo '<a sty id="btnEditRow" class="modalButton mClass"  href="javascript:;" type="button" data-src="'.$value->$tab_id.'" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
	      }else if(CheckPermission("enter_username_and_password", "own_update") && (CheckPermission("enter_username_and_password", "all_update")!=true)){
	        $user_id =getRowByTableColomId("enter_username_and_password",$value->$tab_id,$tab_id,"user_id");
	        if($user_id==$this->user_id){
	     	echo '<a sty id="btnEditRow" class="modalButton mClass"  href="javascript:;" type="button" data-src="'.$value->$tab_id.'" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
	        }
	      }
	      
	      if(CheckPermission("enter_username_and_password", "all_delete")){
	      echo '<a data-toggle="modal" class="mClass" style="cursor:pointer;"  data-target="#cnfrm_delete" title="delete" onclick="setId('.$value->$tab_id.', \'enter_username_and_password\')"><i class="fa fa-trash-o" ></i></a>';}
	      else if(CheckPermission("enter_username_and_password", "own_delete") && (CheckPermission("enter_username_and_password", "all_delete")!=true)){
	        $user_id =getRowByTableColomId("enter_username_and_password",$value->$tab_id,$tab_id,"user_id");
	        if($user_id==$this->user_id){
		echo '<a data-toggle="modal" class="mClass" style="cursor:pointer;"  data-target="#cnfrm_delete" title="delete" onclick="setId('.$value->$tab_id.', \'enter_username_and_password\')"><i class="fa fa-trash-o" ></i></a>';
	        }
	      } ?>
	    </td>
	  </tr>    

	  
	<?php } } ?>
