@echo off
echo "Startup by CTR0L"
timeout /t 3

wmic process where name="dwm.exe" call setpriority "below normal"
wmic process where name="winlogon.exe" call setpriority "below normal"
wmic process where name="lsass.exe" call setpriority "below normal"
wmic process where name="fontdrvhost.exe" call setpriority "below normal"

taskkill /im taskhostw.exe /f
taskkill /im startmenu.exe /f
taskkill /im WmiPrvSE.exe /f
taskkill /im WMIADAP.exe /f
taskkill /im dllhost.exe /f

REG DELETE "HKCU\System\GameConfigStore\Children" /f >NUL 2>&1
REG DELETE "HKCU\System\GameConfigStore\Parents" /f >NUL 2>&1
REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense" /f > NUL 2>&1
REG ADD "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >NUL 2>&1
REG DELETE "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f >NUL 2>&1
REG DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /f > NUL 2>&1

sc stop Wcmsvc
sc stop DispBrokerDesktopSvc
sc stop Psched
sc stop DeviceAssociationService
sc stop camsvc
sc stop CryptSvc
sc stop Appinfo
sc stop sppsvc

// Device cleanup https://www.uwe-sieber.de/files/DeviceCleanup.zip
devicecleanup * -s -m:1d

// You have to download restartusbport https://www.uwe-sieber.de/files/RestartUsbPort.zip and usbttreeviewer https://www.uwe-sieber.de/files/UsbTreeView_x64.zip
cd "location of restartusbport.exe"
RestartUsbPort "Device ID usb of mouse from usbtreeviewer"

// optional WMI repository reset
// net stop winmgmt
// winmgmt /resetrepository
// timeout /t 5

echo "Press to restart DWM, otherwise exit"
pause

taskkill /f /im dwm.exe
timeout /t 3
start %windir%\system32\dwm.exe

@echo off
exit
