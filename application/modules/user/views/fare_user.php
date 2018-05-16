<form role="form bor-rad" enctype="multipart/form-data" action="<?php echo base_url().'user/add_edit_fare'?>" method="post">
  <div class="box-body">
    
    <!--button type="button" class="btn btn-primary fare_mile" style="display: none;" onClick="addRowMile()">Add</button-->
    <!--div class="row">
           <div class="col-md-5">
              <div class="form-group">
                <label for="">Name</label>
                <input type="text" name="fare_name" value="<?php echo isset($fareData->fare_name)?$fareData->fare_name:'';?>" required class="form-control" placeholder="Name">
              </div>
            </div>  
           <div class="col-md-4">
              <div class="form-group">
                <label for="">Duration</label>                 
                <div class="input-group">
                  <span class="input-group-addon">Minutes</span>
                  <input type="number" name="fare_duration" value="<?php echo isset($fareData->fare_duration)?$fareData->fare_duration:'';?>" min="0" required class="form-control" placeholder="Durtaion">
                 </div> 
              </div>
            </div>     
            <div class="col-md-3">
              <div class="form-group">
                <label for="">Price</label>
                <div class="input-group">
                  <span class="input-group-addon">£</span>
                  <input type="text" title="" class="form-control" name="fare_price" size="5" value="<?php echo isset($fareData->fare_price)?$fareData->fare_price:'';?>" id="fare_price" placeholder="Price">
                 </div>               
              </div>
            </div>    
				            
        </div-->    
         <!--div class="row" style="margin-top: 10px;">
          <div class="col-sm-3" style="    margin-top: 15px;">
            <input type="radio" name="fare_status" value="duration" style="display: block;margin-right: 5px;margin-top: 4px;" onclick="fare_types(this.value)" checked="checked"  class="pull-left" > 
            Hourly Hire
          </div>
          <div class="col-sm-2" style="    margin-top: 15px;">
            <input type="radio" name="fare_status" value="mile" style="display: block;margin-right: 5px;margin-top: 4px;" onclick="fare_types(this.value)" class="pull-left" > A to B
          </div>
          <button type="button" class="btn btn-primary fare_duration pull-right" style="    margin-bottom: 10px;" onClick="addRow()">Add</button>
          </div-->       
        
        <table id="fare_details" class="cell-border example_personal_details table table-striped table1 table-bordered table-hover dataTable" >
          <thead>
          <tr>
            <th>Name</th>
            <th class="fare_duration">Hourly Hire</th>
            <th class="fare_mile" style="display: none;">Fare type</th>
            <th>Price</th>             
            <!--th class="fare_duration">Action</th-->                                 
           
            </tr>
           </thead>
           <tbody>
           <?php $i=0; ?>
           <?php foreach($fares as $fare) { 
             
            ?>
            <tr id="removeRow_0" class="fare_duration">                 
            <td>
            <input type="text" name="d_fare_name[]" readonly="readonly" value="<?= !empty($fare->plan_name)?$fare->plan_name:''?>" required="" class="form-control" placeholder="Name">
             <input type="hidden" name="plan_id[]" readonly="readonly" value="<?= !empty($fare->id)?$fare->id:''?>" required="" class="form-control" placeholder="Name">
            </td>
            <td><input type="number" name="d_fare_duration[]"  readonly="readonly" value="<?= !empty($fare->hour_ride)?$fare->hour_ride:''?>" min="0" required="" class="form-control" placeholder="Durtaion"></td>
            <td><input type="text" title="" class="form-control fare_price" name="d_fare_price[]" size="5" value="<?= !empty($fare->fare_price)?$fare->fare_price:'00.00'?>" id="fare_price" placeholder="Price"><input type="hidden" name="d_fare_id[]" value="<?= !empty($fare->fare_id)?$fare->fare_id:''?>"> </td> 
          </tr>
          <?php  } ?>

            <?php $j=0; foreach($m_fares as $m_fare) { ?>
            <tr id="removeRow_3" class="fare_mile fare_miles" > 
            <td><?= !empty($m_fare->plan_name)?$m_fare->plan_name:''?> <input type="hidden" name="m_fare_name[]" value="<?= !empty($m_fare->plan_name)?$m_fare->plan_name:''?>" class="form-control" placeholder="Name"></td>
            <td><?= !empty($m_fare->hour_ride)?$m_fare->hour_ride:''?><input type="hidden" name="m_fare_duration[]" value="<?= !empty($m_fare->hour_ride)?$m_fare->hour_ride:''?>" class="form-control" placeholder="Name">
            <input type="hidden" name="m_plan_id[]" readonly="readonly" value="<?= !empty($m_fare->id)?$m_fare->id:''?>" required="" class="form-control" placeholder="Name">
             </td>
            <td><input type="text" title="" class="form-control fare_price" name="m_fare_price[]" size="5" value="<?= !empty($m_fare->fare_price)?$m_fare->fare_price:'00.00'?>" id="fare_price" placeholder="Price"><input type="hidden" name="m_fare_id[]" value="<?= !empty($m_fare->fare_id)?$m_fare->fare_id:''?>"> </td>
     
          </tr>
        
          <?php  } ?>
        </tbody> 
       </table>   
       
        <div class="box-footer sub-btn-wdt">
          <button type="submit" name="submit" value="add" class="btn bg-success wdt-bg">Update</button>
        </div>
   </div>
  </form>
     <div>
      <table id="addrowdata" style="display: none">
       <tr id="removeRow_index_" class="fare_duration">                 
            <td><input type="text" name="d_fare_name[]" value="" required class="form-control" placeholder="Name"></td>
            <td><input type="number" name="d_fare_duration[]" value="" min="0" required class="form-control" placeholder="Durtaion"></td>
            <td><input type="text" class="form-control fare_price" name="d_fare_price[]" size="5" value="" id="fare_price" placeholder="Price"> </td>
            <td><a href="javascript:void(0)" data-id="" id="removeRowId_index_" onClick="removeRow( '_index_' )"> <i class="fa fa-times" aria-hidden="true"></i> </a> </td>
          </tr>
      </table>
      <table id="addrowdata_mile" style="display: none">
       <tr id="removeRow_index_" class="fare_mile fare_miles">  
            <td>A to B <input type="hidden" name="m_fare_name" value="A to B"  class="form-control" placeholder="Name"></td>
            <td>Per Mile <input type="hidden" name="m_fare_duration[]" value="Per Mile"  class="form-control" placeholder="Name"></td>
            <td><input type="text" class="form-control fare_price" name="m_fare_price[]" size="5" value="" id="fare_price" placeholder="Price"> </td>            
            
            <!--td><a href="javascript:void(0)" data-id="" id="removeRowId_index_" onClick="removeRow( '_index_' )"> <i class="fa fa-times" aria-hidden="true"></i> </a> </td-->
        </tr>
        <tr>
          <td><input type="hidden" name="m_fare_name" value="A to B"  class="form-control" placeholder="Name"></td>
          <td>Per Mintue <input type="hidden" name="m_fare_duration[]" value="Per Mintue"  class="form-control" placeholder="Name"></td>
            <td><input type="text" class="form-control fare_price" name="m_fare_price[]" size="5" value="" id="fare_price" placeholder="Price"> </td>
        </tr>
      </table>
    </div>
      <script type="text/javascript" src="<?php echo base_url('assets/js/jquery.priceformat.js');?>"></script>
      <script type="text/javascript">
        $('.fare_price').priceFormat({
        prefix: '',
        thousandsSeparator: ''
      });
       function addRow(){
          var html  = $('#addrowdata tbody').html();
          var length = $('#fare_details tbody tr').length;
          var addrowdata = html.replace(  new RegExp('_index_', 'g'),'_'+length+'' );
          $('#fare_details tbody').append(addrowdata);    
          $('.fare_price').priceFormat({
            prefix: '',
            thousandsSeparator: ''
          }); 
        }

      function addRowMile(){
          var html  = $('#addrowdata_mile tbody').html();
          var length = $('#fare_details tbody tr').length;
          var addrowdata_mile = html.replace(  new RegExp('_index_', 'g'),'_'+length+'' );
          $('#fare_details tbody').append(addrowdata_mile);    
          $('.fare_price').priceFormat({
            prefix: '',
            thousandsSeparator: ''
          }); 
      }

        function removeRow(index){
         var base_url = "<?= base_url()?>";
          if (confirm('Are you sure to delete?')) {   
                var id = $('#removeRowId'+index).attr('data-id');              
                 $('#removeRow'+index).remove();                  
                 if(id!=''){                  
                   $.ajax({
                      type: "POST",
                      url: base_url+'/user/deleteFare',  
                      data :{ 'id' : id},          
                      success: function(response, textStatus, xhr) {  
                      
                      
                      },
                      error: function(xhr, textStatus, errorThrown) {
                          console.log("error");
                      }
                  }); 
                 }
          }          
        }
        function fare_types(type){
           if(type == 'mile'){  
            if($('.fare_miles').length==1){
              addRowMile();
            }             
             $('.fare_mile').show();
             $('.fare_duration').hide();
           }
            
            if(type == 'duration'){
             $('.fare_mile').hide();
             $('.fare_duration').show();
           }
        }
      </script>

      <style type="text/css">
        table#fare_details {
              margin-top: 10px;
          }

      </style>