set_property PACKAGE_PIN T22 [get_ports Q[0]];  #LD0
set_property PACKAGE_PIN T21 [get_ports Q[1]];  #LD1
set_property PACKAGE_PIN U22 [get_ports Q[2]];  #LD2
set_property PACKAGE_PIN U21 [get_ports Q[3]];  #LD3
set_property  IOSTANDARD LVCMOS33 [get_ports Q];

set_property PACKAGE_PIN F22 [get_ports {D}];   #SW0
set_property  IOSTANDARD LVCMOS25 [get_ports D];

set_property  PACKAGE_PIN M15 [get_ports clk];  #SW7
set_property  IOSTANDARD LVCMOS25 [get_ports clk];

set_property  PACKAGE_PIN H17 [get_ports reset];#SW6
set_property  IOSTANDARD LVCMOS25 [get_ports reset];

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF];