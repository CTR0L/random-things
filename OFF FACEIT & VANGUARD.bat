@echo off

sc config vgk start=disabled
sc config faceit start=disabled
sc config filecrypt start=disabled
bcdedit /set {current} nx alwaysoff
echo ""
echo "=========================================="
echo "DEP & faceit & vgk & filecrypt - wylaczony"
echo "W BIOSIE: key management - clear, secure boot standard, other os, disable security device -> firmware tpm, disable nx mode, disable iommu"
echo "=========================================="
pause