<body data-base-url="<?= base_url()?>">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link rel="stylesheet" href="<?= base_url()?>assets/js/plugins/datatables/jquery.dataTables.min.css">

<div id="page-container" class="sidebar-l side-scroll header-navbar-fixed">
            <!-- Side Overlay-->
            <aside id="side-overlay">
                <!-- Side Overlay Scroll Container -->
                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 258px;"><div id="side-overlay-scroll" style="overflow: hidden; width: auto; height: 258px;">
                    <!-- Side Header -->
                    <div class="side-header side-content">
                        <!-- Layout API, functionality initialized in App() -> uiLayoutApi() -->
                        <button class="btn btn-default pull-right" type="button" data-toggle="layout" data-action="side_overlay_close">
                            <i class="fa fa-times"></i>
                        </button>                        
                        <a href="<?php echo base_url().'user/logout'?>" class="btn btn-sm pull-right btn-rounded bg-success" style="line-height: 15px; margin-right: 10px; color: #fff;">logout</a>
                        <span class="font-w600"><?php echo (isset($user_data[0]->first_name)?$user_data[0]->first_name:'');?> <?php echo (isset($user_data[0]->last_name)?$user_data[0]->last_name:'');?></span>
                        <span class="font-w600">User Id : <?php echo (isset($user_data[0]->encrypt_user_id)?$user_data[0]->encrypt_user_id:'');?></span>
                    </div>
                    <!-- END Side Header -->

                    <!-- Side Content -->
                    <div class="side-content remove-padding-t">
                        <!-- Account -->
                        <div class="block pull-r-l">                          
                            <div class="block-content">
                                <form role="form bor-rad" class="form-horizontal" enctype="multipart/form-data" action="<?php echo base_url().'user/add_edit_user'?>" method="post">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <label for="bd-qsettings-name">First Name</label>
                                            <input class="form-control" type="text" id="bd-qsettings-name" name="first_name" placeholder="Enter your name.." value="<?php echo (isset($user_data[0]->first_name)?$user_data[0]->first_name:'');?>">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <label for="bd-qsettings-name">Last Name</label>
                                            <input class="form-control" type="text" id="bd-qsettings-name" name="last_name" placeholder="Enter your name.." value="<?php echo (isset($user_data[0]->last_name)?$user_data[0]->last_name:'');?>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <label for="bd-qsettings-email">Email</label>
                                            <input class="form-control" type="email" id="bd-qsettings-email" name="email" placeholder="Enter your email.." value="<?php echo (isset($user_data[0]->email)?$user_data[0]->email:'');?>">
                                        </div>
                                    </div>                                    
                                    <!--div class="form-group">
                                      <div class="col-xs-12">
                                        <label for="">Address</label>
                                        <textarea name="address" rows="2" class="form-control" placeholder="Address"> <?php echo isset($user_data[0]->address)?$user_data[0]->address:'';?> </textarea> 
                                      </div>
                                    </div-->
                                    <div class="form-group">
                                      <div class="col-xs-12">
                                       <label for="">Telephone</label>
                                         <input type="text" name="telephone" value="<?php echo isset($user_data[0]->telephone)?$user_data[0]->telephone:'';?>"  class="form-control" placeholder="Telephone">
                                    </div>
                                   </div> 
                                   <div class="form-group">
                                      <div class="col-xs-12">
                                       <label for="">Mobile Number</label>
                                         <input type="text" name="mobile_number" value="<?php echo isset($user_data[0]->mobile_number)?$user_data[0]->mobile_number:'';?>" required class="form-control" placeholder="Mobile number">
                                    </div>
                                   </div>
                                   <div class="form-group imsize"> 
                                      <div class="col-md-12">
                                        <label for="exampleInputFile">Image Upload</label>
                                        <div class="pic_size" id="image-holder"> 
                                          <?php if(!empty($user_data[0]->profile_pic) && file_exists('assets/images/'.$user_data[0]->profile_pic)){ 
                                            $profile_pic = $user_data[0]->profile_pic;
                                          }else{ 
                                            $profile_pic = 'user.png'; 
                                          } ?> 
                                          <left> <img class="thumb-image setpropileam" src="<?php echo base_url();?>/assets/images/<?php echo isset($profile_pic)?$profile_pic:'user.png';?>" alt="User profile picture"></left>
                                        </div> <input type="file" name="profile_pic" id="exampleInputFile">
                                      </div>
                                    </div>  
                                    <input type="hidden" name="fileOld" value="<?php echo !empty($user_data[0]->profile_pic)?$user_data[0]->profile_pic:'';?>">
                                    <input type="hidden"  name="users_id" value="<?php echo isset($user_data[0]->users_id)?$user_data[0]->users_id:'';?>">                                 
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <button class="btn btn-sm btn-minw btn-rounded bg-success" type="submit" style="color: #fff;">
                                                <i class="fa fa-check push-5-r"></i>Update
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- END Account -->
                    
                    </div>
                    <!-- END Side Content -->
                </div><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 5px; position: absolute; top: 0px; opacity: 0.35; display: block; border-radius: 7px; z-index: 99; right: 2px; height: 388.489px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 1; z-index: 90; right: 2px;"></div></div>
                <!-- END Side Overlay Scroll Container -->
            </aside>
            <!-- END Side Overlay -->
            <?php  
            if(!empty($user_data[0]->profile_pic) && file_exists('assets/images/'.$user_data[0]->profile_pic)){
            $profile_pic = $user_data[0]->profile_pic;
            }else{
            $profile_pic = 'user.png';}?>
            <!-- Header -->
            <header id="header-navbar">
                <div class="content-mini content-mini-full content-boxed">
                    <!-- Header Navigation Right -->
                    <ul class="nav-header pull-right">
                        <li class="visible-xs">
                            <!-- Toggle class helper (for .js-header-search below), functionality initialized in App() -> uiToggleClass() -->
                            <button class="btn btn-default" data-toggle="class-toggle" data-target=".js-header-search" data-class="header-search-xs-visible" type="button">
                                <i class="fa fa-search"></i>
                            </button>
                        </li>                      
                        <li>
                            <!-- Layout API, functionality initialized in App() -> uiLayoutApi() -->
                            <button class="btn btn-default btn-image" data-toggle="layout" data-action="side_overlay_toggle" type="button">
                                <img src="<?php echo base_url();?>/assets/images/<?php echo isset($profile_pic)?$profile_pic:'user.png';?>" alt="Avatar">
                                <i class="fa fa-ellipsis-v"></i>
                            </button>
                        </li>
                    </ul>
                    <!-- END Header Navigation Right -->

                    <!-- Header Navigation Left -->
                    <ul class="nav-header pull-left">
                        <li class="header-content">
                            <a class="h5" href="#">
                                <i class="fa fa-circle-o-notch text-primary"></i> <span class="h4 font-w600 text-primary-dark">ne</span>
                            </a>
                        </li>
                        <li>
                            <!-- Themes functionality initialized in App() -> uiHandleTheme() -->
                            <div class="btn-group">
                                <button class="btn btn-link text-gray dropdown-toggle" data-toggle="dropdown" type="button">
                                    <i class="si si-drop"></i>
                                </button>
                                
                            </div>
                        </li>
                    </ul>
                    <!-- END Header Navigation Left -->
                </div>
            </header>
            <!-- END Header -->

            <!-- Main Container -->
            <main id="main-container" style="min-height: 200px;">
                <!-- Sub Header -->
                <div class="bg-gray-lighter visible-xs">
                    <div class="content-mini content-boxed">
                        <button class="btn btn-block btn-default visible-xs push" data-toggle="collapse" data-target="#sub-header-nav">
                            <i class="fa fa-navicon push-5-r"></i>Menu
                        </button>
                    </div>
                </div>
                <div class="bg-primary-lighter collapse navbar-collapse remove-padding" id="sub-header-nav">
                    <div class="content-mini content-boxed">
                        <ul class="nav nav-pills nav-sub-header push">
                            <li class="<?=($this->uri->segment(2)==="dashboard")?"active":"not-active"?>">
                                <a href="<?= base_url()?>user/dashboard">
                                    <i class="fa fa-dashboard push-5-r"></i>Dashboard
                                </a>
                            </li>   
                            <li class="<?=($this->uri->segment(2)==="calendar")?"active":"not-active"?>">
                                <a href="<?= base_url()?>user/calendar">
