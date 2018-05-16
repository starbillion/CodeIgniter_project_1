<form action="<?php echo base_url()."vehicle_details/add_edit"; ?>" method="post" role="form" id="form" enctype="multipart/form-data" style="padding: 0px 30px">
 <?php if(isset($data->vehicle_details_id)){?><input type="hidden"  name="id" value="<?php echo isset($data->vehicle_details_id) ?$data->vehicle_details_id : "";?>"> <?php } ?>
 <div class="box-body"><div class="form-group">
			 		<label for="vehicle_details_model">Model <span class="text-red">*</span></label>
<input type="text" placeholder="Model" class="form-control" id="vehicle_details_model" name="vehicle_details_model" required value="<?php echo isset($data->vehicle_details_model)?$data->vehicle_details_model:"";?>"  >
</div>
<div class="form-group">
			 		<label for="vehicle_details_make">Make <span class="text-red">*</span></label>
<input type="text" placeholder="Make" class="form-control" id="vehicle_details_make" name="vehicle_details_make" required value="<?php echo isset($data->vehicle_details_make)?$data->vehicle_details_make:"";?>"  >
</div>
<div class="form-group">
			 		<label for="vehicle_details_registration">Registration <span class="text-red">*</span></label>
<input type="text" placeholder="Registration" class="form-control" id="vehicle_details_registration" name="vehicle_details_registration" required value="<?php echo isset($data->vehicle_details_registration)?$data->vehicle_details_registration:"";?>"  >
</div>
<div class="form-group">
			 		<label for="vehicle_details_upload_doc">Upload doc </label>
<?php  
                        if( isset($data->vehicle_details_upload_doc) && !empty($data->vehicle_details_upload_doc)){ $req ="";}else{$req ="";}
						if(isset($data->vehicle_details_upload_doc))
						{
							$old_uploads = explode("," , $data->vehicle_details_upload_doc);
							foreach ($old_uploads as $old_upload) {
							?>
							<div class="wpb_old_files">
							<input type="hidden"  name="wpb_old_vehicle_details_upload_doc[]" value="<?php echo isset($old_upload) ?$old_upload : "";?>" class="check_old">
							<a href="<?php echo base_url().'assets/images/'.$old_upload ?>" download> <?php echo $old_upload; ?> </a> <span><i class="fa fa-close remove_old" onclick="del_file(<?php echo $i;?>)"></i></span></div>
						<?php 
							}
						} 
						?>
						<input type="file" data="" placeholder="Upload doc" class="file-upload check_new" id="vehicle_details_upload_doc" name="vehicle_details_upload_doc[]" <?php echo $req; ?>  value="" onchange='validate_fileType(this.value,&quot;vehicle_details_upload_doc&quot;,&quot;doc,docx,pdf&quot;);' ><p id="error_vehicle_details_upload_doc"></p>
</div>
</div>
                  <!-- /.box-body -->
                  <div class="box-footer">
                  	 <input type="submit" value="Save" name="save" class="btn btn-primary btn-color">
                  </div>
               </form>