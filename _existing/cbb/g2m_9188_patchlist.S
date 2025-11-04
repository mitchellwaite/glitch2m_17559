# Fuck if I know if this is accurate :)

.include "macros.S"

MAKEPATCH 0x00000410
0:
	li r4, 0x601
9:

MAKEPATCH 0x00004C4C
0:
	ld r3, 0x258(r29)
	lwz r4, 0x64(r3)
	lwz r5, 0x70(r3)
	add r3, r3, r4
	add r4, r3, r5
	mr r3, r10
	li r5, 0xc
	bl 0x5750
9:

MAKEPATCH 0x00004DF4
0:
	nop
9:

MAKEPATCH 0x00004F50
0:
	nop
	nop
	nop
9:

MAKEPATCH 0x00005048
0:
	ld r3, 0x258(r26)
	lwz r4, 0x64(r3)
	lwz r5, 0x70(r3)
	add r3, r3, r4
	add r4, r3, r5
	mr r3, r10
	li r5, 0xc
	bl 0x5750
9:

MAKEPATCH 0x00005660
0:
	li r3, 0
9:

# done with patch section