<!--                                    <a href="#">-->
                                    <i class="fa fa-calendar push-5-r"></i>Uplift Scheduler
                                </a>
                            </li>
                            <li class="<?=($this->uri->segment(2)==="bookingDetails")?"active":"not-active"?>">
                                <a href="<?= base_url()?>user/bookingDetails">
<!--                                <a href="#">-->
                                    <i class="fa fa-book push-5-r"></i>Booking Details
                                </a>
                            </li>                      
                        </ul>
                    </div>
                </div>
                <!-- END Sub Header -->

                <!-- Page Content -->
                <div class="content content-boxed content-wrapper">
                    <!-- Section -->
                     <div class="content bg-image mb-30" style="background-image: url('<?=base_url();?>assets/img/photos/photo8@2x.jpg');">
                          <div class="push-50-t push-15 clearfix">
                            <div class="push-15-r pull-left animated fadeIn">                             
                               <img class="img-avatar img-avatar-thumb" src="<?php echo base_url();?>/assets/images/<?php echo isset($profile_pic)?$profile_pic:'user.png';?>" alt="">
                             </div>
                              <h1 class="h2 text-white push-5-t animated zoomIn"><?php echo (isset($user_data[0]->first_name)?$user_data[0]->first_name:'');?> <?php echo (isset($user_data[0]->last_name)?$user_data[0]->last_name:'');?></h1>
                              <h2 class="h5 text-white-op animated zoomIn">Driver</h2>
                          </div>
                      </div>
                    <!-- END Section -->      

                    <div class="row">
                      <div class="col-sm-12 col-lg-12 ">
                        <div class="block" style="min-height: 285px; padding-bottom: 10px;">
                        <div class="block-header bg-gray-lighter text-center">                         
                        <ul class="block-options">
                           
                        </ul>   
                           <div class="col-md-12">                  
                       
                     <!-- Partial Table -->
                    <div class="block">
                        <div class="block-header">
                            <h3 class="block-title">Booking Details</h3>
                        </div>
                        <div class="block-content">   
                        <form action="<?= base_url().'user/bookingDetails'?>" method="post">
                               <div class="row">
                               <label class="pull-left mt_7">Filter By:</label> 
                                    <div class="col-sm-6 dataTables_length">                                     
                                    <select name="filter" class="form-control pull-left ">
                                        <option value="">All</option>
                                        <option value="pending" <?php if($status == 'pending'){ echo 'selected';}?>>Pending</option>
                                        <option value="completed" <?php if($status == 'completed'){ echo 'selected'; }?>>Completed</option>
                                        <option value="cancel" <?php if($status == 'cancel'){ echo 'selected'; }?>>Cancel</option>                           
                                    </select> 
                                    <button class="btn btn-primary pull-left" type="submit">Search</button>
                                    </div>
                                    <div class="col-sm-1">                                   
                                    
                                    </div>
                               </div>
                           </form>
                        </div>
                        <div class="block-content">   
                         <?php if($bookDatasRecord > 0) { ?>
                            <table class="table table-bordered table-striped js-dataTable-full">
                                <thead>                                  
                                     <tr>
                                        <th class="text-center" style="width: 10%;">Status</th>
                                        <th class="hidden-xs" style="width: 30%;">Date and Time</th>
                                        <th style="width: 30%;">Name</th>
                                        <th class="hidden-xs" style="width: 20%;">Email</th>
                                        <th class="hidden-xs" style="width: 20%;">Phone</th>
                                        <th class="text-center" style="width: 10%;">S.No.</th>
                                    </tr>
                                </thead>
                                <tbody> 
                                <?php $i=1; foreach($bookDatas as $bookData) {                                    
                                    if(!empty($status)){
                                        if(booking_status($bookData->book_id) == $status){
                                     ?>
                                    <tr>
                                       <td class="hidden-sm">
                                        <?php if(booking_status($bookData->book_id) == 'pending') { ?>
                                            <span class="label label-success"><?= booking_status($bookData->book_id) ?></span>
                                        <?php } ?>
                                        <?php if(booking_status($bookData->book_id) == 'cancel') { ?>
                                            <span class="label label-danger"><?= booking_status($bookData->book_id) ?></span>
                                        <?php } ?>
                                        <?php if(booking_status($bookData->book_id) == 'completed') { ?>
                                            <span class="label label-warning"><?= booking_status($bookData->book_id) ?></span>    
                                        <?php } ?>                                        
                                       </td>  
                                       <td class="hidden-xs"><?= date('l, F d, Y (H:i)',strtotime($bookData->date_time_slot)) ?></td>                                        
                                        <td class="font-w600"><?= $bookData->client_first_name.' '.$bookData->client_last_name ?></td>
                                        <td class="hidden-xs"><?= $bookData->client_email ?></td>
                                        <td class="hidden-xs"><?= $bookData->client_phone ?></td>
                                        <td class="text-center">
                                            <?= $i; ?>
                                        </td>                               
                                    </tr>   
                                    <?php $i++; } }else{ ?>
                                      <tr>
                                        <td class="hidden-sm">
                                        <?php if(booking_status($bookData->book_id) == 'pending') { ?>
                                            <span class="label label-success"><?= booking_status($bookData->book_id) ?></span>
                                        <?php } ?>
                                        <?php if(booking_status($bookData->book_id) == 'cancel') { ?>
                                            <span class="label label-danger"><?= booking_status($bookData->book_id) ?></span>
                                        <?php } ?>
                                        <?php if(booking_status($bookData->book_id) == 'completed') { ?>
                                            <span class="label label-warning"><?= booking_status($bookData->book_id) ?></span>    
                                        <?php } ?>                                        
                                        </td> 
                                        <td class="hidden-xs"><?= date('l, F d, Y (H:i)',strtotime($bookData->date_time_slot)) ?></td>
                                        <td class="font-w600"><?= $bookData->client_first_name.' '.$bookData->client_last_name ?></td>
                                        <td class="hidden-xs"><?= $bookData->client_email ?></td>
                                        <td class="hidden-xs"><?= $bookData->client_phone ?></td>
                                        <td class="text-center">
                                            <?= $i; ?>
                                        </td>                                                                 
                                    </tr>

                                    <?php $i++; } } ?>                            
                                </tbody>
                            </table>
                            <?php }else{ ?> 
                                <h3 class="dataTables_empty"> No results found. </h3>
                            <?php } ?>
                        </div>
                    </div>
                    <!-- END Partial Table -->

                           </div>     
                        </div>
                      </div>
                    </div>
                   
                    </div>


                </div>
                <!-- END Page Content -->
            </main>
            <!-- END Main Container -->

    <!-- Footer -->
    <footer id="page-footer" class="bg-body font-s12">
        <div class="content-mini content-mini-full content-boxed clearfix push-15">
            <div class="pull-right">
            </div>
            <div class="pull-left">
                <a class="font-w600" href="http://uplift.vip/" target="_blank">Uplift</a> © <span
                        class="js-year-copy">2018</span>
            </div>
        </div>
    </footer>
    <!-- END Footer -->
        </div>

</body>
       
        <!-- Page JS Plugins -->
        <script src="<?= base_url()?>assets/js/plugins/datatables/jquery.dataTables.min.js"></script>

        <!-- Page JS Code -->
        <script src="<?= base_url()?>assets/js/pages/base_tables_datatables.js"></script>
        <style type="text/css">
            div.dataTables_info {
                text-align: left;
            }
            div.dataTables_paginate {
                text-align: right;
            }
   
            div.dataTables_length select {
                width: 200px;
                margin-right: 10px;
            }
           .mt_7{
                margin-top: 7px;
           }

        </style>