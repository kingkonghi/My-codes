@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xsim cfg_tb_lab1_1_behav -key {Behavioral:sim_1:Functional:cfg_tb_lab1_1} -tclbatch cfg_tb_lab1_1.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
