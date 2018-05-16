<?php
//$this->load->view('header');
?>
<body data-base-url="<?= base_url() ?>">
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<div id="page-container" class="sidebar-l side-scroll header-navbar-fixed">
    <!-- Side Overlay-->
    <aside id="side-overlay">
        <!-- Side Overlay Scroll Container -->
        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 258px;">
            <div id="side-overlay-scroll" style="overflow: hidden; width: auto; height: 258px;">
                <!-- Side Header -->
                <div class="side-header side-content">
                    <!-- Layout API, functionality initialized in App() -> uiLayoutApi() -->
                    <button class="btn btn-default pull-right" type="button" data-toggle="layout"
                            data-action="side_overlay_close">
                        <i class="fa fa-times"></i>
                    </button>
                    <a href="<?php echo base_url() . 'user/logout' ?>"
                       class="btn btn-sm pull-right btn-rounded bg-success"
                       style="line-height: 15px; margin-right: 10px; color: #fff;">logout</a>
                    <span class="font-w600"><?php echo(isset($user_data[0]->first_name) ? $user_data[0]->first_name : ''); ?><?php echo(isset($user_data[0]->last_name) ? $user_data[0]->last_name : ''); ?> </span>
                    <span class="font-w600">User Id : <?php echo(isset($user_data[0]->encrypt_user_id) ? $user_data[0]->encrypt_user_id : ''); ?></span>

                </div>
                <!-- END Side Header -->

                <!-- Side Content -->
                <div class="side-content remove-padding-t">
                    <!-- Account -->
                    <div class="block pull-r-l">
                        <div class="block-content">
                            <form role="form bor-rad" class="form-horizontal" enctype="multipart/form-data"
                                  action="<?php echo base_url() . 'user/add_edit_user' ?>" method="post">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="bd-qsettings-name">First Name</label>
                                        <input class="form-control" type="text" id="bd-qsettings-name" name="first_name"
                                               placeholder="Enter your name.."
                                               value="<?php echo(isset($user_data[0]->first_name) ? $user_data[0]->first_name : ''); ?>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="bd-qsettings-name">Last Name</label>
                                        <input class="form-control" type="text" id="bd-qsettings-name" name="last_name"
                                               placeholder="Enter your name.."
                                               value="<?php echo(isset($user_data[0]->last_name) ? $user_data[0]->last_name : ''); ?>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="bd-qsettings-email">Email</label>
                                        <input class="form-control" type="email" id="bd-qsettings-email" name="email"
                                               placeholder="Enter your email.."
                                               value="<?php echo(isset($user_data[0]->email) ? $user_data[0]->email : ''); ?>">
                                    </div>
                                </div>
                                <!--div class="form-group">
                                      <div class="col-xs-12">
                                        <label for="">Address</label>
                                        <textarea name="address" rows="2" class="form-control" placeholder="Address"> <?php echo isset($user_data[0]->address) ? $user_data[0]->address : ''; ?> </textarea>
                                      </div>
                                    </div-->
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="">Telephone</label>
                                        <input type="text" name="telephone"
                                               value="<?php echo isset($user_data[0]->telephone) ? $user_data[0]->telephone : ''; ?>"
                                               class="form-control" placeholder="Telephone">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="">Mobile Number</label>
                                        <input type="text" name="mobile_number"
                                               value="<?php echo isset($user_data[0]->mobile_number) ? $user_data[0]->mobile_number : ''; ?>"
                                               required class="form-control" placeholder="Mobile number">
                                    </div>
                                </div>
                                <div class="form-group imsize">
                                    <div class="col-md-12">
                                        <label for="exampleInputFile">Image Upload</label>
                                        <div class="pic_size" id="image-holder">
                                            <?php if (!empty($user_data[0]->profile_pic) && file_exists('assets/images/' . $user_data[0]->profile_pic)) {
                                                $profile_pic = $user_data[0]->profile_pic;
                                            } else {
                                                $profile_pic = 'user.png';
                                            } ?>
                                            <left><img class="thumb-image setpropileam"
                                                       src="<?php echo base_url(); ?>/assets/images/<?php echo isset($profile_pic) ? $profile_pic : 'user.png'; ?>"
                                                       alt="User profile picture"></left>
                                        </div>
                                        <input type="file" name="profile_pic" id="exampleInputFile">
                                    </div>
                                </div>
                                <input type="hidden" name="fileOld"
                                       value="<?php echo !empty($user_data[0]->profile_pic) ? $user_data[0]->profile_pic : ''; ?>">
                                <input type="hidden" name="users_id"
                                       value="<?php echo isset($user_data[0]->users_id) ? $user_data[0]->users_id : ''; ?>">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <button class="btn btn-sm btn-minw btn-rounded bg-success" type="submit"
                                                style="color: #fff;">
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
            </div>
            <div class="slimScrollBar"
                 style="background: rgb(0, 0, 0); width: 5px; position: absolute; top: 0px; opacity: 0.35; display: block; border-radius: 7px; z-index: 99; right: 2px; height: 388.489px;"></div>
            <div class="slimScrollRail"
                 style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 1; z-index: 90; right: 2px;"></div>
        </div>
        <!-- END Side Overlay Scroll Container -->
    </aside>
    <!-- END Side Overlay -->
    <?php
    if (!empty($user_data[0]->profile_pic) && file_exists('assets/images/' . $user_data[0]->profile_pic)) {
        $profile_pic = $user_data[0]->profile_pic;
    } else {
        $profile_pic = 'user.png';
    } ?>
    <!-- Header -->
    <header id="header-navbar">
        <div class="content-mini content-mini-full content-boxed">
            <!-- Header Navigation Right -->
            <ul class="nav-header pull-right">
                <!--li class="visible-xs">
                    < Toggle class helper (for .js-header-search below), functionality initialized in App() -> uiToggleClass()>
                    <button class="btn btn-default" data-toggle="class-toggle" data-target=".js-header-search" data-class="header-search-xs-visible" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                </li-->
                <li>
                    <!-- Layout API, functionality initialized in App() -> uiLayoutApi() -->
                    <button class="btn btn-default btn-image" data-toggle="layout" data-action="side_overlay_toggle"
                            type="button">
                        <img src="<?php echo base_url(); ?>/assets/images/<?php echo isset($profile_pic) ? $profile_pic : 'user.png'; ?>"
                             alt="Avatar">
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
                <button class="btn btn-block btn-default visible-xs push" data-toggle="collapse"
                        data-target="#sub-header-nav">
                    <i class="fa fa-navicon push-5-r"></i>Menu
                </button>
            </div>
        </div>
        <div class="bg-primary-lighter collapse navbar-collapse remove-padding" id="sub-header-nav">
            <div class="content-mini content-boxed">
                <ul class="nav nav-pills nav-sub-header push">
                    <li class="<?= ($this->uri->segment(2) === "dashboard") ? "active" : "not-active" ?>">
                        <a href="<?= base_url() ?>user/dashboard">
                            <i class="fa fa-dashboard push-5-r"></i>Dashboard
                        </a>
                    </li>
                    <li class="<?= ($this->uri->segment(2) === "calendar") ? "active" : "not-active" ?>">
                        <a href="<?= base_url() ?>user/calendar">
