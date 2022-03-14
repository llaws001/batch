@ECHO OFF
Title Compensating Control Batch File
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
ECHO ==========================================
ECHO WELCOME TO THE COMPENSATING CONTROL BATCH FILE
ECHO PLEASE TYPE A NUMBER IN REFERENCE TO THE REQUIRED COMPENSATING CONTROL. To see a list of 
ECHO ==========================================
ECHO 1. Disable the Print Spooler
ECHO 2. Disable IPv6 Packet Reassembly
ECHO 3. Disable Remote Desktop
ECHO ==========================================

:loop
set /p cnumber=Enter Compensating Control Number:

if %cnumber%==1 ( 
net stop spooler
sc config "Spooler" start=disabled
ECHO If success is displayed above, the print spooler service has been disabled. 
timeout /t 15
exit /b 0
)
if %cnumber%==2 (
Netsh int ipv6 set global reassemblylimit=0
ECHO If the command says "ok", it has been successfully implemented. 
timeout /t 15
PAUSE
exit /b 0
)
if %cnumber%==3 (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
timeout /t 15
PAUSE
exit /b 0
) else (
ECHO Incorrect Entry. Please try again.
goto loop
)