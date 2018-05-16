<?php
//echo getcwd(); die;
//include '/home/admin/web/uplift.vip/public_html/landing_uplift/header.php';
$this->load->view('header');
?>

<body class="hold-transition login-page">
<link rel="stylesheet" href="<?php echo base_url('assets/css/AdminLTE.min.css'); ?>">
<meta name="viewport" content="width=device-width,initial-scale=1"/>

<div class="login-logo">
    <a href="<?php echo base_url(); ?>"><b>DRIVER SIGN UP</b></a>
</div>
<link rel="stylesheet" href="<?php echo base_url('assets/css/jquery.steps.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('assets/css/formValidation.min.css'); ?>">
<link rel="stylesheet" href="<?php echo base_url('assets/css/datepicker.css'); ?>">


<script src="<?php echo base_url('assets/js/jquery.steps.min.js'); ?>"></script>
<script src="<?php echo base_url('assets/js/formvalidation/formValidation.min.js'); ?>"></script>
<script src="<?php echo base_url('assets/js/formvalidation/bootstrap.min.js'); ?>"></script>
<script src="<?php echo base_url('assets/js/jquery.mask.min.js'); ?>"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
    /* Adjust the height of section */
    #profileForm .content {
        min-height: 100px;
    }

    #profileForm .content > .body {
        width: 100%;
        height: auto;
        padding: 15px;
        position: relative;
    }

    .content {
        padding: 0;
        margin: 0px;
    }

    .actions.clearfix {
        margin-top: -20px;
    }

    body.login-page {
        padding-top: 40px;
    }

    .block.block-themed {
        min-height: 370px;
    }

    .red {
        color: red;
    }

    @media screen and (max-width: 641px) {
        .col-md-6 {
            width: 100%;
            float: none;
            clear: both;
        }

        .wizard > .steps a {
            font-size: 9px;
        }

    }
</style>
<div class="container">
    <form id="profileForm" method="post" action="<?= base_url() . 'user/submitForm' ?>" class="form-horizontal"
          enctype='multipart/form-data'>
        <h2>Personal Details</h2>
        <section data-step="0" style="padding:0px">

            <div class="col-lg-12" style="padding:0px">
                <div class="block block-themed">
                    <div class="block-header ">
                        <ul class="block-options">
                            <li>
                                <a href="<?= base_url() ?>user/login" data-toggle="tooltip" data-placement="left"
                                   title="" class="" data-original-title="Log In"><i class="si si-login"></i></a>
                            </li>
                        </ul>
                        <h3 class="block-title">Personal Details</h3>

                    </div>

                    <div class="block-content">

                        <div class="form-group col-md-3">
                            <div class="col-md-12">
                                <div class="form-material">
                                    <input class="form-control" type="text" id="register2-username" name="first_name"
                                           placeholder="Enter your first name..">
                                    <label for="register2-username">First Name <span class="red">*</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-3">
                            <div class="col-md-12">
                                <div class="form-material">
                                    <input class="form-control" type="text" id="register2-username" name="last_name"
                                           placeholder="Enter your last name..">
                                    <label for="register2-username">Last Name <span class="red">*</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <div class="col-md-12">
                                <div class="form-material">
                                    <input class="form-control" type="email" id="register2-email" name="email"
                                           placeholder="Enter your email..">
                                    <label for="register2-email">Email <span class="red">*</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding: 0px;">
                            <div class="form-group col-md-4">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="address_line_1"
                                               name="address_line_1" placeholder="Enter your Address Line 1..">
                                        <label for="register2-address">Address Line 1 <span class="red">*</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="address_line_2"
                                               name="address_line_2" placeholder="Enter your Address Line 2..">
                                        <label for="register2-address">Address Line 2 </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="address_line_3"
                                               name="address_line_3" placeholder="Enter your Address Line 3..">
                                        <label for="register2-address">Address Line 3 </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding: 0px;">
                            <div class="form-group col-md-2">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="town" name="town"
                                               placeholder="Enter your Town..">
                                        <label for="register2-address">Town </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-2">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="city" name="city"
                                               placeholder="Enter your City..">
                                        <label for="register2-address">City </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="county" name="county"
                                               placeholder="Enter your County..">
                                        <label for="register2-address">County </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="postcode" name="postcode"
                                               placeholder="Enter your Postcode..">
                                        <label for="register2-address"><span class="red">*</span>Postcode </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <select class="form-control" id="country" name="country"
                                                placeholder="Enter your Country..">
                                            <option value="United Kingdom">United Kingdom</option>
                                            <option value="United States">United States</option>
                                            <option value="India">India</option>
                                        </select>
                                        <label for="register2-address">Country </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding: 0px;">
                            <div class="form-group col-md-3">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="telephone_number" name="telephone"
                                               placeholder="Enter your telephone..">
                                        <label for="register2-telephone">Telephone</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <div class="col-md-12">
                                    <div class="form-material">
