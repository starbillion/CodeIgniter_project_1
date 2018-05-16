<form role="form bor-rad" enctype="multipart/form-data" action="<?php echo base_url() . 'user/add_edit_user' ?>"
      method="post">
    <div class="box-body">
        <?php if ($viewForm == 'personal') { ?>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Name</label>
                        <input type="text" name="fullname"
                               value="<?php echo isset($userData->fullname) ? $userData->fullname : ''; ?>" required
                               class="form-control" placeholder="Name">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Email</label>
                        <input type="email" name="email"
                               value="<?php echo isset($userData->email) ? $userData->email : ''; ?>" required
                               class="form-control" placeholder="Email">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Address</label>
                        <textarea name="address" rows="4" class="form-control"
                                  placeholder="Address"> <?php echo isset($userData->address) ? $userData->address : ''; ?> </textarea>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Telephone</label>
                        <input type="text" name="telephone"
                               value="<?php echo isset($userData->telephone) ? $userData->telephone : ''; ?>" required
                               class="form-control" placeholder="Telephone">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Mobile Number</label>
                        <input type="text" name="mobile_number"
                               value="<?php echo isset($userData->mobile_number) ? $userData->mobile_number : ''; ?>"
                               required class="form-control" placeholder="Mobile Number">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group imsize">
                        <label for="exampleInputFile">Image Upload</label>
                        <div class="pic_size" id="image-holder">
                            <?php if (isset($userData->profile_pic) && file_exists('assets/images/' . $userData->profile_pic)) {
                                $profile_pic = $userData->profile_pic;
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
                       value="<?php echo isset($userData->profile_pic) ? $userData->profile_pic : ''; ?>">
            </div>
        <?php } else if ($viewForm == 'vehicle') { ?>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Make</label>

                        <select class="form-control select2" name="make" id="make" onchange="on_make_change();">
                            <option value="">---Select make---</option>
                            <?php
                            $query = $this->db->query("SELECT make_id, make_name from make");
                            $makes = $query->result_array();
                            foreach ($makes as $m):
                                ?>
                                <option value="<?php echo $m['make_id']; ?>"
                                    <?php
                                    if($userData->make == $m['make_id']){
                                        echo 'selected';
                                    }?>>
                                    <?php echo $m['make_name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Model</label>

                        <select name="model" class="form-control" id="models">
                            <option value="">---Select model---</option>
                            <?php
                            $query = $this->db->query("SELECT model_id, model_name from model");
                            $models = $query->result_array();
                            foreach ($models as $mm):
                                ?>
                                <option value="<?php echo $mm['model_id']; ?>"
                                    <?php
                                    if($userData->model == $mm['model_id']){
                                        echo 'selected';
                                    }?>>
                                    <?php echo $mm['model_name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Colour</label>


                        <select name="colour" class="form-control" id="colour">
                            <option value="">---Select colour---</option>
                            <?php
                            $query = $this->db->query("SELECT colours_id, colours_name from colours");
                            $colours = $query->result_array();
                            foreach ($colours as $c):
                                ?>
                                <option value="<?php echo $c['colours_id']; ?>"
                                    <?php
                                    if($userData->colour == $c['colours_id']){
                                        echo 'selected';
                                    }?>>
                                    <?php echo $c['colours_name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Registration</label>
                        <input type="text" name="registration"
                               value="<?php echo isset($userData->registration) ? $userData->registration : ''; ?>"
                               required class="form-control" placeholder="Registration">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">Upload PHV Doc</label>
                        <input type="file" name="upload_doc" id="">
                        <a href="<?php echo base_url(); ?>/assets/images/<?php echo isset($userData->upload_doc) ? $userData->upload_doc : ''; ?>"><?php echo isset($userData->upload_doc) ? $userData->upload_doc : ''; ?></a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="">PHV Expire Date</label>
                        <input class="form-control datepicker" type="date" id="register2-registration"
                               name="phv_expire_date" placeholder="Enter your PHV expire date.."
                               value="<?php echo isset($userData->phv_expire_date) ? $userData->phv_expire_date : ''; ?>">
                    </div>
                </div>
                <div class="col-md-12" style="padding: 0px">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">Upload M.O.T. doc</label>
                            <input type="file" name="upload_mot_doc" id="">
                            <a href="<?php echo base_url(); ?>/assets/images/<?php echo isset($userData->upload_mot_doc) ? $userData->upload_mot_doc : ''; ?>"><?php echo isset($userData->upload_mot_doc) ? $userData->upload_mot_doc : ''; ?></a>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">M.O.T. Expire Date</label>
                            <input class="form-control datepicker" type="date" id="register2-registration"
                                   name="mot_expire_date" placeholder="Enter your M.O.T. expire date.."
                                   value="<?php echo isset($userData->mot_expire_date) ? $userData->mot_expire_date : ''; ?>">
                        </div>
                    </div>
                </div>

            </div>
            <input type="hidden" name="fileOld"
                   value="<?php echo isset($userData->upload_doc) ? $userData->upload_doc : ''; ?>">
            <input type="hidden" name="fileOlds"
                   value="<?php echo isset($userData->upload_mot_doc) ? $userData->upload_mot_doc : ''; ?>">
        <?php } else if ($viewForm == 'license') { ?>
            <div class="row">
                <div class="col-md-12">
                    <!--div class="form-group">
                      <label for="">License</label>
                      <input type="text" name="license" value="<?php echo isset($userData->license) ? $userData->license : ''; ?>" required class="form-control" placeholder="License">
                    </div-->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">Upload Driver's License</label>
                            <input type="file" name="license" id="">
                            <a href="<?php echo base_url(); ?>/assets/images/<?php echo isset($userData->license) ? $userData->license : ''; ?>"><?php echo isset($userData->license) ? $userData->license : ''; ?></a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">License Expire Date</label>
                            <input class="form-control datepicker" type="date" id="register2-registration"
                                   name="license_expire_date" placeholder="Enter your registration expire date.."
                                   value="<?php echo isset($userData->license_expire_date) ? $userData->license_expire_date : ''; ?>"
                                   required>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">Upload driver’s PCO doc</label>
                            <input type="file" name="pco_doc" id="">
                            <a href="<?php echo base_url(); ?>/assets/images/<?php echo isset($userData->pco_doc) ? $userData->pco_doc : ''; ?>"><?php echo isset($userData->pco_doc) ? $userData->pco_doc : ''; ?></a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">PCO Expire Date</label>
                            <input class="form-control datepicker" type="date" id="register2-registration"
                                   name="pco_expire_date" placeholder="Enter your PCO expire date.."
                                   value="<?php echo isset($userData->pco_expire_date) ? $userData->pco_expire_date : ''; ?>"
                                   required>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">Upload driver insurance doc</label>
                            <input type="file" name="insurance_doc" id="">
                            <a href="<?php echo base_url(); ?>/assets/images/<?php echo isset($userData->insurance_doc) ? $userData->insurance_doc : ''; ?>"><?php echo isset($userData->insurance_doc) ? $userData->insurance_doc : ''; ?></a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">Insurance Expire Date</label>
                            <input class="form-control datepicker" type="date" id="register2-registration"
                                   name="insurance_expire_date" placeholder="Enter your insurance expire date.."
                                   value="<?php echo isset($userData->insurance_expire_date) ? $userData->insurance_expire_date : ''; ?>"
                                   required>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="">Upload Driver Pic with License</label>
                            <input type="file" name="license_pic" id="">
                            <a href="<?php echo base_url(); ?>/assets/images/<?php echo isset($userData->license_pic) ? $userData->license_pic : ''; ?>"><?php echo isset($userData->license_pic) ? $userData->license_pic : ''; ?></a>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="fileOld"
                   value="<?php echo isset($userData->pco_doc) ? $userData->pco_doc : ''; ?>">
            <input type="hidden" name="fileOldLic"
                   value="<?php echo isset($userData->license) ? $userData->license : ''; ?>">
            <input type="hidden" name="fileOlds"
                   value="<?php echo isset($userData->insurance_doc) ? $userData->insurance_doc : ''; ?>">
        <?php } ?>


        <?php if (!empty($userData->users_id)) { ?>
            <input type="hidden" name="users_id"
                   value="<?php echo isset($userData->users_id) ? $userData->users_id : ''; ?>">

            <div class="box-footer sub-btn-wdt">
                <button type="submit" name="edit" value="edit" class="btn wdt-bg bg-success">Update</button>
            </div>
            <!-- /.box-body -->
        <?php } else { ?>
            <div class="box-footer sub-btn-wdt">
                <button type="submit" name="submit" value="add" class="btn wdt-bg bg-success">Add</button>
            </div>
        <?php } ?>
</form>
<script type="text/javascript">
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

                $('#models').html( models); // they all change
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
        getModelVal($('#make').val());
        setTimeout(function () {
            var model_val = '<?= isset($userData->model) ? $userData->model : ''?>';
            $('#model').val(model_val);
        }, 500);

    });

    function getModelVal(val) {
        var url = "<?= base_url() . 'user/getModelVal' ?>";
        $.ajax({
            method: "POST",
            url: url,
            data: {make_id: val}
        })
            .done(function (html) {
                $('#model').html(html);
            });

    }
</script>