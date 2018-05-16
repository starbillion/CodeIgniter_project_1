<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper clearfix">
<!-- Main content -->
  <div class="col-md-12 form f-label">
  <?php if($this->session->flashdata("messagePr")){?>
    <div class="alert alert-info">      
      <?php echo $this->session->flashdata("messagePr")?>
    </div>
  <?php } ?>
    <!-- Profile Image -->
    <div class="box box-success pad-profile">
     	<div class="box-header with-border">
        <h3 class="box-title">Dashboard <small></small></h3>
      </div>
      <form method="post" enctype="multipart/form-data" action="<?php echo base_url().'user/add_edit' ?>" class="form-label-left">
        <div class="box-body box-profile">
          <div class="col-md-2">
            <div class="pic_size" id="image-holder"> 
            <?php  
              if(file_exists('assets/images/'.$user_data[0]->profile_pic) && isset($user_data[0]->profile_pic)){
              $profile_pic = $user_data[0]->profile_pic;
              }else{
              $profile_pic = 'user.png';}?>
              <center> <img class="thumb-image setpropileam" src="<?php echo base_url();?>/assets/images/<?php echo isset($profile_pic)?$profile_pic:'user.png';?>" alt="User profile picture"></center>
            </div>
            <br>
            <!--div class="fileUpload btn btn-success wdt-bg">
                <span>Change Picture</span>
                <input id="fileUpload" class="upload" name="profile_pic" type="file" accept="image/*" /><br />
                <input type="hidden" name="fileOld" value="<?php echo isset($user_data[0]->profile_pic)?$user_data[0]->profile_pic:'';?>" />
            </div-->
          </div>
          <div class="col-md-10">
            <h3>Personal Details</h3>  	
                                 <div class="box-body table-responsive">
<table id="example_personal_details" class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable">
                  <thead>
                  <tr>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Mobile Number</th>
                    <th>Email</th>                   
                    <th>Action</th>
                    </tr>
                   </thead>
                   <tbody>
                    <tr>                 
                        <td><?php echo (isset($user_data[0]->fullname)?$user_data[0]->fullname:'');?></td>
                        <td><?php echo (isset($user_data[0]->address)?$user_data[0]->address:'');?></td>
                        <td><?php echo (isset($user_data[0]->mobile_number)?$user_data[0]->mobile_number:'');?></td>
                        <td><?php echo (isset($user_data[0]->email)?$user_data[0]->email:'');?></td>
                        <td> <a href="javascript:void(0)" class="btn btn-primary modalButtonUser" data-form="personal" data-src="<?php echo (isset($user_data[0]->users_id)?$user_data[0]->users_id:'');?>" data-title="Personal Details">Edit</a></td>
                      </tr>
                        </tbody> 
                     </table>
                    </div>		  
                  <h3>Vehicle Details</h3> 
                      <div class="box-body table-responsive">
<table id="example_personal_details" class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable">
                  <thead>
                  <tr>
                    <th>Make</th>
                    <th>Model</th>
                    <th>Registration</th>
                    <th>Upload doc</th>                   
                    <th>Action</th>
                    </tr>
                   </thead>
                   <tbody>
                    <tr>                 
                        <td><?php echo (isset($user_data[0]->make)?$user_data[0]->make:'');?></td>
                        <td><?php echo (isset($user_data[0]->model)?$user_data[0]->model:'');?></td>
                        <td><?php echo (isset($user_data[0]->registration)?$user_data[0]->registration:'');?></td>
                        <td><?php echo (isset($user_data[0]->upload_doc)?$user_data[0]->upload_doc:'');?></td>
                        <td><a href="javascript:void(0)" class="btn btn-primary modalButtonUser" data-form="vehicle" data-src="<?php echo (isset($user_data[0]->users_id)?$user_data[0]->users_id:'');?>" data-title="Vehicle Details">Edit</a></td>
                      </tr>
                        </tbody> 
                     </table>
                    </div>  
                   <h3>Driver’s licensing</h3> 
                      <div class="box-body table-responsive">
<table id="example_personal_details" class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable">
                  <thead>
                  <tr>
                    <th>License</th>
                    <th>Upload driver’s PCO doc</th>
                    <th>Upload driver insurance doc</th>                                  
                    <th>Action</th>
                    </tr>
                   </thead>
                   <tbody>
                    <tr>                 
                        <td><?php echo (isset($user_data[0]->license)?$user_data[0]->license:'');?></td>
                        <td><?php echo (isset($user_data[0]->pco_doc)?$user_data[0]->pco_doc:'');?></td>
                        <td><?php echo (isset($user_data[0]->insurance_doc)?$user_data[0]->insurance_doc:'');?></td>                 
                        <td><a href="javascript:void(0)" class="btn btn-primary modalButtonUser" data-form="license" data-src="<?php echo (isset($user_data[0]->users_id)?$user_data[0]->users_id:'');?>" data-title="Driver’s licensing">Edit</a></td>
                      </tr>
                        </tbody> 
                     </table>
                    </div>
                    <h3>Set Availability</h3> 
                      <div class="box-body table-responsive">