<!--                                        --><?//= selectBoxDynamic($field_name = 'country_code', $tableName = 'country_code', $colom = 'country_name', '44', 'class="form-control" placeholder="Enter your country code.."', '', '') ?>

                                        <select class="form-control" id="country_code" name="country_code" class="form-control" placeholder="Enter your country code.." >
                                            <option value="">Select</option>
                                            <option value="91"   >India (+91)</option>
                                            <option value="44"  selected  >United Kingdom (+44)</option>
                                            <option value="1"   >United States (+1)</option>
                                        </select>
                                        <label for="register2-model">Country Code <span class="red">*</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="mobile_number" name="mobile_number"
                                               placeholder="Confirm your mobile number..">
                                        <label for="register2-mobile_number">Mobile number <span
                                                    class="red">*</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="file" id="register2-profile_pic"
                                               name="profile_pic[]" placeholder="Confirm your upload photo..">
                                        <label for="register2-profile_pic">Upload photo</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <h2>Vehicle Details</h2>
        <section data-step="1" style="padding:0px">

            <div class="col-lg-12" style="padding:0px">
                <div class="block block-themed">
                    <div class="block-header ">
                        <h3 class="block-title">Vehicle Details</h3>
                    </div>
                    <div class="block-content">
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <!--input class="form-control" type="text" id="register2-make" name="make" placeholder="Enter your make.."-->
<!--                                        --><?//= selectBoxDynamic($field_name = 'make', $tableName = 'make', $colom = 'make_value', '', 'class="form-control" placeholder="Enter your make.." onChange="getModelVal(this.value)"', '', '') ?>

                                        <select class="form-control select2" name="make" id="make" onchange="on_make_change();">
                                            <option value="">---Select make---</option>
                                            <?php foreach ($makes as $m): ?>
                                                <option value="<?php echo $m['make_id']; ?>"><?php echo $m['make_name']; ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                        <label for="register2-make">Make <span class="red">*</span></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="form-material" id="model_data">
                                        <!--input class="form-control" type="text" id="register2-model" name="model" placeholder="Enter your model.."-->
<!--                                        <select name="model" class="form-control">-->
<!--                                            <option>Select</option>-->
<!--                                        </select>-->
                                        <?php //selectBoxDynamic($field_name='model', $tableName='model',$colom='model_value','','class="form-control" placeholder="Enter your model.."','','') ?>
<!--                                        <label for="register2-model">Model <span class="red">*</span></label>-->

                                        <select name="model" class="form-control" id="model">

                                        </select>
                                        <label for="register2-model">Model <span class="red">*</span></label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="form-material">
