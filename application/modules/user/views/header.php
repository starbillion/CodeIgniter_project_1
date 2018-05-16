<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Uplift</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="http://dev1.ibrinfotech.com/landing_uplift/css/themify-icons.css" rel="stylesheet" type="text/css" media="all" />
    <link href="http://dev1.ibrinfotech.com/landing_uplift/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="http://dev1.ibrinfotech.com/landing_uplift/css/flexslider.css" rel="stylesheet" type="text/css" media="all" />
    <link href="http://dev1.ibrinfotech.com/landing_uplift/css/theme.css" rel="stylesheet" type="text/css" media="all" />
    <link href="http://dev1.ibrinfotech.com/landing_uplift/css/custom.css" rel="stylesheet" type="text/css" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400%7CRaleway:100,400,300,500,600,700%7COpen+Sans:400,500,600' rel='stylesheet' type='text/css'>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,600,700%7COpen+Sans:300,400,400italic,600,700">

    <!-- Page JS Plugins CSS -->

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <!--link rel="stylesheet" href="http://dev1.ibrinfotech.com/driver/assets/css/AdminLTE.min.css"-->
    <link rel="stylesheet" href="http://dev1.ibrinfotech.com/driver/assets/js/plugins/fullcalendar/fullcalendar.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <!--link rel=stylesheet type=text/css href="http://dev1.ibrinfotech.com/driver/assets/css/braintreecss/app.css"-->
    <link rel="stylesheet" href="http://dev1.ibrinfotech.com/driver/assets/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="http://dev1.ibrinfotech.com/driver/assets/css/blue.css">
    <link rel="stylesheet" href="http://dev1.ibrinfotech.com/driver/assets/css/custom.css">
    <link rel="stylesheet" href="http://dev1.ibrinfotech.com/driver/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://dev1.ibrinfotech.com/driver/assets/css/oneui.css">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="http://dev1.ibrinfotech.com/driver/assets/js/jquery.min.js"><\/script>')</script>
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/jquery.form-validator.min.js"></script>
    <script>
        $.widget.bridge('uibutton', $.ui.button);

    </script>
    <!-- Bootstrap 3.3.6 -->
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/app.min.js"></script>
    <!-- iCheck -->
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/icheck.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/demo.js"></script>
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/custom.js"></script>
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/jquery.steps.js"></script>
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/jquery.placeholder.min.js"></script>
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/jquery.scrollLock.min.js"></script>
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/app.js"></script>
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/custom.js"></script>
    <script src="http://dev1.ibrinfotech.com/driver/assets/js/jquery.slimscroll.min.js"></script>

    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>

</head>
<body>

<div class="nav-container">
    <nav class="fixed outOfSight scrolled">
        <div class="nav-bar">
            <div class="module left">
                <a href="#">
                    <!--img class="logo logo-light" alt="Foundry" src="img/logo-light.png"-->
                    <img class="logo logo-dark" alt="Foundry" src="http://dev1.ibrinfotech.com/landing_uplift/img/logo.png">
                </a>
            </div>
            <div class="module widget-handle mobile-toggle right visible-sm visible-xs">
                <i class="ti-menu"></i>
            </div>
            <div class="module-group right">
                <div class="module left">
                    <ul class="menu">
                        <li>
                            <a href="<?=site_url('user/sign_up')?>" class="btn btn-lg">Become a driver</a>
                        </li>
                        <li>
                            <a href="#" class="btn btn-lg btn-filled">Download Passenger apk</a>
                        </li>

                    </ul>
                </div>

            </div>

        </div>
    </nav>
</div>