<form action="<?php echo base_url()."enter_username_and_password/add_edit"; ?>" method="post" role="form" id="form" enctype="multipart/form-data" style="padding: 0px 30px">
 <?php if(isset($data->enter_username_and_password_id)){?><input type="hidden"  name="id" value="<?php echo isset($data->enter_username_and_password_id) ?$data->enter_username_and_password_id : "";?>"> <?php } ?>
 <div class="box-body"><div class="form-group">
			 		<label for="enter_username_and_password_username">Username <span class="text-red">*</span></label>
<input type="text" placeholder="Username" class="form-control" id="enter_username_and_password_username" name="enter_username_and_password_username" required value="<?php echo isset($data->enter_username_and_password_username)?$data->enter_username_and_password_username:"";?>"  >
</div>
<div class="form-group">
			 		<label for="enter_username_and_password_password">Password <span class="text-red">*</span></label>
<input type="text" placeholder="Password" class="form-control" id="enter_username_and_password_password" name="enter_username_and_password_password" required value="<?php echo isset($data->enter_username_and_password_password)?$data->enter_username_and_password_password:"";?>"  >
</div>
</div>
                  <!-- /.box-body -->
                  <div class="box-footer">
                  	 <input type="submit" value="Save" name="save" class="btn btn-primary btn-color">
                  </div>
               </form>