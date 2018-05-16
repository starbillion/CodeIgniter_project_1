<form action="<?php echo base_url()."personal_details/add_edit"; ?>" method="post" role="form" id="form" enctype="multipart/form-data" style="padding: 0px 30px">
 <?php if(isset($data->personal_details_id)){?><input type="hidden"  name="id" value="<?php echo isset($data->personal_details_id) ?$data->personal_details_id : "";?>"> <?php } ?>
 <div class="box-body"><div class="form-group">
			 		<label for="personal_details_name">Name <span class="text-red">*</span></label>
<input type="text" placeholder="Name" class="form-control" id="personal_details_name" name="personal_details_name" required value="<?php echo isset($data->personal_details_name)?$data->personal_details_name:"";?>"  >
</div>
<div class="form-group">
			 		<label for="personal_details_address">Address <span class="text-red">*</span></label>
<textarea rows="3" class="form-control" id="personal_details_address" name="personal_details_address" required><?php echo isset($data->personal_details_address)?$data->personal_details_address:"";?></textarea>
</div>
<div class="form-group">
			 		<label for="personal_details_telephone">Telephone </label>
<input type="number" placeholder="Telephone" class="form-control" id="personal_details_telephone" name="personal_details_telephone"  value="<?php echo isset($data->personal_details_telephone)?$data->personal_details_telephone:"";?>"  >
</div>
<div class="form-group">
			 		<label for="personal_details_mobile_number">Mobile Number <span class="text-red">*</span></label>
<input type="number" placeholder="Mobile Number" class="form-control" id="personal_details_mobile_number" name="personal_details_mobile_number" required value="<?php echo isset($data->personal_details_mobile_number)?$data->personal_details_mobile_number:"";?>"  >
</div>
<div class="form-group">
			 		<label for="personal_details_email">Email <span class="text-red">*</span></label>
<input type="email" placeholder="Email" class="form-control" id="personal_details_email" name="personal_details_email" required value="<?php echo isset($data->personal_details_email)?$data->personal_details_email:"";?>"  >
</div>
<div class="form-group">
			 		<label for="personal_details_upload_photo">Upload Photo </label>
<?php  
                        if( isset($data->personal_details_upload_photo) && !empty($data->personal_details_upload_photo)){ $req ="";}else{$req ="";}
						if(isset($data->personal_details_upload_photo))
						{
							$old_uploads = explode("," , $data->personal_details_upload_photo);
							foreach ($old_uploads as $old_upload) {
							?>
							<div class="wpb_old_files">
							<input type="hidden"  name="wpb_old_personal_details_upload_photo[]" value="<?php echo isset($old_upload) ?$old_upload : "";?>" class="check_old">
							<a href="<?php echo base_url().'assets/images/'.$old_upload ?>" download> <?php echo $old_upload; ?> </a> <span><i class="fa fa-close remove_old" onclick="del_file(<?php echo $i;?>)"></i></span></div>
						<?php 
							}
						} 
						?>
						<input type="file" data="" placeholder="Upload Photo" class="file-upload check_new" id="personal_details_upload_photo" name="personal_details_upload_photo[]" <?php echo $req; ?>  value="" onchange='validate_fileType(this.value,&quot;personal_details_upload_photo&quot;,&quot;jpg,png,jpeg,gif&quot;);' ><p id="error_personal_details_upload_photo"></p>
</div>
</div>
                  <!-- /.box-body -->
                  <div class="box-footer">
                  	 <input type="submit" value="Save" name="save" class="btn btn-primary btn-color">
                  </div>
               </form>