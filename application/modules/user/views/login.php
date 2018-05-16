<link rel="stylesheet" href="<?php echo base_url('assets/css/AdminLTE.min.css');?>">
<meta name="viewport" content="width=device-width,initial-scale=1" />
<div class="content overflow-hidden">

<div class="login-logo">
	    	<a href="<?php echo base_url(); ?>"><b>DRIVER SIGN IN</b></a>
	  	</div>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4">
                    <!-- Login Block -->
                    <div class="block block-themed animated fadeIn">
                        <div class="block-header bg-success">
                            <ul class="block-options">
                                <li>
                                    <a href="forgetpassword">Forgot Password?</a>
                                </li>
                                <li>
                                    <a href="<?php echo base_url().'user/sign_up'; ?>" data-toggle="tooltip" data-placement="left" title="" data-original-title="New Account"><i class="si si-plus"></i></a>
                                </li>
                            </ul>
                            <h3 class="block-title">Login</h3>
                        </div>
                        <div class="block-content block-content-full block-content-narrow">
                            <!-- Login Title -->                         
                            <p>Welcome, please login.</p>
                            <?php if($this->session->flashdata("messagePr")){?>
												  		<div class="alert bg-success">      
													        <?php echo $this->session->flashdata("messagePr")?>
													    </div>
													  <?php } ?>
                            <!-- END Login Title -->

                            <!-- Login Form -->
                            <!-- jQuery Validation (.js-validation-login class is initialized in js/pages/base_pages_login.js) -->
                            <!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->                        
                             <form action="<?php echo base_url().'user/auth_user'; ?>" method="post" class="js-validation-login form-horizontal push-30-t push-50">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="form-material form-material-primary floating open">
                                            <input class="form-control" type="text" id="login-username" name="email">
                                            <label for="login-username">Username</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="form-material form-material-primary floating open">
                                            <input class="form-control" type="password" id="login-password" name="password">
                                            <label for="login-password">Password</label>
                                        </div>
                                    </div>
                                </div>
                                <!--div class="form-group">
                                    <div class="col-xs-12">
                                        <label class="css-input switch switch-sm switch-primary">
                                            <input type="checkbox" id="login-remember-me" name="login-remember-me"><span></span> Remember Me?
                                        </label>
                                    </div>
                                </div-->
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-6 col-md-4">
                                        <button class="btn btn-block bg-success" type="submit"><i class="si si-login pull-right"></i> Log in</button>
                                    </div>
                                </div>
                            </form>
                            <!-- END Login Form -->
                        </div>
                    </div>
                    <!-- END Login Block -->
                </div>
            </div>
        </div>
        <style type="text/css">
        	 button.btn.btn-block.bg-success {
					    color: white;
					}
					.content {
					    padding-top: 75px;
					}
			</style>