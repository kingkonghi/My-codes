@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xelab  -wto 352f69464a0e4e3b9443a01c6cd7b616 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot cfg_tb_lab1_1_behav xil_defaultlib.cfg_tb_lab1_1 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
