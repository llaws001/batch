@ECHO OFF
Title BATCH IP SCANNER
ECHO ==========================================
ECHO WELCOME TO THE BATCH IP SCANNER 
ECHO PLEASE ENTER AN IP WITHIN THE SUBNET YOU WISH TO SCAN
ECHO ==========================================
set /p subnet=Enter the first 3 octets of the IPv4 address:
ECHO ==========================================
for /l %%i in (1,1,254) do @ping -n 1 "%subnet%".%%i
ECHO ==========================================
ECHO DISCOVERED IPs AND MACs
arp -a
ECHO ==========================================
Pause
