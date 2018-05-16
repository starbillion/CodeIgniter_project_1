<form action="<?php echo base_url()."drivers_licensing/add_edit"; ?>" method="post" role="form" id="form" enctype="multipart/form-data" style="padding: 0px 30px">
 <?php if(isset($data->drivers_licensing_id)){?><input type="hidden"  name="id" value="<?php echo isset($data->drivers_licensing_id) ?$data->drivers_licensing_id : "";?>"> <?php } ?>
 <div class="box-body"><div class="form-group">
			 		<label for="drivers_licensing_license">License <span class="text-red">*</span></label>
<input type="text" placeholder="License" class="form-control" id="drivers_licensing_license" name="drivers_licensing_license" required value="<?php echo isset($data->drivers_licensing_license)?$data->drivers_licensing_license:"";?>"  >
</div>
<div class="form-group">
			 		<label for="drivers_licensing_upload_drivers_pco_doc">Upload drivers PCO doc </label>
<?php  
                        if( isset($data->drivers_licensing_upload_drivers_pco_doc) && !empty($data->drivers_licensing_upload_drivers_pco_doc)){ $req ="";}else{$req ="";}
						if(isset($data->drivers_licensing_upload_drivers_pco_doc))
						{
							$old_uploads = explode("," , $data->drivers_licensing_upload_drivers_pco_doc);
							foreach ($old_uploads as $old_upload) {
							?>
							<div class="wpb_old_files">
							<input type="hidden"  name="wpb_old_drivers_licensing_upload_drivers_pco_doc[]" value="<?php echo isset($old_upload) ?$old_upload : "";?>" class="check_old">
							<a href="<?php echo base_url().'assets/images/'.$old_upload ?>" download> <?php echo $old_upload; ?> </a> <span><i class="fa fa-close remove_old" onclick="del_file(<?php echo $i;?>)"></i></span></div>
						<?php 
							}
						} 
						?>
						<input type="file" data="" placeholder="Upload drivers PCO doc" class="file-upload check_new" id="drivers_licensing_upload_drivers_pco_doc" name="drivers_licensing_upload_drivers_pco_doc[]" <?php echo $req; ?>  value="" onchange='validate_fileType(this.value,&quot;drivers_licensing_upload_drivers_pco_doc&quot;,&quot;doc,docx,pdf,jpg,png&quot;);' ><p id="error_drivers_licensing_upload_drivers_pco_doc"></p>
</div>
<div class="form-group">
			 		<label for="drivers_licensing_upload_driver_insurance_doc">Upload driver insurance doc </label>
<?php  
                        if( isset($data->drivers_licensing_upload_driver_insurance_doc) && !empty($data->drivers_licensing_upload_driver_insurance_doc)){ $req ="";}else{$req ="";}
						if(isset($data->drivers_licensing_upload_driver_insurance_doc))
						{
							$old_uploads = explode("," , $data->drivers_licensing_upload_driver_insurance_doc);
							foreach ($old_uploads as $old_upload) {
							?>
							<div class="wpb_old_files">
							<input type="hidden"  name="wpb_old_drivers_licensing_upload_driver_insurance_doc[]" value="<?php echo isset($old_upload) ?$old_upload : "";?>" class="check_old">
							<a href="<?php echo base_url().'assets/images/'.$old_upload ?>" download> <?php echo $old_upload; ?> </a> <span><i class="fa fa-close remove_old" onclick="del_file(<?php echo $i;?>)"></i></span></div>
						<?php 
							}
						} 
						?>
						<input type="file" data="" placeholder="Upload driver insurance doc" class="file-upload check_new" id="drivers_licensing_upload_driver_insurance_doc" name="drivers_licensing_upload_driver_insurance_doc[]" <?php echo $req; ?>  value="" onchange='validate_fileType(this.value,&quot;drivers_licensing_upload_driver_insurance_doc&quot;,&quot;doc,docx,pdf,jpg,png&quot;);' ><p id="error_drivers_licensing_upload_driver_insurance_doc"></p>
</div>
</div>
                  <!-- /.box-body -->
                  <div class="box-footer">
                  	 <input type="submit" value="Save" name="save" class="btn btn-primary btn-color">
                  </div>
               </form>