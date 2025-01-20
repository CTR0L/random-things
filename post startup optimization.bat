timeout /t 5

wmic process where name="dwm.exe" call setpriority "below normal"
wmic process where name="winlogon.exe" call setpriority "below normal"
wmic process where name="lsass.exe" call setpriority "below normal"
wmic process where name="fontdrvhost.exe" call setpriority "below normal"

taskkill /im taskhostw.exe /f
taskkill /im startmenu.exe /f
taskkill /im WmiPrvSE.exe /f
taskkill /im WMIADAP.exe /f

sc stop Wcmsvc
sc stop DispBrokerDesktopSvc
sc stop Psched
sc stop DeviceAssociationService
sc stop camsvc
sc stop CryptSvc
sc stop Appinfo

// Device cleanup https://www.uwe-sieber.de/files/DeviceCleanup.zip
devicecleanup * -s -m:7d

// You have to download restartusbport https://www.uwe-sieber.de/files/RestartUsbPort.zip and usbttreeviewer https://www.uwe-sieber.de/files/UsbTreeView_x64.zip
cd "location of restartusbport.exe"
RestartUsbPort "Device ID usb of mouse from usbtreeviewer"

// optional WMI repository reset
// net stop winmgmt
// winmgmt /resetrepository
// timeout /t 5

// by /CTR0L
@echo off