<!--                            <a href="#">-->

                            <i class="fa fa-calendar push-5-r"></i>Uplift Scheduler
                        </a>
                    </li>
                    <li class="<?= ($this->uri->segment(2) === "bookingDetails") ? "active" : "not-active" ?>">
                        <a href="<?= base_url() ?>user/bookingDetails">
<!--                            <a href="#">-->
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
            <div class="content bg-image mb-30"
                 style="background-image: url('<?= base_url(); ?>assets/img/photos/photo8@2x.jpg');">
                <div class="push-50-t push-15 clearfix">
                    <div class="push-15-r pull-left animated fadeIn">
                        <img class="img-avatar img-avatar-thumb"
                             src="<?php echo base_url(); ?>/assets/images/<?php echo isset($profile_pic) ? $profile_pic : 'user.png'; ?>"
                             alt="">
                    </div>
                    <h1 class="h2 text-white push-5-t animated zoomIn">
                        <?php echo(isset($user_data[0]->first_name) ? $user_data[0]->first_name : ''); ?>
                        <?php echo(isset($user_data[0]->last_name) ? $user_data[0]->last_name : ''); ?>
                    </h1>
                    <h2 class="h5 text-white-op animated zoomIn">Driver</h2>
                </div>
            </div>
            <!-- END Section -->

            <!-- Stats -->
            <div class="row">
                <div class="col-sm-7 col-lg-8">
                    <div class="block">
                        <?php if ($this->session->flashdata("messagePr")) { ?>
                            <div class="alert alert-info">
                                <?php echo $this->session->flashdata("messagePr") ?>
                            </div>
                        <?php } ?>
                        <div class="block-header bg-gray-lighter">
                            <ul class="block-options">
                                <li>
                                    <a href="javascript:void(0)" class="modalButtonUserAvail" data-form="license"
                                       data-src="<?php echo(isset($user_data[0]->users_id) ? $user_data[0]->users_id : ''); ?>"
                                       data-title="Set Availability"><i class="fa fa-fw fa-pencil"></i></a>
                                </li>
                            </ul>
                            <h3 class="block-title"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Availability</h3>
                        </div>
                        <div class="block-content" style="padding-bottom: 40px;">
                            <div class="row">
                                <div class="box-body table-responsive">
                                    <table id="example_personal_details"
                                           class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable">
                                        <thead>
                                        <tr>
                                            <th>&nbsp;</th>
                                            <th>Sunday</th>
                                            <th>Monday</th>
                                            <th>Tuesday</th>
                                            <th>Wednesday</th>
                                            <th>Thursday</th>
                                            <th>Friday</th>
                                            <th>Saturday</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>From</td>
                                            <td><?php echo(isset($avail_data->sunday_to) ? $avail_data->sunday_to : ''); ?></td>
                                            <td><?php echo(isset($avail_data->monday_to) ? $avail_data->monday_to : ''); ?></td>
                                            <td><?php echo(isset($avail_data->tuesday_to) ? $avail_data->tuesday_to : ''); ?></td>
                                            <td><?php echo(isset($avail_data->wednesday_to) ? $avail_data->wednesday_to : ''); ?></td>
                                            <td><?php echo(isset($avail_data->thursday_to) ? $avail_data->thursday_to : ''); ?></td>
                                            <td><?php echo(isset($avail_data->friday_to) ? $avail_data->friday_to : ''); ?></td>
                                            <td><?php echo(isset($avail_data->saturday_to) ? $avail_data->saturday_to : ''); ?></td>

                                        </tr>
                                        <tr>
                                            <td> To</td>
                                            <td><?php echo(isset($avail_data->sunday_from) ? $avail_data->sunday_from : ''); ?></td>
                                            <td><?php echo(isset($avail_data->monday_from) ? $avail_data->monday_from : ''); ?></td>
                                            <td><?php echo(isset($avail_data->tuesday_from) ? $avail_data->tuesday_from : ''); ?></td>
                                            <td><?php echo(isset($avail_data->wednesday_from) ? $avail_data->wednesday_from : ''); ?></td>
                                            <td><?php echo(isset($avail_data->thursday_from) ? $avail_data->thursday_from : ''); ?></td>
                                            <td><?php echo(isset($avail_data->friday_from) ? $avail_data->friday_from : ''); ?></td>
                                            <td><?php echo(isset($avail_data->saturday_from) ? $avail_data->saturday_from : ''); ?></td>

                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="block">
                        <div class="block-header bg-gray-lighter">
                            <ul class="block-options">
                                <li>
                                    <!--a href="javascript:void(0)" class="modalButtonUserAvail" data-form="license" data-src="<?php echo(isset($user_data[0]->users_id) ? $user_data[0]->users_id : ''); ?>" data-title="Set Availability"><i class="fa fa-fw fa-pencil"></i></a-->
                                    <!--i class="fa fa-fw fa-pencil"></i-->
                                </li>
                            </ul>
                            <h3 class="block-title"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Subscription</h3>
                        </div>
                        <div class="block-content" style="padding-bottom: 74px; padding-top: 62px;">
                            <form action="<?= base_url() ?>payment" method="post">
                                <input type="hidden" name="amount"
                                       value="<?= !empty($subs_data->plan_amount) ? $subs_data->plan_amount : '' ?>">
                                <input type="hidden" name="plan_name"
                                       value="<?= !empty($subs_data->plan_name) ? $subs_data->plan_name : '' ?>">
                                <input type="hidden" name="plan_id"
                                       value="<?= !empty($subs_data->plan_id) ? $subs_data->plan_id : '' ?>">
                                <input type="hidden" name="expire_date"
                                       value="<?= !empty($subs_data->expire_date) ? $subs_data->expire_date : '' ?>">

                                <ul class="list list-simple list-li-clearfix">
                                    <li>
                                        <a class="item item-rounded pull-left push-10-r bg-info pd-15"
                                           href="javascript:void(0)">
                                            <i class="fa fa-rocket text-white-op"></i>
                                        </a>
                                        <h5 class="push-10-t"><?= !empty($subs_data->plan_name) ? $subs_data->plan_name : '' ?></h5>
                                        <!--div class="font-s13">Expire Date : <?= !empty($subs_data->expire_date) ? date('M d, Y', strtotime($subs_data->expire_date)) : '' ?></div-->
                                        <!--button class="btn-renew" type="submit">(Renew) </button-->
                                        <a class="btn-renew cancel_button" href="javascript:void(0)"
                                           data-id="<?php echo $user_data[0]->users_id; ?>" class="">(Cancel) </a>
                                    </li>
                                </ul>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Stats -->

            <!-- Charts -->
            <div class="row">
                <div class="col-sm-7 col-lg-8">
                    <div class="block block-rounded block-link-hover3 " style="min-height: 310px;">
                        <div class="block-header bg-gray-lighter">
                            <ul class="block-options">
                                <li>
                                    <a href="javascript:void(0)" class="modalButtonUserFare"
                                       data-src="<?php echo(isset($user_data[0]->users_id) ? $user_data[0]->users_id : ''); ?>"
                                       data-title="Set Fare"><i class="fa fa-fw fa-pencil"></i></a>
                                </li>
                            </ul>
                            <h3 class="block-title">£ &nbsp;&nbsp;Fare</h3>
                        </div>
                        <div class="block-content block-content-full">
                            <!--div class="h4">Set Fare <a href="javascript:void(0)" class="modalButtonUserFare"  data-src="<?php echo(isset($user_data[0]->users_id) ? $user_data[0]->users_id : ''); ?>" data-title="Set Fare"><i class="fa fa-fw fa-pencil"></i></a></div-->
                            <div class="box-body table-responsive">
                                <table id="example_personal_details"
                                       class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Duration</th>
                                        <th>Price</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($fareDatas as $fare_data) { ?>


                                        <?php if ($fare_data->fare_status == 'mile') { ?>
                                            <tr>
                                                <td><?php echo(isset($fare_data->fare_name) ? $fare_data->fare_name : ''); ?></td>
                                                <td><?php echo(!empty($fare_data->fare_duration) ? $fare_data->fare_duration : ''); ?> </td>
                                                <td><?php echo(!empty($fare_data->fare_price) ? '£ ' . $fare_data->fare_price : ''); ?> </td>
                                            </tr>
                                        <?php } else { ?>
                                            <tr>
                                                <td><?php echo(isset($fare_data->fare_name) ? $fare_data->fare_name : ''); ?></td>
                                                <td><?php echo(isset($fare_data->fare_duration) ? $fare_data->fare_duration . ' minutes' : ''); ?> </td>
                                                <td><?php echo(isset($fare_data->fare_price) ? '£ ' . $fare_data->fare_price : ''); ?> </td>
                                            </tr>
                                        <?php } ?>


                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5 col-lg-4">
                    <div class="block">
                        <div class="block-header bg-gray-lighter">
                            <ul class="block-options">
                                <li>
                                    <a href="javascript:void(0)" class="modalButtonUser" data-form="license"
                                       data-src="<?php echo(isset($user_data[0]->users_id) ? $user_data[0]->users_id : ''); ?>"
                                       data-title="License"><i class="fa fa-fw fa-pencil"></i></a>
                                </li>
                            </ul>
                            <h3 class="block-title"><i class="fa fa-fw fa-briefcase"></i> Driver’s licensing</h3>
                        </div>
                        <div class="block-content">
                            <ul class="list list-simple list-li-clearfix">
                                <!--li>
                      <a class="item item-rounded pull-left push-10-r bg-info pd-15" href="javascript:void(0)" style="background-color:#46c3a5">
                      <i class="si si-rocket text-white-op"></i>
                      </a>
                      <h5 class="push-10-t">License Expire Date</h5>                      
                      <div class="font-s13"><?php echo(isset($user_data[0]->license_expire_date) ? date('M d, Y', strtotime($user_data[0]->license_expire_date)) : ''); ?></div>
                      </li-->
                                <li>
                                    <?php if (!empty($user_data[0]->license_pic)) { ?>
                                        <img src="<?php echo base_url(); ?>/assets/images/<?php echo(isset($user_data[0]->license_pic) ? $user_data[0]->license_pic : ''); ?>"
                                             width="60" height="60" class="pull-left push-10-r "/>
                                    <?php } else { ?>
                                        <a class="item item-rounded pull-left push-10-r bg-amethyst pd-15"
                                           href="javascript:void(0)">
                                            <i class="si si-calendar text-white-op"></i>
                                        </a>
                                    <?php } ?>

                                    <h5 class="push-10-t"> Upload Driver Pic with License</h5>
                                    <div class="font-s13">
                                        <a href="<?php echo base_url(); ?>/assets/images/<?php echo(isset($user_data[0]->license_pic) ? $user_data[0]->license_pic : ''); ?>"
                                           target="_blank"><?php echo(isset($user_data[0]->license_pic) ? $user_data[0]->license_pic : ''); ?></a>
                                    </div>
                                </li>
                                <li>
                                    <a class="item item-rounded pull-left push-10-r bg-info pd-15"
                                       href="javascript:void(0)">
                                        <i class="fa fa-rocket text-white-op"></i>
                                    </a>
                                    <h5 class="push-10-t">License</h5>
                                    <div class="font-s13"><a
                                                href="<?php echo base_url(); ?>/assets/images/<?php echo(isset($user_data[0]->license) ? $user_data[0]->license : ''); ?>"
                                                target="_blank"><?php echo(isset($user_data[0]->license) ? $user_data[0]->license : ''); ?></a> <?php echo((isset($user_data[0]->license_expire_date) && $user_data[0]->license_expire_date != '0000-00-00') ? ' (' . date('M d, Y', strtotime($user_data[0]->license_expire_date)) . ')' : ''); ?>
                                    </div>
                                </li>
                                <li>
                                    <a class="item item-rounded pull-left push-10-r bg-amethyst pd-15"
                                       href="javascript:void(0)">
                                        <i class="fa fa-calendar text-white-op"></i>
                                    </a>
                                    <h5 class="push-10-t">Driver’s PCO doc</h5>
                                    <div class="font-s13"><a
                                                href="<?php echo base_url(); ?>/assets/images/<?php echo(isset($user_data[0]->pco_doc) ? $user_data[0]->pco_doc : ''); ?>"
                                                target="_blank"><?php echo(isset($user_data[0]->pco_doc) ? $user_data[0]->pco_doc : ''); ?></a> <?php echo((isset($user_data[0]->pco_expire_date) && $user_data[0]->pco_expire_date != '0000-00-00') ? ' (' . date('M d, Y', strtotime($user_data[0]->pco_expire_date)) . ')' : ''); ?>
                                    </div>
                                </li>
                                <li>
                                    <a class="item item-rounded pull-left push-10-r bg-danger pd-15"
                                       href="javascript:void(0)">
                                        <i class="fa fa-speedometer text-white-op"></i>
                                    </a>
                                    <h5 class="push-10-t">Driver insurance doc</h5>
                                    <div class="font-s13"><a
                                                href="<?php echo base_url(); ?>/assets/images/<?php echo(isset($user_data[0]->insurance_doc) ? $user_data[0]->insurance_doc : ''); ?>"
                                                target="_blank"><?php echo(isset($user_data[0]->insurance_doc) ? $user_data[0]->insurance_doc : ''); ?></a> <?php echo((isset($user_data[0]->insurance_expire_date) && $user_data[0]->insurance_expire_date != '0000-00-00') ? ' (' . date('M d, Y', strtotime($user_data[0]->insurance_expire_date)) . ')' : ''); ?>
                                    </div>
                                </li>


                            </ul>
                            <!--div class="text-center push">
                            <small><a href="javascript:void(0)">View More..</a></small>
                            </div-->
                        </div>
                    </div>

                </div>
            </div>
            <!-- END Charts -->


            <div class="row">
                <div class="col-sm-7 col-lg-8">
                    <div class="block">
                        <div class="block-header bg-gray-lighter">
                            <ul class="block-options">
                                <li>
                                    <a href="javascript:void(0)" class="modalButtonUser"
                                       data-form="vehicle"
                                       data-src="<?php echo(isset($user_data[0]->users_id) ? $user_data[0]->users_id : ''); ?>"
                                       data-title="Vehical Details">
                                        <i class="fa fa-fw fa-pencil"></i>
                                    </a>
                                </li>
                            </ul>
                            <h3 class="block-title"><i class="fa fa-fw fa-car"></i>&nbsp;&nbsp;Vehical Details</h3>
                        </div>
                        <div class="block-content" style="padding-bottom: 40px;">
                            <div class="row">
                                <div class="box-body table-responsive">
                                    <table id="example_personal_details"
                                           class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable">
                                        <thead>
                                        <tr>

                                            <th>Make</th>
                                            <th>Model</th>
                                            <th>Colour</th>
                                            <th>Registration</th>
                                            <th>PHV Doc (Expire Date)</th>
                                            <th>M.O.T. Doc (Expire Date)</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>

                                            <td><?php echo(isset($user_data[0]->make) ? getData($user_data[0]->make, 'make') : ''); ?></td>
                                            <td><?php echo(isset($user_data[0]->model) ? getData($user_data[0]->model, 'model') : ''); ?></td>
                                            <td><?php echo(isset($user_data[0]->colour) ? getData($user_data[0]->model, 'colours') : ''); ?></td>
                                            <td><?php echo(isset($user_data[0]->registration) ? $user_data[0]->registration : ''); ?></td>
                                            <td>
                                                <a href="<?php echo base_url(); ?>/assets/images/<?php echo(isset($user_data[0]->upload_doc) ? $user_data[0]->upload_doc : ''); ?>"
                                                   target="_blank"><?php echo(isset($user_data[0]->upload_doc) ? $user_data[0]->upload_doc : ''); ?></a> <?php echo((isset($user_data[0]->phv_expire_date) && $user_data[0]->phv_expire_date != '0000-00-00') ? ' (' . date('M d, Y', strtotime($user_data[0]->phv_expire_date)) . ')' : ''); ?>
                                            </td>
                                            <td>
                                                <a href="<?php echo base_url(); ?>/assets/images/<?php echo(isset($user_data[0]->upload_mot_doc) ? $user_data[0]->upload_mot_doc : ''); ?>"
                                                   target="_blank"><?php echo(isset($user_data[0]->upload_mot_doc) ? $user_data[0]->upload_mot_doc : ''); ?></a> <?php echo((isset($user_data[0]->mot_expire_date) && $user_data[0]->mot_expire_date != '0000-00-00') ? ' (' . date('M d, Y', strtotime($user_data[0]->mot_expire_date)) . ')' : ''); ?>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
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

<!-- Modal Crud Start-->
<div class="modal fade" id="nameModal_user" role="dialog">
    <div class="modal-dialog">
        <div class="box box-primary popup">
            <div class="box-header with-border formsize">
                <h3 class="box-title"></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
            </div>
            <!-- /.box-header -->
            <div class="modal-body" style="padding: 0px 0px 0px 0px;"></div>
        </div>
    </div>
</div><!--End Modal Crud -->

<!-- Modal Crud Start-->
<div class="modal fade" id="nameModal_available" role="dialog">
    <div class="modal-dialog">
        <div class="box box-primary popup">
            <div class="box-header with-border formsize">
                <h3 class="box-title">Set Availability</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
            </div>
            <!-- /.box-header -->
            <div class="modal-body" style="padding: 0px 0px 0px 0px;"></div>
        </div>
    </div>
</div><!--End Modal Crud -->

</body>
<style type="text/css">
    td {
        font-size: 13px;
    }

    .btn-renew {
        background: transparent;
        border: 0;
        color: #46c37b;
    }

    button.btn-renew:focus {
        outline: none;
    }
</style>
<link rel="stylesheet" href="<?php echo base_url('assets/css/jquery-confirm.min.css'); ?>">
<script src="<?= base_url(); ?>assets/js/jquery-confirm.min.js"></script>
<script type="text/javascript">



    $('.cancel_button').on('click', function (e) {
        e.preventDefault(); // prevent submit button from firing and submit form
        var $this = $(this);
        $.confirm({
            title: 'Please confirm!',
            content: 'Cancel this subscription ?',
            buttons: {
                confirm: function () {
                    var id = $this.attr('data-id');
                    var Url = '<?php echo base_url()?>' + 'user/cancel_subscription/' + id;
                    window.location.href = Url;
                },
                cancel: function () {
                    e.preventDefault(); // prevent submit button from firing and submit form
                },
            }
        });
    });
</script>