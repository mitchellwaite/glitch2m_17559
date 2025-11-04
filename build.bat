@echo off

echo ******************************
echo * 17559 Reproducible Patches *
echo ******************************
echo.

if exist output rmdir /S /Q output

mkdir output
mkdir output\patch_sections

echo Building kernel patch files...

bin\xenon-as.exe src\khv_17559_vfuses.S -I src\include -o output\patch_sections\khv_17559_vfuses.elf
bin\xenon-objcopy.exe output\patch_sections\khv_17559_vfuses.elf -O binary output\patch_sections\khv_17559_vfuses.bin
del output\patch_sections\khv_17559_vfuses.elf

bin\xenon-as.exe src\khv_17559_glitch2.S -I src\include -o output\patch_sections\khv_17559_glitch2.elf
bin\xenon-objcopy.exe output\patch_sections\khv_17559_glitch2.elf -O binary output\patch_sections\khv_17559_glitch2.bin
del output\patch_sections\khv_17559_glitch2.elf

echo Building 4BL patch files...



echo Building 2BL patch files...

bin\xenon-as.exe src\cbb_5772_vfuses.S -I src\include -o output\patch_sections\cbb_5772_vfuses.elf
bin\xenon-objcopy.exe output\patch_sections\cbb_5772_vfuses.elf -O binary output\patch_sections\cbb_5772_vfuses.bin
del output\patch_sections\cbb_5772_vfuses.elf

bin\xenon-as.exe src\cbb_5772_glitch2.S -I src\include -o output\patch_sections\cbb_5772_glitch2.elf
bin\xenon-objcopy.exe output\patch_sections\cbb_5772_glitch2.elf -O binary output\patch_sections\cbb_5772_glitch2.bin
del output\patch_sections\cbb_5772_glitch2.elf

bin\xenon-as.exe src\cbb_6752_vfuses.S -I src\include -o output\patch_sections\cbb_6752_vfuses.elf
bin\xenon-objcopy.exe output\patch_sections\cbb_6752_vfuses.elf -O binary output\patch_sections\cbb_6752_vfuses.bin
del output\patch_sections\cbb_6752_vfuses.elf

bin\xenon-as.exe src\cbb_6752_glitch2.S -I src\include -o output\patch_sections\cbb_6752_glitch2.elf
bin\xenon-objcopy.exe output\patch_sections\cbb_6752_glitch2.elf -O binary output\patch_sections\cbb_6752_glitch2.bin
del output\patch_sections\cbb_6752_glitch2.elf

echo.
echo All Done!

pause