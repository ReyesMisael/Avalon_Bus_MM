# Require package ::quartus::flow
# Require package ::quartus::project

## Create a new revision called "tmp" if not exits
if {![revision_exists tmp]} {
	create_revision tmp
}

## set tmp revision 
set_current_revision tmp

## 
execute_module -tool swb;

## compile
execute_flow -compile;

## simulate 
execute_module -tool sim;
