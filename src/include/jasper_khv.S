# Fuck if I know if this is accurate :)

.include "macros.S"

MAKEPATCH 0x00001880
0:
	bla 0xb510
9:

MAKEPATCH 0x000071EC
0:
	nop
9:

MAKEPATCH 0x00001D10
0:
	bla 0xb560
9:

MAKEPATCH 0x00001D24
0:
	addi r11, r11, 1
	cmplwi cr6, r11, 0xc
9:

MAKEPATCH 0x00009778
0:
	bla 0xb560
9:

MAKEPATCH 0x000097A8
0:
	addi r11, r11, 1
	cmplwi cr6, r11, 0xc
9:

MAKEPATCH 0x00009918
0:
	bla 0xb560
9:

MAKEPATCH 0x00009948
0:
	addi r11, r11, 1
	cmplwi cr6, r11, 0xc
9:

MAKEPATCH 0x00009A68
0:
	bla 0xb560
9:

MAKEPATCH 0x00009A98
0:
	addi r11, r11, 1
	cmplwi cr6, r11, 0xc
9:

MAKEPATCH 0x00009D08
0:
	bla 0xb560
9:

MAKEPATCH 0x00009D38
0:
	addi r11, r11, 1
	cmplwi cr6, r11, 0xc
9:

MAKEPATCH 0x0000A078
0:
	bla 0xb560
9:

MAKEPATCH 0x0000A0A8
0:
	addi r11, r11, 1
	cmplwi cr6, r11, 0xc
9:

MAKEPATCH 0x0000A138
0:
	bla 0xb560
9:

MAKEPATCH 0x0000A168
0:
	addi r11, r11, 1
	sldi r9, r9, 3
	cmpwi cr6, r11, 0xc
9:

MAKEPATCH 0x0000A470
0:
	bla 0xb560
9:

MAKEPATCH 0x0000A49C
0:
	addi r11, r11, 1
	sldi r9, r9, 3
	cmpwi cr6, r11, 0xc
9:

MAKEPATCH 0x000000F0
0:
	#;// 0x000000F0 -> 0x00000000
	.long 0x00000000
	#;// 0x000000F4 -> 0x00000000
	.long 0x00000000
	#;// 0x000000F8 -> 0x00000000
	.long 0x00000000
	#;// 0x000000FC -> 0x00000000
	.long 0x00000000
9:

MAKEPATCH 0x000011BC
0:
	ba 0x154c
9:

MAKEPATCH 0x0000154C
0:
	li r4, 7
	andc r1, r1, r4
	mtspr 0x3b5, r1
	ba 0x11c0
9:

MAKEPATCH 0x00003120
0:
	nop
9:

MAKEPATCH 0x0000A560
0:
	li r3, 1
	blr
9:

MAKEPATCH 0x0002A30C
0:
	nop
	nop
9:

MAKEPATCH 0x0002AA80
0:
	nop
9:

MAKEPATCH 0x0002AA8C
0:
	nop
9:

MAKEPATCH 0x0000B510
0:
	mflr r8
	lhz r3, 6(0)
	li r4, 0x21
	andc r3, r3, r4
	sth r3, 6(0)
	bla 0x68c
	lwz r4, 0x64(r3)
	lwz r5, 0x70(r3)
	add r3, r3, r4
	add r4, r3, r5
	lis r3, 1
	addi r3, r3, -0x60
	li r5, 0xc
	bla 0x484
	li r3, 0x21
	bla 0xb56c
	li r3, 0xa
	bla 0xb56c
	mtlr r8
	ba 0x2d8
	lis r3, 1
	addi r3, r3, -0x60
	blr
	lis r4, -0x8000
	ori r4, r4, 0x200
	sldi r4, r4, 0x20
	oris r4, r4, 0xea00
	slwi r3, r3, 0x18
	stw r3, 0x1014(r4)
	lwz r3, 0x1018(r4)
	rlwinm. r3, r3, 0, 6, 6
	beq 0xb584
	blr
	lis r11, 0x7262
	ori r11, r11, 0x7472
	cmplw cr6, r3, r11
	beq cr6, 0xb5a8
	ba 0x1cc8
	cmplwi cr6, r4, 4
	bgt cr6, 0xb640
	beq cr6, 0xb5f4
	li r5, 0x154c
	lis r6, 0x3880
	cmplwi cr6, r4, 2
	bne cr6, 0xb5cc
	ori r6, r6, 7
	b 0xb5d4
	cmplwi cr6, r4, 3
	bne cr6, 0xb5ec
	li r0, 0
	stw r6, 0(r5)
	dcbst 0, r5
	icbi 0, r5
	sync
	isync
	li r3, 1
	blr
	mflr r12
	std r12, -8(r1)
	stdu r1, -0x10(r1)
	mtlr r5
	mtctr r7
	lwz r4, 0(r6)
	stw r4, 0(r5)
	dcbst 0, r5
	icbi 0, r5
	sync
	isync
	addi r5, r5, 4
	addi r6, r6, 4
	bdnz 0xb608
	blr
	addi r1, r1, 0x10
	ld r12, -8(r1)
	mtlr r12
	blr
	cmplwi cr6, r4, 5
	bne cr6, 0xb658
	mr r3, r6
	mr r4, r5
	mr r5, r7
	ba 0xa880
	li r3, 2
	blr
9:

MAKEPATCH 0x00015FD0
0:
	#;// 0x00015FD0 -> 0x0000b594
	.long 0x0000b594
