@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xelab  -wto 88851de100964ffba163004dac44f1c0 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_lab1_2_behav xil_defaultlib.tb_lab1_2 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