<!--                                        <input class="form-control" type="text" id="register2-model" name="colour"-->
<!--                                               placeholder="Enter your colour..">-->
                                        <select name="colour" class="form-control" id="colour">

                                        </select>
                                        <label for="register2-model">Colour <span class="red">*</span></label>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">

                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="form-material">
                                        <input class="form-control" type="text" id="register2-registration"
                                               name="registration" placeholder="Enter your registration..">
                                        <label for="register2-address">Registration <span class="red">*</span></label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-material">
                                        <input class="form-control" type="file" id="register2-upload_doc"
                                               name="upload_doc[]" placeholder="Confirm your upload doc..">
                                        <label for="register2-upload_doc">Upload PHV Doc</label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-material">
                                        <input class="form-control datepicker" type="date" id="register2-registration"
                                               name="phv_expire_date" placeholder="Enter your PHV expire date..">
                                        <label for="register2-address">PHV Expire Date </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-material">
                                        <input class="form-control" type="file" id="register2-upload_doc"
                                               name="upload_mot_doc[]" placeholder="Confirm your upload doc..">
                                        <label for="register2-upload_doc">Upload M.O.T. Doc</label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-material">
                                        <input class="form-control datepicker" type="date" id="register2-registration"
                                               name="mot_expire_date" placeholder="Enter your M.O.T. expire date..">
                                        <label for="register2-address">M.O.T. Expire Date </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <h2>Driver’s licensing</h2>
        <section data-step="2" style="padding:0px">

            <div class="col-lg-12" style="padding:0px">
                <div class="block block-themed">
                    <div class="block-header ">
                        <h3 class="block-title">Driver’s licensing</h3>
                    </div>
                    <div class="block-content">
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="form-material">
                                    <input class="form-control" type="file" id="register2-license" name="license[]"
                                           placeholder="Enter your license..">
                                    <label for="register2-license">Upload Driver's License <span
                                                class="red">*</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="form-material">
                                    <input class="form-control datepicker" type="date" id="register2-licence"
                                           name="license_expire_date" placeholder="Enter your License expire date..">
                                    <label for="register2-licence">License Expire Date <span
                                                class="red">*</span></label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="form-material">
                                    <input class="form-control" type="file" id="register2-pco_doc" name="pco_doc[]"
                                           placeholder="Enter your pco doc..">
                                    <label for="register2-pco_doc">Upload driver’s PCO doc</label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="form-material">
                                    <input class="form-control datepicker" type="date" id="register2-licence"
                                           name="pco_expire_date" placeholder="Enter your PCO expire date..">
                                    <label for="register2-licence">PCO Expire Date </label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="form-material">
                                    <input class="form-control" type="file" id="register2-insurance_doc"
                                           name="insurance_doc[]" placeholder="Enter your insurance doc..">
                                    <label for="register2-insurance_doc">Upload driver insurance doc</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="form-material">
                                    <input class="form-control datepicker" type="date" id="register2-licence"
                                           name="insurance_expire_date"
                                           placeholder="Enter your Insurance expire date..">
                                    <label for="register2-licence">Insurance Expire Date </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">

                                <div class="form-material">
                                    <input class="form-control" type="file" id="register2-license" name="license_pic[]"
                                           placeholder="Enter your license..">
                                    <label for="register2-license">Upload Driver Pic with License <span
                                                class="red">*</span></label>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <h2>Account Details</h2>
        <section data-step="3" style="padding:0px">
            <div class="col-lg-12" style="padding:0px">
                <div class="block block-themed">
                    <div class="block-header ">
                        <h3 class="block-title">Account Details</h3>
                    </div>
                    <div class="block-content">
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="form-material">
                                    <input class="form-control" type="text" id="name" name="name"
                                           placeholder="Enter your username..">
                                    <label for="register2-username">Username <span class="red">*</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="form-material">
                                    <input class="form-control" type="password" id="register2-password" name="password"
                                           placeholder="Enter your password..">
                                    <label for="register2-password">Password <span class="red">*</span></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <!--h2>Buy Subscription</h2>
        <section data-step="4">
            <div class="form-group">
                <label class="col-md-3 control-label">Subscription</label>
                <div class="col-md-5">
                    <input type="text" class="form-control" name="subscription" placeholder="Subscription" />
                </div>
            </div>

        </section-->
    </form>

</div>
<?php //include '/home3/ibrinfot/public_html/development_root/landing_uplift/footer.php'; ?>