9:

MAKEPATCH 0x00006BB0
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x00006C48
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x00006C98
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x00006D08
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x00006D58
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x0000813C
0:
	b 0x816c
9:

MAKEPATCH 0x000070BC
0:
	li r3, 1
9:

MAKEPATCH 0x00007268
0:
	li r3, 0
9:

MAKEPATCH 0x000072B4
0:
	nop
9:

MAKEPATCH 0x000072C4
0:
	nop
9:

MAKEPATCH 0x000072EC
0:
	nop
	li r11, 1
9:

MAKEPATCH 0x00024D58
0:
	li r3, 1
	blr
9:

MAKEPATCH 0x000264F0
0:
	li r3, 1
9:

MAKEPATCH 0x00029B08
0:
	cmpldi cr6, r28, 0
	beq cr6, 0x29b3c
	cmpwi cr6, r3, 0
	bne cr6, 0x29b24
	li r4, 0xf0
	b 0x29b34
	nop
	cmplwi cr6, r29, 0
	addi r4, r31, 0x440
	bne cr6, 0x29b34
	li r4, 0x54
	mr r3, r28
	bl 0x200f8
	li r31, 0
9:

MAKEPATCH 0x0002B778
0:
	nop
9:

MAKEPATCH 0x0002CAE8
0:
	li r3, 0
9:

MAKEPATCH 0x0002CDD8
0:
	nop
9:

MAKEPATCH 0x0003089C
0:
	bne cr6, 0x308a4
	li r29, 0
	nop
	nop
9:

MAKEPATCH 0x000304E8
0:
	nop
9:

MAKEPATCH 0x000304FC
0:
	nop
9:

MAKEPATCH 0x0007B920
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x0007C4B8
0:
	li r3, 1
9:

MAKEPATCH 0x0007C5E8
0:
	li r3, 0
9:

MAKEPATCH 0x0007C634
0:
	li r11, 0
9:

MAKEPATCH 0x0007C684
0:
	li r11, 0
9:

MAKEPATCH 0x0007AF08
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x00094F78
0:
	li r23, 0x10
9:

MAKEPATCH 0x000998D0
0:
	cmplwi cr6, r11, 0xff
9:

MAKEPATCH 0x000992B4
0:
	li r3, 0
	nop
	nop
	nop
	nop
9:

MAKEPATCH 0x00109C90
0:
	li r3, 1
	blr
9:

MAKEPATCH 0x0010A788
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x0010AA68
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x0010AF30
0:
	li r3, 1
	blr
9:

MAKEPATCH 0x0010B138
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x0010B0E8
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x0010B278
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x0010B3F8
0:
	li r3, 0
	blr
9:

MAKEPATCH 0x0010BF20
0:
	cmplwi cr6, r5, 0
	li r3, 1
	beq cr6, 0x10bf30
	stw r3, 0(r5)
	blr
9:

MAKEPATCH 0x00111990
0:
	li r3, 1
	blr
9:

MAKEPATCH 0x000E1754
0:
	b 0xe17a8
9:

MAKEPATCH 0x000E17CC
0:
	lwz r26, 0x98(r28)
	nop
	nop
9:

MAKEPATCH 0x0015D9D8
0:
	li r3, 1
	blr
9:

MAKEPATCH 0x0010BF40
0:
	bge cr6, 0x10bf48
	blr
	lis r3, -0x7ff0
	lis r5, 0
	li r4, 0
	ori r4, r4, 8
	ori r3, r3, 0xbfd0
	li r6, 0
	bl 0x7d7c0
	li r3, 0
	lis r4, -0x7ff0
	ori r4, r4, 0xbfec
	isync
	stw r3, 0(r4)
	b 0x613dc
	addi r5, r1, 0x54
	lis r7, -0x7ff0
	ori r7, r7, 0xbfec
	lwz r8, 0(r7)
	isync
	cmplwi cr6, r8, 0
	beq cr6, 0x10bfa0
	mr r31, r31
	b 0x10bf88
	blr
	cmplwi cr6, r3, 0x14
	bne cr6, 0x10bfcc
	lis r7, -0x7ff0
	ori r7, r7, 0xbfec
	lwz r8, 0(r7)
	isync
	cmplwi cr6, r8, 0
	beq cr6, 0x10bfcc
	mr r31, r31
	b 0x10bfb4
	b 0x108410
	rlwnm r4, r2, r12, 0x15, 0x1b
	xori r3, r11, 0x655c
	sc 0xb
	xori r28, r2, 0x6c61
	andis. r14, r11, 0x6368
	#;// 0x0010BFE4 -> 0x2e786578
	.long 0x2e786578
	#;// 0x0010BFE8 -> 0x00000000
	.long 0x00000000
	#;// 0x0010BFEC -> 0x12345678
	.long 0x12345678
9:

MAKEPATCH 0x000613CC
0:
	bl 0x10bf40
9:

MAKEPATCH 0x0007D7F8
0:
	bl 0x10bf7c
9:

MAKEPATCH 0x00108E70
0:
	b 0x10bfa4
9:

MAKEPATCH 0x0015BC80
0:
	b 0x15bccc
9:

MAKEPATCH 0x0008E098
0:
	lis r10, 0x6000
9:

MAKEPATCH 0x000E25A8
0:
	lis r10, 0x6000
9:

MAKEPATCH 0x0008F3F8
0:
	blr
9:

# done with patch section

