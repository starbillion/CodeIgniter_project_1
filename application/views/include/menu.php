
<?php if(CheckPermission("personal details", "all_read,own_read")){ ?>
					<li class="<?=($this->router->class==="personal_details")?"active":"not-active"?>">
						<a href="<?php echo base_url("personal_details"); ?>"><i class="glyphicon glyphicon-user"></i> <span>Personal details</span></a>
					</li><?php }?>
<?php if(CheckPermission("vehicle details", "all_read,own_read")){ ?>
					<li class="<?=($this->router->class==="vehicle_details")?"active":"not-active"?>">
						<a href="<?php echo base_url("vehicle_details"); ?>"><i class="glyphicon glyphicon-inbox"></i> <span>Vehicle details</span></a>
					</li><?php }?>
<?php if(CheckPermission("Drivers licensing", "all_read,own_read")){ ?>
					<li class="<?=($this->router->class==="drivers_licensing")?"active":"not-active"?>">
						<a href="<?php echo base_url("drivers_licensing"); ?>"><i class="glyphicon glyphicon-book"></i> <span>Drivers licensing</span></a>
					</li><?php }?>
<?php if(CheckPermission("Enter Username and Password", "all_read,own_read")){ ?>
					<li class="<?=($this->router->class==="enter_username_and_password")?"active":"not-active"?>">
						<a href="<?php echo base_url("enter_username_and_password"); ?>"><i class="glyphicon glyphicon-user"></i> <span>Enter Username and Password</span></a>
					</li><?php }?>