<script>
    function on_make_change(){ // when one changes
        var id = $('#make').val();
        var models='<option value="">---Select model---</option>';
        $.ajax({
            url: "<?= base_url() . 'user/get_models' ?>",
            type: 'POST',
            data: {id: id},
            dataType: 'json',
            success: function (data) {
                console.log(data);
                $.each( data, function( key, value ) {

                    models += "<option value='"+value['model_id']+"'>"+value['model_name']+"</option>";
                });

                $('#model').html( models); // they all change
                //$('#no').val(no);
            },
            error: function (jqXhr, textStatus, errorMessage) {
                alert('error');
            }
        });
        var colours='<option value="">---Select colour---</option>';
        $.ajax({
            url: "<?= base_url() . 'user/get_colours' ?>",
            type: 'POST',
            data: {id: id},
            dataType: 'json',
            success: function (data) {
                console.log(data);
                $.each( data, function( key, value ) {

                    colours += "<option value='"+value['colours_id']+"'>"+value['colours_name']+"</option>";
                });

                $('#colour').html( colours); // they all change
                //$('#no').val(no);
            },
            error: function (jqXhr, textStatus, errorMessage) {
                alert('error');
            }
        });
    }
    $(document).ready(function () {
        function adjustIframeHeight() {
            var $body = $('body'),
                $iframe = $body.data('iframe.fv');
            if ($iframe) {
                // Adjust the height of iframe
                $iframe.height($body.height());
            }
        }

        // IMPORTANT: You must call .steps() before calling .formValidation()
        $('#profileForm')
            .steps({
                headerTag: 'h2',
                bodyTag: 'section',
                onStepChanged: function (e, currentIndex, priorIndex) {

                    // You don't need to care about it
                    // It is for the specific demo
                    adjustIframeHeight();
                },
                // Triggered when clicking the Previous/Next buttons
                onStepChanging: function (e, currentIndex, newIndex) {

                    if (currentIndex == 0) {
                        $('.block.block-themed').css('min-height', '425px');
                    }
                    var fv = $('#profileForm').data('formValidation'), // FormValidation instance
                        // The current step container
                        $container = $('#profileForm').find('section[data-step="' + currentIndex + '"]');

                    if (newIndex < currentIndex) {
                        return true;
                    }

                    // Validate the container
                    fv.validateContainer($container);

                    var isValidStep = fv.isValidContainer($container);
                    if (isValidStep === false || isValidStep === null) {
                        // Do not jump to the next step

                        return false;
                    }
                    return true;
                },
                // Triggered when clicking the Finish button
                onFinishing: function (e, currentIndex) {
                    var fv = $('#profileForm').data('formValidation'),
                        $container = $('#profileForm').find('section[data-step="' + currentIndex + '"]');

                    // Validate the last step container
                    fv.validateContainer($container);

                    var isValidStep = fv.isValidContainer($container);
                    if (isValidStep === false || isValidStep === null) {
                        return false;
                    }

                    return true;
                },
                onFinished: function (e, currentIndex) {
                    // Uncomment the following line to submit the form using the defaultSubmit() method
                    $('#profileForm').formValidation('defaultSubmit');

                    // For testing purpose
                    //$('#welcomeModal').modal();
                }
            })
            .formValidation({
                framework: 'bootstrap',
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                // This option will not ignore invisible fields which belong to inactive panels
                excluded: ':disabled',
                fields: {
                    first_name: {
                        validators: {
                            notEmpty: {
                                message: 'The Name is required'
                            },
                            stringLength: {
                                min: 0,
                                max: 50,
                                message: 'The Name must be less than 50 characters long'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z ]*$/,
                                message: 'The Name can only consist of alphabetical, underscore'
                            }
                        }
                    },
                    last_name: {
                        validators: {
                            notEmpty: {
                                message: 'The Name is required'
                            },
                            stringLength: {
                                min: 0,
                                max: 50,
                                message: 'The Name must be less than 50 characters long'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z ]*$/,
                                message: 'The Name can only consist of alphabetical, underscore'
                            }
                        }
                    },
                    telephone: {
                        validators: {
                            stringLength: {
                                min: 13,
                                max: 16,
                                message: 'The Mobile Number must be 11 digits'
                            },
                        }
                    },
                    mobile_number: {
                        validators: {
                            notEmpty: {
                                message: 'The Mobile Number is required'
                            },
                            stringLength: {
                                min: 13,
                                max: 16,
                                message: 'The Mobile Number must be 11 digits'
                            },
                            /* regexp: {
                                 regexp: /^(0|[1-9][0-9]*)$/,
                                 message: 'The Mobile Number can only number'
                             }*/
                        }
                    },
                    address_line_1: {
                        validators: {
                            notEmpty: {
                                message: 'The Address Line 1 is required'
                            }
                        }
                    },
                    postcode: {
                        validators: {
                            notEmpty: {
                                message: 'The Postcode is required'
                            }
                        }
                    },
                    country: {
                        validators: {
                            notEmpty: {
                                message: 'The Country is required'
                            }
                        }
                    },
                    email: {
                        validators: {
                            verbose: false,
                            notEmpty: {
                                message: 'The email address is required'
                            },
                            emailAddress: {
                                message: 'The input is not a valid email address'
                            },
                            remote: {
                                message: 'The email address already exists!',
                                url: "<?= base_url() . 'user/checkEmail' ?>",
                                data: {
                                    email: function () {
                                        return $("#email").val();
                                    }
                                },
                                type: 'POST',
                            }
                        }
                    },
                    'profile_pic[]': {
                        validators: {
                            /* notEmpty: {
                                 message: 'Please choose a file to upload'
                             },
                            file: {
                                 extension: 'pdf',
                                 type: 'application/pdf',
                                 maxSize: 2 * 1024 * 1024,
                                 message: 'The file must be in .pdf format and must not exceed 2MB in size'
                             }*/
                            file: {
                                extension: 'png,jpeg,jpg',
                                type: 'image/png,image/jpeg,image/jpg',
                                message: 'The file must be in .png, .jpg and .jpeg format'
                            }
                        }
                    },
                    model: {
                        validators: {
                            notEmpty: {
                                message: 'The Model is required'
                            },
                        }
                    },
                    make: {
                        validators: {
                            notEmpty: {
                                message: 'The Make is required'
                            },
                        }
                    },
                    registration: {
                        validators: {
                            notEmpty: {
                                message: 'The Registration is required'
                            }
                        }
                    },
                    registration_expire_date: {
                        validators: {
                            notEmpty: {
                                message: 'The Registration Expire Date is required'
                            }
                        }
                    },
                    colour: {
                        validators: {
                            notEmpty: {
                                message: 'The Colour is required'
                            }
                        }
                    },
                    'upload_doc[]': {
                        validators: {
                            file: {
                                extension: 'pdf,docx,png,jpeg,jpg',
                                type: 'application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document,image/png,image/jpeg,image/jpg',
                                message: 'The file must be in .pdf,.docx,.png, .jpg and .jpeg format'
                            }
                        }
                    },
                    'upload_mot_doc[]': {
                        validators: {
                            file: {
                                extension: 'pdf,docx,png,jpeg,jpg',
                                type: 'application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document,image/png,image/jpeg,image/jpg',
                                message: 'The file must be in .pdf,.docx,.png, .jpg and .jpeg format'
                            }
                        }
                    },
                    license_expire_date: {
                        validators: {
                            notEmpty: {
                                message: 'The License Expire Date is required'
                            }
                        }
                    },
                    'license[]': {
                        validators: {
                            notEmpty: {
                                message: 'The License is required'
                            },
                            file: {
                                extension: 'pdf,docx,png,jpeg,jpg',
                                type: 'application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document,image/png,image/jpeg,image/jpg',
                                message: 'The file must be in .pdf,.docx,.png, .jpg and .jpeg format'
                            }
                        }
                    },
                    'license_pic[]': {
                        validators: {
                            notEmpty: {
                                message: 'The License is required'
                            },
                            file: {
                                extension: 'png,jpeg,jpg',
                                type: 'image/png,image/jpeg,image/jpg',
                                message: 'The file must be in .png, .jpg and .jpeg format'
                            }
                        }
                    },
                    'pco_doc[]': {
                        validators: {

                            file: {
                                extension: 'pdf,docx,png,jpeg,jpg',
                                type: 'application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document,image/png,image/jpeg,image/jpg',
                                message: 'The file must be in .pdf,.docx,.png,.jpg and .jpeg format'
                            }
                        }
                    },
                    'insurance_doc[]': {
                        validators: {
                            file: {
                                extension: 'pdf,docx,png,jpeg,jpg',
                                type: 'application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document,image/png,image/jpeg,image/jpg',
                                message: 'The file must be in .pdf,.docx,.png,.jpg and .jpeg format'
                            }
                        }
                    },
                    name: {
                        validators: {
                            notEmpty: {
                                message: 'The Username is required'
                            },
                            remote: {
                                message: 'The Username already exists!',
                                url: "<?= base_url() . 'user/checkUsername' ?>",
                                data: {
                                    name: function () {
                                        return $("#name").val();
                                    }
                                },
                                type: 'POST',
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: 'The Password is required'
                            },
                            stringLength: {
                                min: 6,
                                message: 'The Password must be more than 6 characters long'
                            },
                        }
                    },
                }
            });
    });

    $("#mobile_number").mask("999 9999 9999");
    $("#telephone_number").mask("999 9999 9999");

    function getModelVal(val) {
        var url = "<?= base_url() . 'user/getModelVal' ?>";
        $.ajax({
            method: "POST",
            url: url,
            data: {make_id: val}
        })
            .done(function (html) {
                html = html + '<label for="register2-model">Model <span class="red">*</span></label>';
                $('#model_data').html(html);
            });

    }

    $(function () {
        $('.datepicker').datepicker();
    });

</script>


</body>

<style type="text/css">
    body.login-page {
        padding-top: 0px !important;
        /*background: #fff;*/

    }

    nav.fixed.scrolled {
        margin-bottom: 50px;
        position: relative;
    }

    nav {
        background: rgba(0, 0, 0, 0.58);
    }

    section {
        background: #fff;
        margin-bottom: 22px;

    }

    .wizard > .steps .current a, .wizard > .steps .current a:hover, .wizard > .steps .current a:active {
        background: #575857;
    }

    .wizard > .actions a {
        background: #575857;
    }
</style>