<table id="example_personal_details" class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable">
                  <thead>
                  <tr>
                    <th>Sunday</th>
                    <th>Monday</th>
                    <th>Tuesday</th>                                  
                    <th>Wednesday</th>
                    <th>Thursday</th>
                    <th>Friday</th>
                    <th>Saturday</th>
                    <th>Action</th>
                    </tr>
                   </thead>
                   <tbody>
                    <tr>                 
                        <td><?php echo (isset($avail_data->sunday_to)?$avail_data->sunday_to:'');?><?php echo (isset($avail_data->sunday_from)?'-'.$avail_data->sunday_from:'');?></td>
                        <td><?php echo (isset($avail_data->monday_to)?$avail_data->monday_to:'');?><?php echo (isset($avail_data->monday_from)?'-'.$avail_data->monday_from:'');?></td>
                        <td><?php echo (isset($avail_data->tuesday_to)?$avail_data->tuesday_to:'');?><?php echo (isset($avail_data->tuesday_from)?'-'.$avail_data->tuesday_from:'');?></td>
                        <td><?php echo (isset($avail_data->wednesday_to)?$avail_data->wednesday_to:'');?><?php echo (isset($avail_data->wednesday_from)?'-'.$avail_data->wednesday_from:'');?></td>
                        <td><?php echo (isset($avail_data->thursday_to)?$avail_data->thursday_to:'');?><?php echo (isset($avail_data->thursday_from)?'-'.$avail_data->thursday_from:'');?></td>
                        <td><?php echo (isset($avail_data->friday_to)?$avail_data->friday_to:'');?><?php echo (isset($avail_data->friday_from)?'-'.$avail_data->friday_from:'');?></td>
                        <td><?php echo (isset($avail_data->saturday_to)?$avail_data->saturday_to:'');?><?php echo (isset($avail_data->saturday_from)?'-'.$avail_data->saturday_from:'');?></td>                                        
                        <td><a href="javascript:void(0)" class="btn btn-primary modalButtonUserAvail" data-form="license" data-src="<?php echo (isset($user_data[0]->users_id)?$user_data[0]->users_id:'');?>" data-title="Set Availability">Edit</a></td>
                      </tr>
                        </tbody> 
                     </table>
                    </div>   
                    <h3>Set Fare</h3> 
                      <div class="box-body table-responsive">
<table id="example_personal_details" class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable">
                  <thead>
                  <tr>
                    <th>Name</th>
                    <th>Duration</th>
                    <th>Price</th>                                  
                    <th>Action</th>
                    </tr>
                   </thead>
                   <tbody>
                    <tr>                 
                        <td><?php echo (isset($fare_data->fare_name)?$fare_data->fare_name:'');?></td>
                        <td><?php echo (isset($fare_data->fare_duration)?$fare_data->fare_duration.' minutes':'');?> </td>
                        <td><?php echo (isset($fare_data->fare_price)?$fare_data->fare_price.' £':'');?> </td>                 
                        <td><a href="javascript:void(0)" class="btn btn-primary modalButtonUserFare"  data-src="<?php echo (isset($user_data[0]->users_id)?$user_data[0]->users_id:'');?>" data-title="Set Fare">Edit</a></td>
                      </tr>
                        </tbody> 
                     </table>
                    </div>                           
          </div>
         <!-- /.box-body -->
        </div>
      </form>                     
      <!-- /.box -->
    </div>
    <!-- /.content -->
  </div>
</div>
<!-- /.content-wrapper -->

<!-- Modal Crud Start-->
<div class="modal fade" id="nameModal_user" role="dialog">
  <div class="modal-dialog">
    <div class="box box-primary popup" >
      <div class="box-header with-border formsize">
        <h3 class="box-title"></h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <!-- /.box-header -->
      <div class="modal-body" style="padding: 0px 0px 0px 0px;"></div>
    </div>
  </div>
</div><!--End Modal Crud --> 

<!-- Modal Crud Start-->
<div class="modal fade" id="nameModal_available" role="dialog">
  <div class="modal-dialog">
    <div class="box box-primary popup" >
      <div class="box-header with-border formsize">
        <h3 class="box-title">Set Availability</h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <!-- /.box-header -->
      <div class="modal-body" style="padding: 0px 0px 0px 0px;"></div>
    </div>
  </div>
</div><!--End Modal Crud --> 

