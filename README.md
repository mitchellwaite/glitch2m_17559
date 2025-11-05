# 17559 glitch2m and DevGL xeBuild patch set

Why? Because we can do reproducible builds of the patch blobs included with xeBuild. I focus on phat consoles here, because
xeBuild does NOT include glitch2m patches for xenon/zephyr/falcon/jasper by default, and the jasper_glitch2m patch that is used
for DevGL that is floating around is no good for my FFFFFFalcon.

(FFFFFFalcon = a falcon that has had all efuses except for fuseline 0 blown to F)

## What's probably going to work?

- DevGL: Xenon, Zephyr, Falcon, Jasper
- Glitch2m: Falcon, Jasper

Note that all images were built using the Jasper board type in Jrunner. For glitch2m on 17559 phat consoles, you'll need to update Jrunner and then hit F11 to enable "glitch2m for phat" mode. Otherwise, the only phat support for glitch2m is within XDKbuild.

### But what's actually been tested?

I've only tested these patches on my zero fuse xenon and all fuse RGH3 falcon. Other machines are likely to work, as the CD and Kernel patches are basically the same as the DevGL image floating around. If you're not using RGH3, the standard timing files should be fine, since the CB_B is still the same size.

## Future Items

Note: for reasons currently unknown, the 5772 CB_B doesn't want to boot on the FFFFFFalcon, even though the patches are identical to the jasper BL (6752). If i NOP out all the fuse checks (nop at 0x4F0) the console will boot to XeLL but not the dashboard. I don't have a POST code reader so i can't tell where it's actually failing, or if it's related to RGH3, etc. etc. and I don't feel like grabbing a
different falcon to test with when the jasper BL works perfectly fine.

Perhaps the jasper BL has other differences from CB 5772 that cause 5772 to totally freak when all the fuses are blown. If someone wants to test this, you'll need to uncomment the lines in build.bat and run a manual xeBuild. Let me know what POST code it's failing on, we can
try NOPing out those codes and seeing if we can get the 5772 CB_B working properly.

## Credits

- 15432 for posting the pre-made glitch2m images on the 360hub discord. Without this, my ffffffalcon would be fffffried and only able to run XDKbuild. The patches are mostly based on what is included in those images.
- Unknown???? Whoever created the DevGL patches for 17559 that are currently floating around. I'll add credits here if i figure out who wrote them
- XDKbuild and RGLoader for their open source SB/SD/Kernel patches, which are a great reference.