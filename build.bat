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

bin\xenon-as.exe src\cd_9452_vfuses.S -I src\include -o output\patch_sections\cd_9452_vfuses.elf
bin\xenon-objcopy.exe output\patch_sections\cd_9452_vfuses.elf -O binary output\patch_sections\cd_9452_vfuses.bin
del output\patch_sections\cd_9452_vfuses.elf

bin\xenon-as.exe src\cd_9452_glitch2.S -I src\include -o output\patch_sections\cd_9452_glitch2.elf
bin\xenon-objcopy.exe output\patch_sections\cd_9452_glitch2.elf -O binary output\patch_sections\cd_9452_glitch2.bin
del output\patch_sections\cd_9452_glitch2.elf

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
echo Building XeBuild patches...

copy /b output\patch_sections\cbb_6752_vfuses.bin + output\patch_sections\cd_9452_vfuses.bin + output\patch_sections\khv_17559_vfuses.bin output\patches_g2mjasper.bin

REM 
REM Note: for reasons currently unknown, the 5772 CB_B doesn't want to boot on the FFFFFFalcon, even though the patches are
REM identical to the jasper BL (6752). If i NOP out all the fuse checks (nop at 0x4F0) the console will boot to XeLL but not
REM the dashboard. I don't have a POST code reader so i can't tell where it's actually failing, or if it's related to RGH3...
REM Perhaps the jasper BL has other differences from CB 5772 that cause 5772 to totally freak when all the fuses are blown.
REM If someone wants to test this, you'll need to uncomment below and run a manual xeBuild.
REM
REM copy /b output\patch_sections\cbb_5772_vfuses.bin + output\patch_sections\cd_9452_vfuses.bin + output\patch_sections\khv_17559_vfuses.bin output\patches_g2mfalcon.bin
REM

echo.
echo All Done!

pause