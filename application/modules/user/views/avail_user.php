<form role="form bor-rad" enctype="multipart/form-data" action="<?php echo base_url().'user/add_edit_available'?>" method="post">
  <div class="box-body"> 
      <div class="row">
           <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Sunday</label>
              </div>
                <p id="sunday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control" value="<?php echo isset($availData->sunday_to)?$availData->sunday_to:'';?>" name="sunday_to"/>
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control" value="<?php echo isset($availData->sunday_from)?$availData->sunday_from:'';?>" name="sunday_from"/>
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Monday</label>
              </div>
                <p id="monday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control" value="<?php echo isset($availData->monday_to)?$availData->monday_to:'';?>"  name="monday_to"/>
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control" value="<?php echo isset($availData->monday_from)?$availData->monday_from:'';?>" name="monday_from"/>
                </span>
                </p>
              </div>
            </div>

            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Tuesday</label>
              </div>
                <p id="tuesday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control" value="<?php echo isset($availData->tuesday_to)?$availData->tuesday_to:'';?>"  name="tuesday_to"/>
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control" value="<?php echo isset($availData->tuesday_from)?$availData->tuesday_from:'';?>" name="tuesday_from"/>
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Wednesday</label>
              </div>
                <p id="wednesday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control" value="<?php echo isset($availData->wednesday_to)?$availData->wednesday_to:'';?>"  name="wednesday_to"/>
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control" value="<?php echo isset($availData->wednesday_from)?$availData->wednesday_from:'';?>" name="wednesday_from"/>
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Thursday</label>
              </div>
                <p id="thursday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control" value="<?php echo isset($availData->thursday_to)?$availData->thursday_to:'';?>"  name="thursday_to"/>
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control" value="<?php echo isset($availData->thursday_from)?$availData->thursday_from:'';?>" name="thursday_from" />
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Friday</label>
              </div>
                <p id="friday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control" value="<?php echo isset($availData->friday_to)?$availData->friday_to:'';?>"  name="friday_to"/>
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control" value="<?php echo isset($availData->friday_from)?$availData->friday_from:'';?>" name="friday_from"/>
                </span>
                </p>
              </div>
            </div>
            <div class="col-md-10">
              <div class="form-group">
              <div class="col-md-4">
                <label for="">Saturday</label>
              </div>
                <p id="saturday">
                <span class="col-md-3">
                  <input type="text" class="time start form-control" value="<?php echo isset($availData->saturday_to)?$availData->saturday_to:'';?>" name="saturday_to" />
                </span><span class="col-md-1"> to </span>
                <span class="col-md-3">
                  <input type="text" class="time end form-control" value="<?php echo isset($availData->saturday_from)?$availData->saturday_from:'';?>" name="saturday_from" />
                </span>
                </p>
              </div>
            </div>
        </div>   

        <?php if(!empty($availData->users_id)){?>
        <input type="hidden"  name="users_id" value="<?php echo isset($availData->users_id)?$availData->users_id:'';?>">
        
        <div class="box-footer sub-btn-wdt">
          <button type="submit" name="submit" value="edit" class="btn wdt-bg bg-success">Update</button>
        </div>
              <!-- /.box-body -->
        <?php }else{?>
        <div class="box-footer sub-btn-wdt">
          <button type="submit" name="submit" value="add" class="btn wdt-bg bg-success">Update</button>
        </div>
        <?php }?>
      </form>
      <link rel="stylesheet" href="<?php echo base_url('assets/css/jquery.timepicker.css');?>">
      <script type="text/javascript" src="<?php echo base_url('assets/js/jquery.timepicker.js');?>"></script>
      <script type="text/javascript" src="<?php echo base_url('assets/js/datepair.js');?>"></script>
      <script type="text/javascript" src="<?php echo base_url('assets/js/jquery.datepair.js');?>"></script>
      <script>
          // initialize input widgets first
          $('#sunday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });    

          $('#monday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          }); 

          $('#tuesday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });

          $('#wednesday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });

          $('#thursday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });

          $('#friday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });

          $('#saturday .time').timepicker({
              'showDuration': true,
              'timeFormat': 'H:i'
          });


          // initialize datepair
          $('#sunday').datepair();
          $('#monday').datepair();
          $('#tuesday').datepair();
          $('#wednesday').datepair();
          $('#thursday').datepair();
          $('#friday').datepair();
          $('#saturday').datepair();

      </script>