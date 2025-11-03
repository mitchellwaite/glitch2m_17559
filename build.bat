@echo off

echo ******************************
echo * 17559 Reproducible Patches *
echo ******************************
echo.

if exist output rmdir /S /Q output

mkdir output
mkdir output\patch_sections

echo Building kernel patch files...

bin\xenon-as.exe src\jasper_khv_vfuses.S -I src\include -o output\patch_sections\jasper_khv_vfuses.elf
bin\xenon-objcopy.exe output\patch_sections\jasper_khv_vfuses.elf -O binary output\patch_sections\jasper_khv_vfuses.bin
del output\patch_sections\jasper_khv_vfuses.elf

bin\xenon-as.exe src\jasper_khv_glitch2.S -I src\include -o output\patch_sections\jasper_khv_glitch2.elf
bin\xenon-objcopy.exe output\patch_sections\jasper_khv_glitch2.elf -O binary output\patch_sections\jasper_khv_glitch2.bin
del output\patch_sections\jasper_khv_glitch2.elf

echo.
echo All Done!

pause