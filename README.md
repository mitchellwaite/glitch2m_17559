# 17559 glitch2m and DevGL xeBuild patch set

Why? Because we can do reproducible builds of the patch blobs included with xeBuild. I focus on phat consoles here, because
xeBuild does NOT include glitch2m patches for xenon/zephyr/falcon/jasper by default, and the jasper_glitch2m patch that is used
for DevGL that is floating around is no good for my FFFFFFalcon.

(FFFFFFalcon = a falcon that has had all efuses except for fuseline 0 blown to F)

## Installation

Download the release, drop the contents of the zip file in your xeBuild/17559 folder, replacing any existing files. For glitch2m on 17559 phat consoles, you'll need to update Jrunner and then hit F11 to enable "glitch2m for phat" mode. Otherwise, the only phat support for glitch2m is within XDKbuild.

What have i tested?

- DevGL Xenon, Glitch2m FFFFFalcon, Glitch2m Jasper

> [!WARNING]
> By default, glitch2m builds using the Falcon board type for Falcon/Zephyr/Xenon. Currently, there is an apparent bug in XeBuild where the patch slot size DWORD at 0x70 in NAND is not being set when the board type is set to Falcon. A future version of Jrunner will add an automatic patching function to solve this issue.
>
> As a workaround, add the following section to your ini file and drop patch_70.bin in your 17559 folder.
>
> [rawpatch]
> patch_70.bin,0x70
## Credits

- wurthless-electroniks for modern_loadfare CB patching project and the xeBuild patch diff tool
- 15432 for posting the pre-made glitch2m images on the 360hub discord. Without this, my ffffffalcon would be fffffried and only able to run XDKbuild. The patches are mostly based on what is included in those images.
- Unknown???? Whoever created the DevGL patches for 17559 that are currently floating around. I'll add credits here if i figure out who wrote them
- XDKbuild and RGLoader for their open source SB/SD/Kernel patches, which are a great reference.