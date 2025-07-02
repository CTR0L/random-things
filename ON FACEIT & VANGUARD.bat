@echo off
setlocal EnableDelayedExpansion

choice /c yn /n /m "Vanguard on? [Y/N]"
if !errorlevel! == 1 (
	sc config vgk start=system
)
choice /c yn /n /m "Faceit on? [Y/N]"
if !errorlevel! == 1 (
	sc config faceit start=system
	sc config filecrypt start=system
)

bcdedit /set {current} nx optin
echo ""
echo "DEP wlaczony - optin"
echo "W BIOSIE: key management - install, secure boot custom, windows uefi mode, enable firmwaretpm -> security device"
echo "DO FACEITA DODATKOWO: iommu auto/enable, nx mode enable"
echo ""
echo ""
pause