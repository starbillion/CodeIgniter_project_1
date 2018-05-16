<?php 
			$tablename = "drivers_licensing";
			$tab_id = $tablename.'_id';
			if(isset($view_data) && is_array($view_data) && !empty($view_data)) { 
  foreach ($view_data as $key => $value) {?>
  <tr>
<td>
				<?php
					 
					if(CheckPermission("drivers_licensing", "all_delete")){
					      echo '<input type="checkbox" name="selData" value="'.$value->$tab_id.'">';}
					      else if(CheckPermission("drivers_licensing", "own_delete") && (CheckPermission("drivers_licensing", "all_delete")!=true)){
					        $user_id =getRowByTableColomId("drivers_licensing",$value->$tab_id,$tab_id,"user_id");
					        if($user_id==$this->user_id){
    			echo '<input type="checkbox" name="selData" value="'.$value->$tab_id.'">';
					        }
					      }
					?>
			</td>
<td><?php echo $value->drivers_licensing_license; ?></td>
<td><?php 
	      if(CheckPermission("drivers_licensing", "all_update")){
	      echo '<a sty id="btnEditRow" class="modalButton mClass"  href="javascript:;" type="button" data-src="'.$value->$tab_id.'" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
	      }else if(CheckPermission("drivers_licensing", "own_update") && (CheckPermission("drivers_licensing", "all_update")!=true)){
	        $user_id =getRowByTableColomId("drivers_licensing",$value->$tab_id,$tab_id,"user_id");
	        if($user_id==$this->user_id){
	     	echo '<a sty id="btnEditRow" class="modalButton mClass"  href="javascript:;" type="button" data-src="'.$value->$tab_id.'" title="Edit"><i class="fa fa-pencil" data-id=""></i></a>';
	        }
	      }
	      
	      if(CheckPermission("drivers_licensing", "all_delete")){
	      echo '<a data-toggle="modal" class="mClass" style="cursor:pointer;"  data-target="#cnfrm_delete" title="delete" onclick="setId('.$value->$tab_id.', \'drivers_licensing\')"><i class="fa fa-trash-o" ></i></a>';}
	      else if(CheckPermission("drivers_licensing", "own_delete") && (CheckPermission("drivers_licensing", "all_delete")!=true)){
	        $user_id =getRowByTableColomId("drivers_licensing",$value->$tab_id,$tab_id,"user_id");
	        if($user_id==$this->user_id){
		echo '<a data-toggle="modal" class="mClass" style="cursor:pointer;"  data-target="#cnfrm_delete" title="delete" onclick="setId('.$value->$tab_id.', \'drivers_licensing\')"><i class="fa fa-trash-o" ></i></a>';
	        }
	      } ?>
	    </td>
	  </tr>    

	  
	<?php } } ?>
