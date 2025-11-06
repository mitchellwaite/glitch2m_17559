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
REM !!!! WARNING !!!!
REM As far as I can tell, there is a bug in XeBuild such that any falcon images built in glitch2m or DevGL mode
REM will be unbootable. The reason? Patch slot size at 0x70 in NAND is not set at all. As a workaround, before 
REM a fix for xeBuild or JRunner is available, drop the included patch_70.bin and rawpatch section in to your 
REM _glitch2m.ini
REM 
REM [rawpatch]
REM patch_70.bin,0x70
REM
copy /b output\patch_sections\cbb_5772_vfuses.bin + output\patch_sections\cd_9452_vfuses.bin + output\patch_sections\khv_17559_vfuses.bin output\patches_g2mfalcon.bin
REM

echo.
echo All Done! If you want to run a Falcon image, ensure you read the warning in the README.md

pause