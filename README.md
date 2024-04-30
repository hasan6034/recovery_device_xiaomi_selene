TWRP Device Tree for Redmi 10 (selene) MIUI 12.5
===========================================

The Redmi 10 is a budget range smartphone from Redmi, Released 2021, August 20

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
OS	| Android 11, MIUI 12.5	
CPU     | Octa-core (2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)
Chipset | MediaTek Helio G88 (12nm)
GPU     | Mali-G52 MC2
Memory  | 4GB/6GB RAM
Storage | 64GB/128GB
MicroSD | microSDXC (dedicated slot)
Battery | Non-removable Li-Ion 5000 mAh battery
Resolution | 1080 x 2400 pixels, 20:9 ratio (~405 ppi density)
Camera (Rear)  | 50 MP, f/1.8, (wide),8 MP, f/2.2, 120˚ (ultrawide),2 MP, f/2.4, (macro),2 MP, f/2.4 (depth)
Rear Camera Features | LED flash, HDR, panorama
Video	| 1080p@30fps	
Camera (Front)  | 8 MP, f/2.0, (wide)
Features| Fingerprint (side-mounted), accelerometer, proximity, compass


## Device picture

![Redmi 10](https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-redmi-10-1.jpg "Redmi 10")



### Blocking checks
- [x] Correct screen/recovery size
- [x] Working Touch, screen
- [x] Backup to internal/microSD
- [x] Restore from internal/microSD
- [x] reboot to system
- [x] ADB

### Medium checks
- [x] update.zip sideload
- [x] UI colors (red/blue inversions)
- [x] Screen goes off and on
- [x] F2FS/EXT4 Support, exFAT/NTFS where supported
- [x] all important partitions listed in mount/backup lists
- [x] backup/restore to/from external (USB-OTG) storage (not supported by the device)
- [x] backup/restore to/from adb
- [x] decrypt /data
- [x] Correct date

### Minor checks
- [x] MTP export
- [x] reboot to bootloader
- [x] reboot to recovery
- [x] poweroff
- [x] battery level
- [x] temperature
- [x] encrypted backups
- [x] input devices via USB (USB-OTG) - keyboard, mouse and disks (not supported by the device)
- [x] USB mass storage export
- [x] set brightness
- [x] vibrate
- [x] screenshot
- [x] partition SD card

# Building
```bash
source build/envsetup.sh
lunch twrp_selene-eng
mka bootimage -j$(nproc --all)
```
