
<link rel="stylesheet" href="<?php echo base_url('assets/css/AdminLTE.min.css');?>">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<div class="content overflow-hidden">
<div class="login-logo">
        <a href="<?php echo base_url(); ?>"><b>FORGOT PASSWORD</b></a>
      </div>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
                  <?php if($this->session->flashdata('forgotpassword')):?>
                      <div class="callout callout-success">
                        <h5 style='color:red;' class="fa fa-close">  <?php echo $this->session->flashdata('forgotpassword'); ?></h5>
                      </div>
                    <?php endif ?>
                    <!-- Reminder Block -->
                    <div class="block block-themed animated fadeIn">
                        <div class="block-header bg-success">
                            <ul class="block-options">
                                <li>
                                    <a href="<?php echo base_url().'user/login'; ?>" data-toggle="tooltip" data-placement="left" title="" data-original-title="Log In"><i class="si si-login"></i></a>
                                </li>
                            </ul>
                            <h3 class="block-title">Forgot Password</h3>
                        </div>
                        <div class="block-content block-content-full block-content-narrow">
                            <!-- Reminder Title -->                           
                            <p>Please provide your account’s email and we will send you your password.</p>
                            <!-- END Reminder Title -->

                            <!-- Reminder Form -->
                            <!-- jQuery Validation (.js-validation-reminder class is initialized in js/pages/base_pages_reminder.js) -->
                            <!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->
                            <form class="js-validation-reminder form-horizontal push-30-t push-50" action="<?php echo base_url().'user/forgetpassword'?>" method="post" novalidate="novalidate">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="form-material form-material-primary floating">
                                            <input class="form-control" type="email" id="reminder-email" name="email">
                                            <label for="reminder-email">Email</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-6 col-md-5">
                                        <button class="btn btn-block bg-success white" type="submit"><i class="si si-envelope-open pull-right"></i> Send Mail</button>
                                    </div>
                                </div>
                            </form>
                            <!-- END Reminder Form -->
                        </div>
                    </div>
                    <!-- END Reminder Block -->
                </div>
            </div>
        </div>
  <style type="text/css">
    .white{
      color:white;
    }
    .content {
    padding-top: 75px;
}
  </style>