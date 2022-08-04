--------------------------------------------------------------------
startup:
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f
0809 : 31 00 __ AND ($00),y
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e 08 35 STX $3508 ; (spentry + 0)
0811 : a9 45 __ LDA #$45
0813 : 85 19 __ STA IP + 0
0815 : a9 45 __ LDA #$45
0817 : 85 1a __ STA IP + 1
0819 : 38 __ __ SEC
081a : a9 45 __ LDA #$45
081c : e9 45 __ SBC #$45
081e : f0 0f __ BEQ $082f
0820 : aa __ __ TAX
0821 : a9 00 __ LDA #$00
0823 : a0 00 __ LDY #$00
0825 : 91 19 __ STA (IP + 0),y
0827 : c8 __ __ INY
0828 : d0 fb __ BNE $0825
082a : e6 1a __ INC IP + 1
082c : ca __ __ DEX
082d : d0 f6 __ BNE $0825
082f : 38 __ __ SEC
0830 : a9 c9 __ LDA #$c9
0832 : e9 45 __ SBC #$45
0834 : f0 08 __ BEQ $083e
0836 : a8 __ __ TAY
0837 : a9 00 __ LDA #$00
0839 : 88 __ __ DEY
083a : 91 19 __ STA (IP + 0),y
083c : d0 fb __ BNE $0839
083e : a9 c0 __ LDA #$c0
0840 : 85 23 __ STA SP + 0
0842 : a9 9f __ LDA #$9f
0844 : 85 24 __ STA SP + 1
0846 : a9 6c __ LDA #$6c
0848 : 85 19 __ STA IP + 0
084a : a9 08 __ LDA #$08
084c : 85 1a __ STA IP + 1
084e : a0 00 __ LDY #$00
0850 : f0 03 __ BEQ $0855
0852 : a4 02 __ LDY $02
0854 : c8 __ __ INY
0855 : b1 19 __ LDA (IP + 0),y
0857 : 8d 5c 08 STA $085c ; (startup + 91)
085a : c8 __ __ INY
085b : 6c 00 09 JMP ($0900)
085e : 98 __ __ TYA
085f : a0 00 __ LDY #$00
0861 : 18 __ __ CLC
0862 : 65 19 __ ADC IP + 0
0864 : 85 19 __ STA IP + 0
0866 : 90 ed __ BCC $0855
0868 : e6 1a __ INC IP + 1
086a : d0 e9 __ BNE $0855
086c : f2 __ __ INV
086d : 00 __ __ BRK
086e : 0a __ __ ASL
086f : 02 __ __ INV
0870 : a9 4c __ LDA #$4c
0872 : 85 54 __ STA $54
0874 : a9 00 __ LDA #$00
0876 : 85 13 __ STA P6
0878 : a9 19 __ LDA #$19
087a : 85 16 __ STA P9
087c : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
3508 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
0a00:	ENTER	6, 8
0a04:	PUSH	#$0006
0a07:	MOV	P0, #0
0a0a:	CALL	malloc + 0
0a0d:	LEA	T1, $1614
0a11:	LEA	ADDR, spaces + 0
0a15:	MOV	ACCU, T1
0a17:	STRCPY
0a18:	MOV	P4, #$0400
0a1c:	MOV	ACCU, #0
0a1f:	MOV	xpos + 0, ACCU
0a23:	MOV	ypos + 0, ACCU
0a27:	LEA	P0, $e000
0a2b:	LEA	P2, data + 0
0a2f:	JSR	memcpy + 0
0a32:	MOVB	P0, #3
0a35:	MOV	ACCU, #200
0a38:	MOVB	$0288, ACCU
0a3c:	CALL	vic_setbank + 0
0a3f:	MOV	ACCU, #40
0a42:	MOVB	$d018, ACCU
0a46:	MOV	ACCU, #0
0a49:	MOV	i + 0, ACCU
0a4d:	MOV	T0, #0
0a50:	MOV	T1, i + 0
0a54:	LEAX	ADDR, $c800 + T1
0a58:	MOV	ACCU, #32
0a5b:	MOVB	0(ADDR), ACCU
0a5e:	ADD	T1, #$0001
0a62:	MOV	i + 0, T1
0a66:	MOV	ACCU, T1
0a68:	CMPS	ACCU, #$0400
0a6b:	BGT	$0A50
0a6d:	MOVB	P4, #0
0a70:	MOVB	P5, #10
0a73:	MOVB	P6, #40
0a76:	MOVB	P7, #15
0a79:	LEA	T1, $c800
0a7d:	MOV	ACCU, T1
0a7f:	MOV	P2, ACCU
0a81:	LEA	T2, outputwin + 0
0a85:	MOV	ACCU, T2
0a87:	MOV	P0, ACCU
0a89:	CALL	cwin_init + 0
0a8c:	MOV	2(SP), T2
0a8f:	CALL	cwin_clear + 0
0a92:	MOV	ACCU, T1
0a94:	MOV	P2, ACCU
0a96:	MOVB	P4, #0
0a99:	MOVB	P5, #4
0a9c:	MOVB	P6, #40
0a9f:	MOVB	P7, #2
0aa2:	LEA	T2, inputwin + 0
0aa6:	MOV	ACCU, T2
0aa8:	MOV	P0, ACCU
0aaa:	CALL	cwin_init + 0
0aad:	MOV	2(SP), T2
0ab0:	CALL	cwin_clear + 0
0ab3:	MOV	ACCU, T2
0ab5:	MOV	P7, ACCU
0ab7:	MOVB	P9, #32
0aba:	MOVB	P10, #5
0abd:	CALL	cwin_fill + 0
0ac0:	MOV	ACCU, T1
0ac2:	MOV	P2, ACCU
0ac4:	MOVB	P4, #0
0ac7:	MOVB	P5, #7
0aca:	MOVB	P6, #40
0acd:	MOVB	P7, #2
0ad0:	LEA	T1, msgwin + 0
0ad4:	MOV	ACCU, T1
0ad6:	MOV	P0, ACCU
0ad8:	CALL	cwin_init + 0
0adb:	MOV	2(SP), T1
0ade:	CALL	cwin_clear + 0
0ae1:	NOP
0ae2:	CALL	corral + 0
0ae5:	MOV	ACCU, #1
0ae8:	MOVB	c + 0, ACCU
0aec:	MOV	ACCU, #0
0aef:	MOV	i + 0, ACCU
0af3:	MOV	T1, #1
0af6:	MOV	T2, i + 0
0afa:	LEAX	ADDR, tmpstring + 0 + T2
0afe:	MOV	ACCU, #0
0b01:	MOVB	0(ADDR), ACCU
0b04:	LEAX	ADDR, inputstring + 0 + T2
0b08:	MOVB	0(ADDR), ACCU
0b0b:	ADD	T2, #$0001
0b0f:	MOV	i + 0, T2
0b13:	MOV	ACCU, T2
0b15:	CMPS	ACCU, #$0019
0b18:	BGT	$0AF6
0b1a:	MOV	ACCU, T1
0b1c:	BEQF	$0D17
0b1f:	MOVUB	ACCU, c + 0
0b23:	CMPUB	ACCU, #$000D
0b25:	BEQ	$0B1A
0b27:	JSR	$17ae
0b2a:	MOVB	T3, $c878
0b2e:	MOVB	c + 0, T3
0b32:	MOV	ACCU, #32
0b35:	MOVB	$c878, ACCU
0b39:	MOVB	ACCU, T3
0b3b:	CMPUB	ACCU, #$009D
0b3d:	BEQF	$0CFE
0b40:	MOVB	ACCU, T3
0b42:	CMPUB	ACCU, #$001D
0b44:	BEQF	$0CE2
0b47:	MOVB	ACCU, T3
0b49:	CMPUB	ACCU, #$0011
0b4b:	BEQF	$0CC6
0b4e:	MOVB	ACCU, T3
0b50:	CMPUB	ACCU, #$0091
0b52:	BEQF	$0CA1
0b55:	MOVB	ACCU, T3
0b57:	CMPUB	ACCU, #$0023
0b59:	BNE	$0B6B
0b5b:	LEAX	ADDR, inputstring + 0 + T0
0b5f:	MOV	ACCU, #0
0b62:	MOVB	0(ADDR), ACCU
0b65:	ADD	T0, #$FFFF
0b69:	JUMP	$0B27
0b6b:	MOVB	ACCU, T3
0b6d:	CMPUB	ACCU, #$0030
0b6f:	BGT	$0BA9
0b71:	MOVB	ACCU, T3
0b73:	CMPUB	ACCU, #$0039
0b75:	BLT	$0BA9
0b77:	MOV	P0, #0
0b7a:	MOV	P2, #5
0b7d:	LEAX	ADDR, inputstring + 0 + T0
0b81:	MOVB	0(ADDR), T3
0b84:	LEAX	ADDR, inputstring + 2 + T0
0b88:	MOV	ACCU, #0
0b8b:	MOVB	0(ADDR), ACCU
0b8e:	CALL	gotoxy + 0
0b91:	LEA	T1, $2503
0b95:	MOV	2(SP), T1
0b98:	LEA	T1, inputstring + 0
0b9c:	MOV	4(SP), T1
0b9f:	CALL	printf + 0
0ba2:	ADD	T0, #$0001
0ba6:	JUMPF	$0B27
0ba9:	MOVB	ACCU, T3
0bab:	CMPUB	ACCU, #$0041
0bad:	BGT	$0BB5
0baf:	MOVB	ACCU, T3
0bb1:	CMPUB	ACCU, #$005A
0bb3:	BGE	$0B77
0bb5:	MOVB	ACCU, T3
0bb7:	CMPUB	ACCU, #$0020
0bb9:	BEQ	$0B77
0bbb:	MOVB	ACCU, T3
0bbd:	CMPUB	ACCU, #$002D
0bbf:	BLT	$0B77
0bc1:	MOVB	ACCU, T3
0bc3:	CMPUB	ACCU, #$000D
0bc5:	BNEF	$0B27
0bc8:	MOV	ACCU, #0
0bcb:	MOV	ypos + 0, ACCU
0bcf:	MOV	xpos + 0, ACCU
0bd3:	JSR	$2506
0bd6:	MOVB	T3, $c8f3
0bda:	MOV	ACCU, #32
0bdd:	MOVB	$c8f3, ACCU
0be1:	MOVB	ACCU, T3
0be3:	BNE	$0C21
0be5:	MOV	ACCU, #12
0be8:	MOV	P0, ACCU
0bea:	MOV	P2, ACCU
0bec:	CALL	gotoxy + 0
0bef:	LEA	T1, inputwin + 0
0bf3:	MOV	2(SP), T1
0bf6:	CALL	cwin_clear + 0
0bf9:	MOV	ACCU, T1
0bfb:	MOV	P7, ACCU
0bfd:	MOVB	P9, #32
0c00:	MOVB	P10, #5
0c03:	CALL	cwin_fill + 0
0c06:	MOV	ACCU, T1
0c08:	MOV	P0, ACCU
0c0a:	MOV	ACCU, #0
0c0d:	MOVB	P2, ACCU
0c0f:	MOVB	P3, ACCU
0c11:	MOVB	P6, #13
0c14:	LEA	P4, inputstring + 0
0c18:	JSR	cwin_putat_string + 0
0c1b:	MOV	T1, #0
0c1e:	JUMPF	$0B1A
0c21:	MOVB	ACCU, T3
0c23:	MOVB	T5, ACCU
0c25:	MOV	ACCU, T0
0c27:	ADD	ACCU, #$0578
0c2b:	MOV	ADDR, ACCU
0c2d:	MOVB	0(ADDR), T3
0c30:	MOVB	ACCU, T3
0c32:	CMPUB	ACCU, #$0001
0c34:	BGT	$0C3C
0c36:	MOVB	ACCU, T3
0c38:	CMPUB	ACCU, #$001F
0c3a:	BGE	$0C54
0c3c:	MOVB	ACCU, T3
0c3e:	CMPUB	ACCU, #$0040
0c40:	BGT	$0C48
0c42:	MOVB	ACCU, T3
0c44:	CMPUB	ACCU, #$005E
0c46:	BGE	$0C98
0c48:	MOVB	ACCU, T3
0c4a:	CMPUB	ACCU, #$005F
0c4c:	BGT	$0C5B
0c4e:	MOVB	ACCU, T3
0c50:	CMPUB	ACCU, #$0077
0c52:	BLT	$0C5B
0c54:	MOVB	ACCU, T3
0c56:	ADDB	ACCU, #$0040
0c59:	MOVB	T5, ACCU
0c5b:	MOV	P0, #0
0c5e:	MOV	P2, #5
0c61:	LEAX	ADDR, inputstring + 0 + T0
0c65:	MOVB	0(ADDR), T5
0c68:	LEAX	ADDR, inputstring + 2 + T0
0c6c:	MOV	ACCU, #0
0c6f:	MOVB	0(ADDR), ACCU
0c72:	CALL	gotoxy + 0
0c75:	LEA	T1, $2564
0c79:	MOV	2(SP), T1
0c7c:	LEA	T1, inputstring + 0
0c80:	MOV	4(SP), T1
0c83:	CALL	printf + 0
0c86:	MOV	P0, xpos + 0
0c8a:	MOV	P2, ypos + 0
0c8e:	CALL	gotoxy + 0
0c91:	ADD	T0, #$0001
0c95:	JUMPF	$0B27
0c98:	MOVB	ACCU, T3
0c9a:	ADDB	ACCU, #$0020
0c9d:	MOVB	T5, ACCU
0c9f:	JUMP	$0C5B
0ca1:	MOV	T1, ypos + 0
0ca5:	ADD	T1, #$FFFF
0ca9:	MOV	ypos + 0, T1
0cad:	MOV	ACCU, T1
0caf:	BGE	$0CB8
0cb1:	MOV	ACCU, #2
0cb4:	MOV	ypos + 0, ACCU
0cb8:	MOV	P0, xpos + 0
0cbc:	MOV	P2, ypos + 0
0cc0:	CALL	gotoxy + 0
0cc3:	JUMPF	$0B27
0cc6:	MOV	T1, ypos + 0
0cca:	ADD	T1, #$0001
0cce:	MOV	ypos + 0, T1
0cd2:	MOV	ACCU, T1
0cd4:	CMPS	ACCU, #$0003
0cd7:	BGE	$0CB8
0cd9:	MOV	ACCU, #0
0cdc:	MOV	ypos + 0, ACCU
0ce0:	JUMP	$0CB8
0ce2:	MOV	T1, xpos + 0
0ce6:	ADD	T1, #$0001
0cea:	MOV	xpos + 0, T1
0cee:	MOV	ACCU, T1
0cf0:	CMPS	ACCU, #$0027
0cf3:	BGE	$0CB8
0cf5:	MOV	ACCU, #0
0cf8:	MOV	xpos + 0, ACCU
0cfc:	JUMP	$0CB8
0cfe:	MOV	T1, xpos + 0
0d02:	ADD	T1, #$FFFE
0d06:	MOV	xpos + 0, T1
0d0a:	MOV	ACCU, T1
0d0c:	BGE	$0CB8
0d0e:	MOV	ACCU, #39
0d11:	MOV	xpos + 0, ACCU
0d15:	JUMP	$0CB8
0d17:	MOV	ACCU, #0
0d1a:	MOV	z + 0, ACCU
0d1e:	LEA	P0, inputstring + 0
0d22:	JSR	strlen + 0
0d25:	MOV	T0, #0
0d28:	CMPS	ACCU, #$0000
0d2b:	BGEF	$0AE2
0d2e:	MOV	T1, z + 0
0d32:	LEAX	ADDR, inputstring + 0 + T1
0d36:	MOVB	T3, 0(ADDR)
0d39:	LEA	T1, inputstring + 0
0d3d:	MOVB	ACCU, T3
0d3f:	CMPUB	ACCU, #$0069
0d41:	BEQF	$1536
0d44:	BLEF	$111B
0d47:	MOVB	ACCU, T3
0d49:	CMPUB	ACCU, #$0051
0d4b:	BEQF	$1111
0d4e:	BLEF	$0F45
0d51:	MOVB	ACCU, T3
0d53:	CMPUB	ACCU, #$0046
0d55:	BEQF	$0F3B
0d58:	BLEF	$0E94
0d5b:	MOVB	ACCU, T3
0d5d:	CMPUB	ACCU, #$003F
0d5f:	BEQF	$0E83
0d62:	BLEF	$0E2F
0d65:	MOVB	ACCU, T3
0d67:	CMPUB	ACCU, #$0027
0d69:	BEQF	$0E1F
0d6c:	BLEF	$0DF2
0d6f:	MOVB	ACCU, T3
0d71:	CMPUB	ACCU, #$0021
0d73:	BEQ	$0DE2
0d75:	MOVB	ACCU, T3
0d77:	CMPUB	ACCU, #$0023
0d79:	BEQ	$0DD2
0d7b:	MOVB	ACCU, T3
0d7d:	CMPUB	ACCU, #$0024
0d7f:	BEQ	$0DA6
0d81:	MOV	T2, i + 0
0d85:	LEAX	ADDR, inputstring + 0 + T2
0d89:	MOVB	P0, 0(ADDR)
0d8c:	CALL	putchar + 0
0d8f:	LEA	T2, $27e0
0d93:	MOV	2(SP), T2
0d96:	MOV	T2, i + 0
0d9a:	LEAX	ADDR, inputstring + 0 + T2
0d9e:	MOVUB	ACCU, 0(ADDR)
0da1:	MOV	4(SP), ACCU
0da4:	JUMP	$0DB4
0da6:	LEA	T2, $260a
0daa:	MOV	2(SP), T2
0dad:	MOVUB	ACCU, inputstring + 1
0db1:	MOV	4(SP), ACCU
0db4:	CALL	printf + 0
0db7:	MOV	ACCU, T1
0db9:	MOV	P0, ACCU
0dbb:	MOV	T1, z + 0
0dbf:	ADD	T1, #$0001
0dc3:	MOV	z + 0, T1
0dc7:	JSR	strlen + 0
0dca:	CMPS	ACCU, T1
0dcc:	BLTF	$0D2E
0dcf:	JUMPF	$0AE2
0dd2:	LEA	T2, $2604
0dd6:	MOV	2(SP), T2
0dd9:	MOVUB	ACCU, inputstring + 1
0ddd:	MOV	4(SP), ACCU
0de0:	JUMP	$0DB4
0de2:	LEA	T2, $25fa
0de6:	MOV	2(SP), T2
0de9:	MOVUB	ACCU, inputstring + 1
0ded:	MOV	4(SP), ACCU
0df0:	JUMP	$0DB4
0df2:	MOVB	ACCU, T3
0df4:	CMPUB	ACCU, #$003D
0df6:	BNE	$0E08
0df8:	LEA	T2, $259a
0dfc:	MOV	2(SP), T2
0dff:	MOVUB	ACCU, inputstring + 1
0e03:	MOV	4(SP), ACCU
0e06:	JUMP	$0DB4
0e08:	MOVB	ACCU, T3
0e0a:	CMPUB	ACCU, #$003E
0e0c:	BNEF	$0D81
0e0f:	LEA	T2, $2619
0e13:	MOV	2(SP), T2
0e16:	MOVUB	ACCU, inputstring + 1
0e1a:	MOV	4(SP), ACCU
0e1d:	JUMP	$0DB4
0e1f:	LEA	T2, $2611
0e23:	MOV	2(SP), T2
0e26:	MOVUB	ACCU, inputstring + 1
0e2a:	MOV	4(SP), ACCU
0e2d:	JUMP	$0DB4
0e2f:	MOVB	ACCU, T3
0e31:	CMPUB	ACCU, #$0044
0e33:	BNE	$0E3F
0e35:	LEA	T2, $25bf
0e39:	MOV	2(SP), T2
0e3c:	JUMPF	$0DB4
0e3f:	BLE	$0E72
0e41:	MOVB	ACCU, T3
0e43:	CMPUB	ACCU, #$0041
0e45:	BNE	$0E51
0e47:	LEA	T2, $25b9
0e4b:	MOV	2(SP), T2
0e4e:	JUMPF	$0DB4
0e51:	MOVB	ACCU, T3
0e53:	CMPUB	ACCU, #$0042
0e55:	BNE	$0E61
0e57:	LEA	T2, $25bb
0e5b:	MOV	2(SP), T2
0e5e:	JUMPF	$0DB4
0e61:	MOVB	ACCU, T3
0e63:	CMPUB	ACCU, #$0043
0e65:	BNEF	$0D81
0e68:	LEA	T2, $25bd
0e6c:	MOV	2(SP), T2
0e6f:	JUMPF	$0DB4
0e72:	MOVB	ACCU, T3
0e74:	CMPUB	ACCU, #$0045
0e76:	BNEF	$0D81
0e79:	LEA	T2, $25c1
0e7d:	MOV	2(SP), T2
0e80:	JUMPF	$0DB4
0e83:	LEA	T2, $2623
0e87:	MOV	2(SP), T2
0e8a:	MOVUB	ACCU, inputstring + 1
0e8e:	MOV	4(SP), ACCU
0e91:	JUMPF	$0DB4
0e94:	MOVB	ACCU, T3
0e96:	CMPUB	ACCU, #$004C
0e98:	BNE	$0EA4
0e9a:	LEA	T2, $25cf
0e9e:	MOV	2(SP), T2
0ea1:	JUMPF	$0DB4
0ea4:	BLE	$0EFA
0ea6:	MOVB	ACCU, T3
0ea8:	CMPUB	ACCU, #$004A
0eaa:	BNE	$0EB6
0eac:	LEA	T2, $25cb
0eb0:	MOV	2(SP), T2
0eb3:	JUMPF	$0DB4
0eb6:	BLE	$0EE9
0eb8:	MOVB	ACCU, T3
0eba:	CMPUB	ACCU, #$0047
0ebc:	BNE	$0EC8
0ebe:	LEA	T2, $25c5
0ec2:	MOV	2(SP), T2
0ec5:	JUMPF	$0DB4
0ec8:	MOVB	ACCU, T3
0eca:	CMPUB	ACCU, #$0048
0ecc:	BNE	$0ED8
0ece:	LEA	T2, $25c7
0ed2:	MOV	2(SP), T2
0ed5:	JUMPF	$0DB4
0ed8:	MOVB	ACCU, T3
0eda:	CMPUB	ACCU, #$0049
0edc:	BNEF	$0D81
0edf:	LEA	T2, $25c9
0ee3:	MOV	2(SP), T2
0ee6:	JUMPF	$0DB4
0ee9:	MOVB	ACCU, T3
0eeb:	CMPUB	ACCU, #$004B
0eed:	BNEF	$0D81
0ef0:	LEA	T2, $25cd
0ef4:	MOV	2(SP), T2
0ef7:	JUMPF	$0DB4
0efa:	MOVB	ACCU, T3
0efc:	CMPUB	ACCU, #$004D
0efe:	BNE	$0F0A
0f00:	LEA	T2, $25d1
0f04:	MOV	2(SP), T2
0f07:	JUMPF	$0DB4
0f0a:	MOVB	ACCU, T3
0f0c:	CMPUB	ACCU, #$004E
0f0e:	BNE	$0F1A
0f10:	LEA	T2, $25d3
0f14:	MOV	2(SP), T2
0f17:	JUMPF	$0DB4
0f1a:	MOVB	ACCU, T3
0f1c:	CMPUB	ACCU, #$004F
0f1e:	BNE	$0F2A
0f20:	LEA	T2, $25d5
0f24:	MOV	2(SP), T2
0f27:	JUMPF	$0DB4
0f2a:	MOVB	ACCU, T3
0f2c:	CMPUB	ACCU, #$0050
0f2e:	BNEF	$0D81
0f31:	LEA	T2, $25d7
0f35:	MOV	2(SP), T2
0f38:	JUMPF	$0DB4
0f3b:	LEA	T2, $25c3
0f3f:	MOV	2(SP), T2
0f42:	JUMPF	$0DB4
0f45:	MOVB	ACCU, T3
0f47:	CMPUB	ACCU, #$005D
0f49:	BNE	$0F5C
0f4b:	LEA	T2, $25ed
0f4f:	MOV	2(SP), T2
0f52:	MOVUB	ACCU, inputstring + 1
0f56:	MOV	4(SP), ACCU
0f59:	JUMPF	$0DB4
0f5c:	BLEF	$1024
0f5f:	MOVB	ACCU, T3
0f61:	CMPUB	ACCU, #$0058
0f63:	BNE	$0F6F
0f65:	LEA	T2, $25e7
0f69:	MOV	2(SP), T2
0f6c:	JUMPF	$0DB4
0f6f:	BLE	$0FD5
0f71:	MOVB	ACCU, T3
0f73:	CMPUB	ACCU, #$0055
0f75:	BNE	$0F81
0f77:	LEA	T2, $25e1
0f7b:	MOV	2(SP), T2
0f7e:	JUMPF	$0DB4
0f81:	BLE	$0FB4
0f83:	MOVB	ACCU, T3
0f85:	CMPUB	ACCU, #$0052
0f87:	BNE	$0F93
0f89:	LEA	T2, $25db
0f8d:	MOV	2(SP), T2
0f90:	JUMPF	$0DB4
0f93:	MOVB	ACCU, T3
0f95:	CMPUB	ACCU, #$0053
0f97:	BNE	$0FA3
0f99:	LEA	T2, $25dd
0f9d:	MOV	2(SP), T2
0fa0:	JUMPF	$0DB4
0fa3:	MOVB	ACCU, T3
0fa5:	CMPUB	ACCU, #$0054
0fa7:	BNEF	$0D81
0faa:	LEA	T2, $25df
0fae:	MOV	2(SP), T2
0fb1:	JUMPF	$0DB4
0fb4:	MOVB	ACCU, T3
0fb6:	CMPUB	ACCU, #$0056
0fb8:	BNE	$0FC4
0fba:	LEA	T2, $25e3
0fbe:	MOV	2(SP), T2
0fc1:	JUMPF	$0DB4
0fc4:	MOVB	ACCU, T3
0fc6:	CMPUB	ACCU, #$0057
0fc8:	BNEF	$0D81
0fcb:	LEA	T2, $25e5
0fcf:	MOV	2(SP), T2
0fd2:	JUMPF	$0DB4
0fd5:	MOVB	ACCU, T3
0fd7:	CMPUB	ACCU, #$0059
0fd9:	BNE	$0FE5
0fdb:	LEA	T2, $25e9
0fdf:	MOV	2(SP), T2
0fe2:	JUMPF	$0DB4
0fe5:	MOVB	ACCU, T3
0fe7:	CMPUB	ACCU, #$005A
0fe9:	BNE	$0FF5
0feb:	LEA	T2, $25eb
0fef:	MOV	2(SP), T2
0ff2:	JUMPF	$0DB4
0ff5:	MOVB	ACCU, T3
0ff7:	CMPUB	ACCU, #$005B
0ff9:	BNE	$100C
0ffb:	LEA	T2, $25a3
0fff:	MOV	2(SP), T2
1002:	MOVUB	ACCU, inputstring + 1
1006:	MOV	4(SP), ACCU
1009:	JUMPF	$0DB4
100c:	MOVB	ACCU, T3
100e:	CMPUB	ACCU, #$005C
1010:	BNEF	$0D81
1013:	LEA	T2, $25ab
1017:	MOV	2(SP), T2
101a:	MOVUB	ACCU, inputstring + 1
101e:	MOV	4(SP), ACCU
1021:	JUMPF	$0DB4
1024:	MOVB	ACCU, T3
1026:	CMPUB	ACCU, #$0064
1028:	BNE	$103B
102a:	LEA	T2, $2652
102e:	MOV	2(SP), T2
1031:	MOVUB	ACCU, inputstring + 1
1035:	MOV	4(SP), ACCU
1038:	JUMPF	$0DB4
103b:	BLE	$10B4
103d:	MOVB	ACCU, T3
103f:	CMPUB	ACCU, #$0062
1041:	BNE	$1054
1043:	LEA	T2, $263d
1047:	MOV	2(SP), T2
104a:	MOVUB	ACCU, inputstring + 1
104e:	MOV	4(SP), ACCU
1051:	JUMPF	$0DB4
1054:	BLE	$109C
1056:	MOVB	ACCU, T3
1058:	CMPUB	ACCU, #$005F
105a:	BNE	$106D
105c:	LEA	T2, $25f3
1060:	MOV	2(SP), T2
1063:	MOVUB	ACCU, inputstring + 1
1067:	MOV	4(SP), ACCU
106a:	JUMPF	$0DB4
106d:	MOVB	ACCU, T3
106f:	CMPUB	ACCU, #$0060
1071:	BNE	$1084
1073:	LEA	T2, $262b
1077:	MOV	2(SP), T2
107a:	MOVUB	ACCU, inputstring + 1
107e:	MOV	4(SP), ACCU
1081:	JUMPF	$0DB4
1084:	MOVB	ACCU, T3
1086:	CMPUB	ACCU, #$0061
1088:	BNEF	$0D81
108b:	LEA	T2, $2633
108f:	MOV	2(SP), T2
1092:	MOVUB	ACCU, inputstring + 1
1096:	MOV	4(SP), ACCU
1099:	JUMPF	$0DB4
109c:	MOVB	ACCU, T3
109e:	CMPUB	ACCU, #$0063
10a0:	BNEF	$0D81
10a3:	LEA	T2, $2647
10a7:	MOV	2(SP), T2
10aa:	MOVUB	ACCU, inputstring + 1
10ae:	MOV	4(SP), ACCU
10b1:	JUMPF	$0DB4
10b4:	MOVB	ACCU, T3
10b6:	CMPUB	ACCU, #$0065
10b8:	BNE	$10CB
10ba:	LEA	T2, $265c
10be:	MOV	2(SP), T2
10c1:	MOVUB	ACCU, inputstring + 1
10c5:	MOV	4(SP), ACCU
10c8:	JUMPF	$0DB4
10cb:	MOVB	ACCU, T3
10cd:	CMPUB	ACCU, #$0066
10cf:	BNE	$10E2
10d1:	LEA	T2, $2662
10d5:	MOV	2(SP), T2
10d8:	MOVUB	ACCU, inputstring + 1
10dc:	MOV	4(SP), ACCU
10df:	JUMPF	$0DB4
10e2:	MOVB	ACCU, T3
10e4:	CMPUB	ACCU, #$0067
10e6:	BNE	$10F9
10e8:	LEA	T2, $266a
10ec:	MOV	2(SP), T2
10ef:	MOVUB	ACCU, inputstring + 1
10f3:	MOV	4(SP), ACCU
10f6:	JUMPF	$0DB4
10f9:	MOVB	ACCU, T3
10fb:	CMPUB	ACCU, #$0068
10fd:	BNEF	$0D81
1100:	LEA	T2, $2674
1104:	MOV	2(SP), T2
1107:	MOVUB	ACCU, inputstring + 1
110b:	MOV	4(SP), ACCU
110e:	JUMPF	$0DB4
1111:	LEA	T2, $25d9
1115:	MOV	2(SP), T2
1118:	JUMPF	$0DB4
111b:	MOVB	ACCU, T3
111d:	CMPUB	ACCU, #$00A2
111f:	BNE	$1132
1121:	LEA	T2, $273a
1125:	MOV	2(SP), T2
1128:	MOVUB	ACCU, inputstring + 1
112c:	MOV	4(SP), ACCU
112f:	JUMPF	$0DB4
1132:	BLEF	$1341
1135:	MOVB	ACCU, T3
1137:	CMPUB	ACCU, #$0075
1139:	BNE	$114C
113b:	LEA	T2, $26d8
113f:	MOV	2(SP), T2
1142:	MOVUB	ACCU, inputstring + 1
1146:	MOV	4(SP), ACCU
1149:	JUMPF	$0DB4
114c:	BLEF	$1254
114f:	MOVB	ACCU, T3
1151:	CMPUB	ACCU, #$0070
1153:	BNE	$1166
1155:	LEA	T2, $26ad
1159:	MOV	2(SP), T2
115c:	MOVUB	ACCU, inputstring + 1
1160:	MOV	4(SP), ACCU
1163:	JUMPF	$0DB4
1166:	BLEF	$11F7
1169:	MOVB	ACCU, T3
116b:	CMPUB	ACCU, #$006D
116d:	BNE	$1180
116f:	LEA	T2, $269a
1173:	MOV	2(SP), T2
1176:	MOVUB	ACCU, inputstring + 1
117a:	MOV	4(SP), ACCU
117d:	JUMPF	$0DB4
1180:	BLE	$11C8
1182:	MOVB	ACCU, T3
1184:	CMPUB	ACCU, #$006A
1186:	BNE	$1199
1188:	LEA	T2, $2681
118c:	MOV	2(SP), T2
118f:	MOVUB	ACCU, inputstring + 1
1193:	MOV	4(SP), ACCU
1196:	JUMPF	$0DB4
1199:	MOVB	ACCU, T3
119b:	CMPUB	ACCU, #$006B
119d:	BNE	$11B0
119f:	LEA	T2, $2689
11a3:	MOV	2(SP), T2
11a6:	MOVUB	ACCU, inputstring + 1
11aa:	MOV	4(SP), ACCU
11ad:	JUMPF	$0DB4
11b0:	MOVB	ACCU, T3
11b2:	CMPUB	ACCU, #$006C
11b4:	BNEF	$0D81
11b7:	LEA	T2, $2691
11bb:	MOV	2(SP), T2
11be:	MOVUB	ACCU, inputstring + 1
11c2:	MOV	4(SP), ACCU
11c5:	JUMPF	$0DB4
11c8:	MOVB	ACCU, T3
11ca:	CMPUB	ACCU, #$006E
11cc:	BNE	$11DF
11ce:	LEA	T2, $26a0
11d2:	MOV	2(SP), T2
11d5:	MOVUB	ACCU, inputstring + 1
11d9:	MOV	4(SP), ACCU
11dc:	JUMPF	$0DB4
11df:	MOVB	ACCU, T3
11e1:	CMPUB	ACCU, #$006F
11e3:	BNEF	$0D81
11e6:	LEA	T2, $26a6
11ea:	MOV	2(SP), T2
11ed:	MOVUB	ACCU, inputstring + 1
11f1:	MOV	4(SP), ACCU
11f4:	JUMPF	$0DB4
11f7:	MOVB	ACCU, T3
11f9:	CMPUB	ACCU, #$0071
11fb:	BNE	$120E
11fd:	LEA	T2, $26b5
1201:	MOV	2(SP), T2
1204:	MOVUB	ACCU, inputstring + 1
1208:	MOV	4(SP), ACCU
120b:	JUMPF	$0DB4
120e:	MOVB	ACCU, T3
1210:	CMPUB	ACCU, #$0072
1212:	BNE	$1225
1214:	LEA	T2, $26bf
1218:	MOV	2(SP), T2
121b:	MOVUB	ACCU, inputstring + 1
121f:	MOV	4(SP), ACCU
1222:	JUMPF	$0DB4
1225:	MOVB	ACCU, T3
1227:	CMPUB	ACCU, #$0073
1229:	BNE	$123C
122b:	LEA	T2, $26c6
122f:	MOV	2(SP), T2
1232:	MOVUB	ACCU, inputstring + 1
1236:	MOV	4(SP), ACCU
1239:	JUMPF	$0DB4
123c:	MOVB	ACCU, T3
123e:	CMPUB	ACCU, #$0074
1240:	BNEF	$0D81
1243:	LEA	T2, $26d0
1247:	MOV	2(SP), T2
124a:	MOVUB	ACCU, inputstring + 1
124e:	MOV	4(SP), ACCU
1251:	JUMPF	$0DB4
1254:	MOVB	ACCU, T3
1256:	CMPUB	ACCU, #$007C
1258:	BNE	$126B
125a:	LEA	T2, $270f
125e:	MOV	2(SP), T2
1261:	MOVUB	ACCU, inputstring + 1
1265:	MOV	4(SP), ACCU
1268:	JUMPF	$0DB4
126b:	BLE	$12E4
126d:	MOVB	ACCU, T3
126f:	CMPUB	ACCU, #$007A
1271:	BNE	$1284
1273:	LEA	T2, $2700
1277:	MOV	2(SP), T2
127a:	MOVUB	ACCU, inputstring + 1
127e:	MOV	4(SP), ACCU
1281:	JUMPF	$0DB4
1284:	BLE	$12CC
1286:	MOVB	ACCU, T3
1288:	CMPUB	ACCU, #$0076
128a:	BNE	$129D
128c:	LEA	T2, $26e2
1290:	MOV	2(SP), T2
1293:	MOVUB	ACCU, inputstring + 1
1297:	MOV	4(SP), ACCU
129a:	JUMPF	$0DB4
129d:	MOVB	ACCU, T3
129f:	CMPUB	ACCU, #$0077
12a1:	BNE	$12B4
12a3:	LEA	T2, $26eb
12a7:	MOV	2(SP), T2
12aa:	MOVUB	ACCU, inputstring + 1
12ae:	MOV	4(SP), ACCU
12b1:	JUMPF	$0DB4
12b4:	MOVB	ACCU, T3
12b6:	CMPUB	ACCU, #$0078
12b8:	BNEF	$0D81
12bb:	LEA	T2, $26f3
12bf:	MOV	2(SP), T2
12c2:	MOVUB	ACCU, inputstring + 1
12c6:	MOV	4(SP), ACCU
12c9:	JUMPF	$0DB4
12cc:	MOVB	ACCU, T3
12ce:	CMPUB	ACCU, #$007B
12d0:	BNEF	$0D81
12d3:	LEA	T2, $2706
12d7:	MOV	2(SP), T2
12da:	MOVUB	ACCU, inputstring + 1
12de:	MOV	4(SP), ACCU
12e1:	JUMPF	$0DB4
12e4:	MOVB	ACCU, T3
12e6:	CMPUB	ACCU, #$007D
12e8:	BNE	$12FB
12ea:	LEA	T2, $2715
12ee:	MOV	2(SP), T2
12f1:	MOVUB	ACCU, inputstring + 1
12f5:	MOV	4(SP), ACCU
12f8:	JUMPF	$0DB4
12fb:	MOVB	ACCU, T3
12fd:	CMPUB	ACCU, #$007E
12ff:	BNE	$1312
1301:	LEA	T2, $271d
1305:	MOV	2(SP), T2
1308:	MOVUB	ACCU, inputstring + 1
130c:	MOV	4(SP), ACCU
130f:	JUMPF	$0DB4
1312:	MOVB	ACCU, T3
1314:	CMPUB	ACCU, #$009F
1316:	BNE	$1329
1318:	LEA	T2, $2729
131c:	MOV	2(SP), T2
131f:	MOVUB	ACCU, inputstring + 1
1323:	MOV	4(SP), ACCU
1326:	JUMPF	$0DB4
1329:	MOVB	ACCU, T3
132b:	CMPUB	ACCU, #$00A1
132d:	BNEF	$0D81
1330:	LEA	T2, $2731
1334:	MOV	2(SP), T2
1337:	MOVUB	ACCU, inputstring + 1
133b:	MOV	4(SP), ACCU
133e:	JUMPF	$0DB4
1341:	MOVB	ACCU, T3
1343:	CMPUB	ACCU, #$00AE
1345:	BNE	$1358
1347:	LEA	T2, $2791
134b:	MOV	2(SP), T2
134e:	MOVUB	ACCU, inputstring + 1
1352:	MOV	4(SP), ACCU
1355:	JUMPF	$0DB4
1358:	BLEF	$1460
135b:	MOVB	ACCU, T3
135d:	CMPUB	ACCU, #$00A9
135f:	BNE	$1372
1361:	LEA	T2, $276b
1365:	MOV	2(SP), T2
1368:	MOVUB	ACCU, inputstring + 1
136c:	MOV	4(SP), ACCU
136f:	JUMPF	$0DB4
1372:	BLEF	$1403
1375:	MOVB	ACCU, T3
1377:	CMPUB	ACCU, #$00A6
1379:	BNE	$138C
137b:	LEA	T2, $2752
137f:	MOV	2(SP), T2
1382:	MOVUB	ACCU, inputstring + 1
1386:	MOV	4(SP), ACCU
1389:	JUMPF	$0DB4
138c:	BLE	$13D4
138e:	MOVB	ACCU, T3
1390:	CMPUB	ACCU, #$00A3
1392:	BNE	$13A5
1394:	LEA	T2, $2741
1398:	MOV	2(SP), T2
139b:	MOVUB	ACCU, inputstring + 1
139f:	MOV	4(SP), ACCU
13a2:	JUMPF	$0DB4
13a5:	MOVB	ACCU, T3
13a7:	CMPUB	ACCU, #$00A4
13a9:	BNE	$13BC
13ab:	LEA	T2, $2747
13af:	MOV	2(SP), T2
13b2:	MOVUB	ACCU, inputstring + 1
13b6:	MOV	4(SP), ACCU
13b9:	JUMPF	$0DB4
13bc:	MOVB	ACCU, T3
13be:	CMPUB	ACCU, #$00A5
13c0:	BNEF	$0D81
13c3:	LEA	T2, $274c
13c7:	MOV	2(SP), T2
13ca:	MOVUB	ACCU, inputstring + 1
13ce:	MOV	4(SP), ACCU
13d1:	JUMPF	$0DB4
13d4:	MOVB	ACCU, T3
13d6:	CMPUB	ACCU, #$00A7
13d8:	BNE	$13EB
13da:	LEA	T2, $275b
13de:	MOV	2(SP), T2
13e1:	MOVUB	ACCU, inputstring + 1
13e5:	MOV	4(SP), ACCU
13e8:	JUMPF	$0DB4
13eb:	MOVB	ACCU, T3
13ed:	CMPUB	ACCU, #$00A8
13ef:	BNEF	$0D81
13f2:	LEA	T2, $2764
13f6:	MOV	2(SP), T2
13f9:	MOVUB	ACCU, inputstring + 1
13fd:	MOV	4(SP), ACCU
1400:	JUMPF	$0DB4
1403:	MOVB	ACCU, T3
1405:	CMPUB	ACCU, #$00AA
1407:	BNE	$141A
1409:	LEA	T2, $2773
140d:	MOV	2(SP), T2
1410:	MOVUB	ACCU, inputstring + 1
1414:	MOV	4(SP), ACCU
1417:	JUMPF	$0DB4
141a:	MOVB	ACCU, T3
141c:	CMPUB	ACCU, #$00AB
141e:	BNE	$1431
1420:	LEA	T2, $277d
1424:	MOV	2(SP), T2
1427:	MOVUB	ACCU, inputstring + 1
142b:	MOV	4(SP), ACCU
142e:	JUMPF	$0DB4
1431:	MOVB	ACCU, T3
1433:	CMPUB	ACCU, #$00AC
1435:	BNE	$1448
1437:	LEA	T2, $2785
143b:	MOV	2(SP), T2
143e:	MOVUB	ACCU, inputstring + 1
1442:	MOV	4(SP), ACCU
1445:	JUMPF	$0DB4
1448:	MOVB	ACCU, T3
144a:	CMPUB	ACCU, #$00AD
144c:	BNEF	$0D81
144f:	LEA	T2, $278c
1453:	MOV	2(SP), T2
1456:	MOVUB	ACCU, inputstring + 1
145a:	MOV	4(SP), ACCU
145d:	JUMPF	$0DB4
1460:	MOVB	ACCU, T3
1462:	CMPUB	ACCU, #$00B4
1464:	BNE	$1477
1466:	LEA	T2, $27ba
146a:	MOV	2(SP), T2
146d:	MOVUB	ACCU, inputstring + 1
1471:	MOV	4(SP), ACCU
1474:	JUMPF	$0DB4
1477:	BLE	$14F0
1479:	MOVB	ACCU, T3
147b:	CMPUB	ACCU, #$00B2
147d:	BNE	$1490
147f:	LEA	T2, $27ad
1483:	MOV	2(SP), T2
1486:	MOVUB	ACCU, inputstring + 1
148a:	MOV	4(SP), ACCU
148d:	JUMPF	$0DB4
1490:	BLE	$14D8
1492:	MOVB	ACCU, T3
1494:	CMPUB	ACCU, #$00AF
1496:	BNE	$14A9
1498:	LEA	T2, $279b
149c:	MOV	2(SP), T2
149f:	MOVUB	ACCU, inputstring + 1
14a3:	MOV	4(SP), ACCU
14a6:	JUMPF	$0DB4
14a9:	MOVB	ACCU, T3
14ab:	CMPUB	ACCU, #$00B0
14ad:	BNE	$14C0
14af:	LEA	T2, $27a1
14b3:	MOV	2(SP), T2
14b6:	MOVUB	ACCU, inputstring + 1
14ba:	MOV	4(SP), ACCU
14bd:	JUMPF	$0DB4
14c0:	MOVB	ACCU, T3
14c2:	CMPUB	ACCU, #$00B1
14c4:	BNEF	$0D81
14c7:	LEA	T2, $27a8
14cb:	MOV	2(SP), T2
14ce:	MOVUB	ACCU, inputstring + 1
14d2:	MOV	4(SP), ACCU
14d5:	JUMPF	$0DB4
14d8:	MOVB	ACCU, T3
14da:	CMPUB	ACCU, #$00B3
14dc:	BNEF	$0D81
14df:	LEA	T2, $27b5
14e3:	MOV	2(SP), T2
14e6:	MOVUB	ACCU, inputstring + 1
14ea:	MOV	4(SP), ACCU
14ed:	JUMPF	$0DB4
14f0:	MOVB	ACCU, T3
14f2:	CMPUB	ACCU, #$00B5
14f4:	BNE	$1507
14f6:	LEA	T2, $27c1
14fa:	MOV	2(SP), T2
14fd:	MOVUB	ACCU, inputstring + 1
1501:	MOV	4(SP), ACCU
1504:	JUMPF	$0DB4
1507:	MOVB	ACCU, T3
1509:	CMPUB	ACCU, #$00B6
150b:	BNE	$151E
150d:	LEA	T2, $27c8
1511:	MOV	2(SP), T2
1514:	MOVUB	ACCU, inputstring + 1
1518:	MOV	4(SP), ACCU
151b:	JUMPF	$0DB4
151e:	MOVB	ACCU, T3
1520:	CMPUB	ACCU, #$00DF
1522:	BNEF	$0D81
1525:	LEA	T2, $2721
1529:	MOV	2(SP), T2
152c:	MOVUB	ACCU, inputstring + 1
1530:	MOV	4(SP), ACCU
1533:	JUMPF	$0DB4
1536:	LEA	T2, $267b
153a:	MOV	2(SP), T2
153d:	MOVUB	ACCU, inputstring + 1
1541:	MOV	4(SP), ACCU
1544:	JUMPF	$0DB4
--------------------------------------------------------------------
malloc:
1547:	ENTER	0, 2
154b:	MOV	ACCU, P0
154d:	MOV	T0, ACCU
154f:	ADD	T0, #$0007
1553:	ANDB	T0, #$00FC
1556:	MOV	ACCU, T0
1558:	MOV	P0, ACCU
155a:	MOVUB	ACCU, freeHeapInit + 0
155e:	BNE	$1581
1560:	LEA	T2, $45c9
1564:	MOV	freeHeap + 0, T2
1568:	LEA	T3, $0000
156c:	MOV	$45cb, T3
1570:	LEA	ACCU, $9000
1574:	SUB	ACCU, T2
1576:	MOV	$45c9, ACCU
157a:	MOV	ACCU, #1
157d:	MOVB	freeHeapInit + 0, ACCU
1581:	MOV	T2, freeHeap + 0
1585:	MOV	ACCU, T2
1587:	BNE	$1591
1589:	LEA	ACCU, $0000
158d:	RETURN	0, 2
1591:	MOV	ACCU, T0
1593:	MOV	T3, ACCU
1595:	LEA	T0, $0000
1599:	MOV	ADDR, T2
159b:	MOV	T4, 0(ADDR)
159e:	MOV	ACCU, T4
15a0:	CMPU	ACCU, T3
15a2:	BGT	$1606
15a4:	BNE	$15C6
15a6:	MOV	T3, 2(ADDR)
15a9:	MOV	ACCU, T0
15ab:	BNE	$15B9
15ad:	MOV	freeHeap + 0, T3
15b1:	MOV	ACCU, T2
15b3:	ADD	ACCU, #$0002
15b7:	JUMP	$158D
15b9:	MOV	ADDR, T0
15bb:	MOV	2(ADDR), T3
15be:	MOV	ACCU, T2
15c0:	ADD	ACCU, #$0002
15c4:	JUMP	$158D
15c6:	MOV	ACCU, T2
15c8:	ADD	ACCU, T3
15ca:	MOV	T5, ACCU
15cc:	MOV	ACCU, T4
15ce:	SUB	ACCU, T3
15d0:	MOV	ADDR, T5
15d2:	MOV	0(ADDR), ACCU
15d5:	MOV	ADDR, T2
15d7:	MOV	T4, 2(ADDR)
15da:	MOV	ADDR, T5
15dc:	MOV	2(ADDR), T4
15df:	MOV	ACCU, T0
15e1:	BNE	$15F4
15e3:	MOV	freeHeap + 0, T5
15e7:	MOV	ADDR, T2
15e9:	MOV	0(ADDR), T3
15ec:	MOV	ACCU, T2
15ee:	ADD	ACCU, #$0002
15f2:	JUMP	$158D
15f4:	MOV	ADDR, T2
15f6:	MOV	0(ADDR), T3
15f9:	MOV	ADDR, T0
15fb:	MOV	2(ADDR), T5
15fe:	MOV	ACCU, T2
1600:	ADD	ACCU, #$0002
1604:	JUMP	$158D
1606:	MOV	ACCU, T2
1608:	MOV	T2, 2(ADDR)
160b:	MOV	T0, ACCU
160d:	MOV	ACCU, T2
160f:	BNE	$1599
1611:	JUMPF	$1589
--------------------------------------------------------------------
freeHeapInit:
3509 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
freeHeap:
4545 : __ __ __ BSS	2
--------------------------------------------------------------------
spaces:
4547 : __ __ __ BSS	41
--------------------------------------------------------------------
1614 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
1624 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
1634 : __ __ __ BYT 20 20 20 20 20 20 20 20 00                      :         .
--------------------------------------------------------------------
xpos:
4570 : __ __ __ BSS	2
--------------------------------------------------------------------
ypos:
4572 : __ __ __ BSS	2
--------------------------------------------------------------------
memcpy:
163d : ea __ __ NOP
163e : a6 12 __ LDX P5
1640 : f0 10 __ BEQ $1652
1642 : a0 00 __ LDY #$00
1644 : b1 0f __ LDA (P2),y
1646 : 91 0d __ STA (P0),y
1648 : c8 __ __ INY
1649 : d0 f9 __ BNE $1644
164b : e6 10 __ INC P3
164d : e6 0e __ INC P1
164f : ca __ __ DEX
1650 : d0 f2 __ BNE $1644
1652 : a4 11 __ LDY P4
1654 : f0 0e __ BEQ $1664
1656 : 88 __ __ DEY
1657 : f0 07 __ BEQ $1660
1659 : b1 0f __ LDA (P2),y
165b : 91 0d __ STA (P0),y
165d : 88 __ __ DEY
165e : d0 f9 __ BNE $1659
1660 : b1 0f __ LDA (P2),y
1662 : 91 0d __ STA (P0),y
1664 : a5 0d __ LDA P0
1666 : 85 1b __ STA ACCU + 0
1668 : a5 0e __ LDA P1
166a : 85 1c __ STA ACCU + 1
166c : 60 __ __ RTS
--------------------------------------------------------------------
data:
350a : __ __ __ BYT 3c 66 6e 6e 60 62 3c 00 18 3c 66 7e 66 66 66 00 : <fnn`b<..<f~fff.
351a : __ __ __ BYT 7c 66 66 7c 66 66 7c 00 3c 66 60 60 60 66 3c 00 : |ff|ff|.<f```f<.
352a : __ __ __ BYT 78 6c 66 66 66 6c 78 00 7e 60 60 78 60 60 7e 00 : xlffflx.~``x``~.
353a : __ __ __ BYT 7e 60 60 78 60 60 60 00 3c 66 60 6e 66 66 3c 00 : ~``x```.<f`nff<.
354a : __ __ __ BYT 66 66 66 7e 66 66 66 00 3c 18 18 18 18 18 3c 00 : fff~fff.<.....<.
355a : __ __ __ BYT 1e 0c 0c 0c 0c 6c 38 00 66 6c 78 70 78 6c 66 00 : .....l8.flxpxlf.
356a : __ __ __ BYT 60 60 60 60 60 60 7e 00 63 77 7f 6b 63 63 63 00 : ``````~.cw.kccc.
357a : __ __ __ BYT 66 76 7e 7e 6e 66 66 00 3c 66 66 66 66 66 3c 00 : fv~~nff.<fffff<.
358a : __ __ __ BYT 7c 66 66 7c 60 60 60 00 3c 66 66 66 66 3c 0e 00 : |ff|```.<ffff<..
359a : __ __ __ BYT 7c 66 66 7c 78 6c 66 00 3c 66 60 3c 06 66 3c 00 : |ff|xlf.<f`<.f<.
35aa : __ __ __ BYT 7e 18 18 18 18 18 18 00 66 66 66 66 66 66 3c 00 : ~.......ffffff<.
35ba : __ __ __ BYT 66 66 66 66 66 3c 18 00 63 63 63 6b 7f 77 63 00 : fffff<..ccck.wc.
35ca : __ __ __ BYT 66 66 3c 18 3c 66 66 00 66 66 66 3c 18 18 18 00 : ff<.<ff.fff<....
35da : __ __ __ BYT 7e 06 0c 18 30 60 7e 00 38 60 28 68 f8 a8 f8 00 : ~...0`~.8`(h....
35ea : __ __ __ BYT 20 20 f8 80 b8 80 b8 00 f8 c0 e8 e8 b8 a8 a8 00 :   ..............
35fa : __ __ __ BYT 00 18 3c 7e 18 18 18 18 f8 80 b8 80 80 80 80 f8 : ..<~............
360a : __ __ __ BYT 00 00 00 00 00 00 00 00 38 20 20 20 20 20 e0 00 : ........8     ..
361a : __ __ __ BYT 66 66 66 00 00 00 00 00 f8 c0 80 40 b8 88 88 00 : fff........@....
362a : __ __ __ BYT b8 b0 f8 40 b8 80 e0 00 38 20 a8 88 a8 20 e0 00 : ...@....8 ... ..
363a : __ __ __ BYT 3c 66 3c 38 67 66 3f 00 f8 68 38 60 b8 88 e8 00 : <f<8gf?..h8`....
364a : __ __ __ BYT 0c 18 30 30 30 18 0c 00 30 18 0c 0c 0c 18 30 00 : ..000...0.....0.
365a : __ __ __ BYT f8 08 a8 e8 a8 80 f8 00 b8 80 a0 f0 a0 80 b8 00 : ................
366a : __ __ __ BYT 00 00 00 00 00 18 18 30 f8 50 80 80 f8 80 80 00 : .......0.P......
367a : __ __ __ BYT 38 08 08 40 80 80 e0 00 38 20 a8 88 a8 20 e0 00 : 8..@....8 ... ..
368a : __ __ __ BYT 10 10 7c 44 7c 10 10 00 f8 80 80 80 80 80 80 00 : ..|D|...........
369a : __ __ __ BYT e0 20 a0 80 b8 80 e0 00 f8 80 f8 80 b8 80 80 00 : . ..............
36aa : __ __ __ BYT b8 80 e0 80 e0 80 e0 00 e8 e8 a8 80 e0 20 f8 00 : ............. ..
36ba : __ __ __ BYT 08 58 e8 20 e0 a0 e0 00 e8 38 28 40 80 80 80 00 : .X. .....8(@....
36ca : __ __ __ BYT b8 c0 e0 a0 fc a0 fc 00 08 48 a8 a8 f8 20 e0 00 : .........H... ..
36da : __ __ __ BYT 00 00 18 00 00 18 00 00 00 00 18 00 00 18 18 30 : ...............0
36ea : __ __ __ BYT 0e 18 30 60 30 18 0e 00 38 20 f8 20 f8 20 e0 00 : ..0`0...8 . . ..
36fa : __ __ __ BYT a0 e0 a8 08 08 e8 28 f8 28 78 38 60 e8 88 88 00 : ......(.(x8`....
370a : __ __ __ BYT 28 78 e8 40 08 08 08 00 a8 f8 a8 60 e8 28 e8 00 : (x.@.......`.(..
371a : __ __ __ BYT e0 70 28 68 f8 08 f8 00 f8 60 e8 a8 a8 e0 a0 b8 : .p(h.....`......
372a : __ __ __ BYT b8 d0 88 48 28 28 f8 00 88 d8 e8 e0 b8 a8 b8 00 : ...H((..........
373a : __ __ __ BYT f8 f0 f8 48 38 28 28 00 88 d8 f8 60 e8 08 38 00 : ...H8((....`..8.
374a : __ __ __ BYT 88 d8 e8 08 88 80 b8 00 08 58 e8 e0 f8 08 e8 00 : .........X......
375a : __ __ __ BYT 80 d0 b8 48 b8 a8 f8 00 a0 f0 e8 48 f8 a8 a8 00 : ...H.......H....
376a : __ __ __ BYT e8 58 a8 e8 a8 08 00 00 e8 78 38 48 38 28 e8 00 : .X.......x8H8(..
377a : __ __ __ BYT f8 40 38 68 28 28 28 00 38 50 38 20 38 20 e0 00 : .@8h(((.8P8 8 ..
378a : __ __ __ BYT e8 98 88 c0 80 80 e0 00 e0 d0 e0 a0 e8 a8 a8 00 : ................
379a : __ __ __ BYT 80 c0 f8 88 e8 20 e0 00 38 40 80 80 80 80 b8 00 : ..... ..8@......
37aa : __ __ __ BYT 38 50 e0 20 e0 80 80 00 e0 20 38 20 e0 80 b8 00 : 8P. ..... 8 ....
37ba : __ __ __ BYT a0 e0 b8 c0 b8 08 e8 00 38 40 80 80 e0 20 e0 00 : ........8@... ..
37ca : __ __ __ BYT f8 20 20 20 a0 80 80 00 06 06 06 06 06 06 06 06 : .   ............
37da : __ __ __ BYT e0 90 b8 c0 e8 a8 e8 00 b8 e0 a0 40 88 88 e8 00 : ...........@....
37ea : __ __ __ BYT 38 40 20 20 e8 08 f8 00 28 68 e8 28 f8 20 38 00 : 8@  ....(h.(. 8.
37fa : __ __ __ BYT 38 50 f8 80 88 88 88 00 a0 e0 a0 80 f8 88 b8 00 : 8P..............
380a : __ __ __ BYT 00 00 00 00 00 00 00 00 38 70 20 40 38 28 f8 00 : ........8p @8(..
381a : __ __ __ BYT f8 70 20 40 e8 88 f8 00 88 d8 88 c0 f8 08 08 00 : .p @............
382a : __ __ __ BYT f8 50 80 c0 e8 08 38 00 e0 f0 a0 e0 f8 08 08 00 : .P....8.........
383a : __ __ __ BYT f8 d0 b8 c0 88 08 e8 00 f8 f0 a0 60 f8 a8 a8 00 : ...........`....
384a : __ __ __ BYT f8 58 e8 40 38 08 38 00 a0 f0 e0 c0 a8 a8 f8 00 : .X.@8.8.........
385a : __ __ __ BYT f8 a8 f8 e8 f8 a8 f8 00 38 50 20 60 f8 28 28 00 : ........8P `.((.
386a : __ __ __ BYT e0 70 20 40 10 10 10 00 b8 80 b8 20 e0 80 80 00 : .p @....... ....
387a : __ __ __ BYT a8 f8 f8 20 f8 20 20 00 e0 60 20 40 f8 20 38 00 : ... .  ..` @. 8.
388a : __ __ __ BYT 20 60 e0 40 b8 a0 a0 00 f8 e0 b8 40 e0 a0 b8 00 :  `.@.......@....
389a : __ __ __ BYT 08 58 f8 e8 a8 a0 a0 00 b8 e8 f8 c8 88 08 f8 00 : .X..............
38aa : __ __ __ BYT e0 40 38 40 e0 80 e0 00 e0 40 38 40 38 20 f8 00 : .@8@.....@8@8 ..
38ba : __ __ __ BYT e0 c0 80 40 f8 80 e0 00 ff ff 00 00 00 00 00 00 : ...@............
38ca : __ __ __ BYT ff ff ff 00 00 00 00 00 00 00 00 00 00 ff ff ff : ................
38da : __ __ __ BYT 03 03 03 03 03 03 ff ff 00 00 00 00 f0 f0 f0 f0 : ................
38ea : __ __ __ BYT 0f 0f 0f 0f 00 00 00 00 18 18 18 f8 f8 00 00 00 : ................
38fa : __ __ __ BYT f0 f0 f0 f0 00 00 00 00 f0 f0 f0 f0 0f 0f 0f 0f : ................
390a : __ __ __ BYT c3 99 91 91 9f 99 c3 ff e7 c3 99 81 99 99 99 ff : ................
391a : __ __ __ BYT 83 99 99 83 99 99 83 ff c3 99 9f 9f 9f 99 c3 ff : ................
392a : __ __ __ BYT 87 93 99 99 99 93 87 ff 81 9f 9f 87 9f 9f 81 ff : ................
393a : __ __ __ BYT 81 9f 9f 87 9f 9f 9f ff c3 99 9f 91 99 99 c3 ff : ................
394a : __ __ __ BYT 99 99 99 81 99 99 99 ff c3 e7 e7 e7 e7 e7 c3 ff : ................
395a : __ __ __ BYT e1 f3 f3 f3 f3 93 c7 ff 99 93 87 8f 87 93 99 ff : ................
396a : __ __ __ BYT 9f 9f 9f 9f 9f 9f 81 ff 9c 88 80 94 9c 9c 9c ff : ................
397a : __ __ __ BYT 99 89 81 81 91 99 99 ff c3 99 99 99 99 99 c3 ff : ................
398a : __ __ __ BYT 83 99 99 83 9f 9f 9f ff c3 99 99 99 99 c3 f1 ff : ................
399a : __ __ __ BYT 83 99 99 83 87 93 99 ff c3 99 9f c3 f9 99 c3 ff : ................
39aa : __ __ __ BYT 81 e7 e7 e7 e7 e7 e7 ff 99 99 99 99 99 99 c3 ff : ................
39ba : __ __ __ BYT 99 99 99 99 99 c3 e7 ff 9c 9c 9c 94 80 88 9c ff : ................
39ca : __ __ __ BYT 99 99 c3 e7 c3 99 99 ff 99 99 99 c3 e7 e7 e7 ff : ................
39da : __ __ __ BYT 81 f9 f3 e7 cf 9f 81 ff c3 cf cf cf cf cf c3 ff : ................
39ea : __ __ __ BYT f3 ed cf 83 cf 9d 03 ff c3 f3 f3 f3 f3 f3 c3 ff : ................
39fa : __ __ __ BYT ff e7 c3 81 e7 e7 e7 e7 ff ef cf 80 80 cf ef ff : ................
3a0a : __ __ __ BYT ff ff ff ff ff ff ff ff e7 e7 e7 e7 ff ff e7 ff : ................
3a1a : __ __ __ BYT 99 99 99 ff ff ff ff ff 99 99 00 99 00 99 99 ff : ................
3a2a : __ __ __ BYT e7 c1 9f c3 f9 83 e7 ff 9d 99 f3 e7 cf 99 b9 ff : ................
3a3a : __ __ __ BYT c3 99 c3 c7 98 99 c0 ff f9 f3 e7 ff ff ff ff ff : ................
3a4a : __ __ __ BYT f3 e7 cf cf cf e7 f3 ff cf e7 f3 f3 f3 e7 cf ff : ................
3a5a : __ __ __ BYT ff 99 c3 00 c3 99 ff ff ff e7 e7 81 e7 e7 ff ff : ................
3a6a : __ __ __ BYT ff ff ff ff ff e7 e7 cf ff ff ff 81 ff ff ff ff : ................
3a7a : __ __ __ BYT ff ff ff ff ff e7 e7 ff ff fc f9 f3 e7 cf 9f ff : ................
3a8a : __ __ __ BYT c3 99 91 89 99 99 c3 ff e7 e7 c7 e7 e7 e7 81 ff : ................
3a9a : __ __ __ BYT c3 99 f9 f3 cf 9f 81 ff c3 99 f9 e3 f9 99 c3 ff : ................
3aaa : __ __ __ BYT f9 f1 e1 99 80 f9 f9 ff 81 9f 83 f9 f9 99 c3 ff : ................
3aba : __ __ __ BYT c3 99 9f 83 99 99 c3 ff 81 99 f3 e7 e7 e7 e7 ff : ................
3aca : __ __ __ BYT c3 99 99 c3 99 99 c3 ff c3 99 99 c1 f9 99 c3 ff : ................
3ada : __ __ __ BYT ff ff e7 ff ff e7 ff ff ff ff e7 ff ff e7 e7 cf : ................
3aea : __ __ __ BYT f1 e7 cf 9f cf e7 f1 ff ff ff 81 ff 81 ff ff ff : ................
3afa : __ __ __ BYT 8f e7 f3 f9 f3 e7 8f ff c3 99 f9 f3 e7 ff e7 ff : ................
3b0a : __ __ __ BYT ff ff ff 00 00 ff ff ff f7 e3 c1 80 80 e3 c1 ff : ................
3b1a : __ __ __ BYT e7 e7 e7 e7 e7 e7 e7 e7 ff ff ff 00 00 ff ff ff : ................
3b2a : __ __ __ BYT ff ff 00 00 ff ff ff ff ff 00 00 ff ff ff ff ff : ................
3b3a : __ __ __ BYT ff ff ff ff 00 00 ff ff cf cf cf cf cf cf cf cf : ................
3b4a : __ __ __ BYT f3 f3 f3 f3 f3 f3 f3 f3 ff ff ff 1f 0f c7 e7 e7 : ................
3b5a : __ __ __ BYT e7 e7 e3 f0 f8 ff ff ff e7 e7 c7 0f 1f ff ff ff : ................
3b6a : __ __ __ BYT 3f 3f 3f 3f 3f 3f 00 00 3f 1f 8f c7 e3 f1 f8 fc : ??????..?.......
3b7a : __ __ __ BYT fc f8 f1 e3 c7 8f 1f 3f 00 00 3f 3f 3f 3f 3f 3f : .......?..??????
3b8a : __ __ __ BYT 00 00 fc fc fc fc fc fc ff c3 81 81 81 81 c3 ff : ................
3b9a : __ __ __ BYT ff ff ff ff ff 00 00 ff c9 80 80 80 c1 e3 f7 ff : ................
3baa : __ __ __ BYT 9f 9f 9f 9f 9f 9f 9f 9f ff ff ff f8 f0 e3 e7 e7 : ................
3bba : __ __ __ BYT 3c 18 81 c3 c3 81 18 3c ff c3 81 99 99 81 c3 ff : <......<........
3bca : __ __ __ BYT e7 e7 99 99 e7 e7 c3 ff f9 f9 f9 f9 f9 f9 f9 f9 : ................
3bda : __ __ __ BYT f7 e3 c1 80 c1 e3 f7 ff e7 e7 e7 00 00 e7 e7 e7 : ................
3bea : __ __ __ BYT 3f 3f cf cf 3f 3f cf cf e7 e7 e7 e7 e7 e7 e7 e7 : ??..??..........
3bfa : __ __ __ BYT ff ff fc c1 89 c9 c9 ff 00 80 c0 e0 f0 f8 fc fe : ................
3c0a : __ __ __ BYT ff ff ff ff ff ff ff ff 0f 0f 0f 0f 0f 0f 0f 0f : ................
3c1a : __ __ __ BYT ff ff ff ff 00 00 00 00 00 ff ff ff ff ff ff ff : ................
3c2a : __ __ __ BYT ff ff ff ff ff ff ff 00 3f 3f 3f 3f 3f 3f 3f 3f : ........????????
3c3a : __ __ __ BYT 33 33 cc cc 33 33 cc cc fc fc fc fc fc fc fc fc : 33..33..........
3c4a : __ __ __ BYT ff ff ff ff 33 33 cc cc 00 01 03 07 0f 1f 3f 7f : ....33........?.
3c5a : __ __ __ BYT fc fc fc fc fc fc fc fc e7 e7 e7 e0 e0 e7 e7 e7 : ................
3c6a : __ __ __ BYT ff ff ff ff f0 f0 f0 f0 e7 e7 e7 e0 e0 ff ff ff : ................
3c7a : __ __ __ BYT ff ff ff 07 07 e7 e7 e7 ff ff ff ff ff ff 00 00 : ................
3c8a : __ __ __ BYT ff ff ff e0 e0 e7 e7 e7 e7 e7 e7 00 00 ff ff ff : ................
3c9a : __ __ __ BYT ff ff ff 00 00 e7 e7 e7 e7 e7 e7 07 07 e7 e7 e7 : ................
3caa : __ __ __ BYT 3f 3f 3f 3f 3f 3f 3f 3f 1f 1f 1f 1f 1f 1f 1f 1f : ????????........
3cba : __ __ __ BYT f8 f8 f8 f8 f8 f8 f8 f8 00 00 ff ff ff ff ff ff : ................
3cca : __ __ __ BYT 00 00 00 ff ff ff ff ff ff ff ff ff ff 00 00 00 : ................
3cda : __ __ __ BYT fc fc fc fc fc fc 00 00 ff ff ff ff 0f 0f 0f 0f : ................
3cea : __ __ __ BYT f0 f0 f0 f0 ff ff ff ff e7 e7 e7 07 07 ff ff ff : ................
3cfa : __ __ __ BYT 0f 0f 0f 0f ff ff ff ff 0f 0f 0f 0f f0 f0 f0 f0 : ................
3d0a : __ __ __ BYT 3c 66 6e 6e 60 62 3c 00 00 00 3c 06 3e 66 3e 00 : <fnn`b<...<.>f>.
3d1a : __ __ __ BYT 00 60 60 7c 66 66 7c 00 00 00 3c 60 60 60 3c 00 : .``|ff|...<```<.
3d2a : __ __ __ BYT 00 06 06 3e 66 66 3e 00 00 00 3c 66 7e 60 3c 00 : ...>ff>...<f~`<.
3d3a : __ __ __ BYT 00 0e 18 3e 18 18 18 00 00 00 3e 66 66 3e 06 7c : ...>......>ff>.|
3d4a : __ __ __ BYT 00 60 60 7c 66 66 66 00 00 18 00 38 18 18 3c 00 : .``|fff....8..<.
3d5a : __ __ __ BYT 00 06 00 06 06 06 06 3c 00 60 60 6c 78 6c 66 00 : .......<.``lxlf.
3d6a : __ __ __ BYT 00 38 18 18 18 18 3c 00 00 00 66 7f 7f 6b 63 00 : .8....<...f..kc.
3d7a : __ __ __ BYT 00 00 7c 66 66 66 66 00 00 00 3c 66 66 66 3c 00 : ..|ffff...<fff<.
3d8a : __ __ __ BYT 00 00 7c 66 66 7c 60 60 00 00 3e 66 66 3e 06 06 : ..|ff|``..>ff>..
3d9a : __ __ __ BYT 00 00 7c 66 60 60 60 00 00 00 3e 60 3c 06 7c 00 : ..|f```...>`<.|.
3daa : __ __ __ BYT 00 18 7e 18 18 18 0e 00 00 00 66 66 66 66 3e 00 : ..~.......ffff>.
3dba : __ __ __ BYT 00 00 66 66 66 3c 18 00 00 00 63 6b 7f 3e 36 00 : ..fff<....ck.>6.
3dca : __ __ __ BYT 00 00 66 3c 18 3c 66 00 00 00 66 66 66 3e 0c 78 : ..f<.<f...fff>.x
3dda : __ __ __ BYT 00 00 7e 0c 18 30 7e 00 3c 30 30 30 30 30 3c 00 : ..~..0~.<00000<.
3dea : __ __ __ BYT 0c 12 30 7c 30 62 fc 00 3c 0c 0c 0c 0c 0c 3c 00 : ..0|0b..<.....<.
3dfa : __ __ __ BYT 00 18 3c 7e 18 18 18 18 00 10 30 7f 7f 30 10 00 : ..<~......0..0..
3e0a : __ __ __ BYT 00 00 00 00 00 00 00 00 18 18 18 18 00 00 18 00 : ................
3e1a : __ __ __ BYT 66 66 66 00 00 00 00 00 66 66 ff 66 ff 66 66 00 : fff.....ff.f.ff.
3e2a : __ __ __ BYT 18 3e 60 3c 06 7c 18 00 62 66 0c 18 30 66 46 00 : .>`<.|..bf..0fF.
3e3a : __ __ __ BYT 3c 66 3c 38 67 66 3f 00 06 0c 18 00 00 00 00 00 : <f<8gf?.........
3e4a : __ __ __ BYT 0c 18 30 30 30 18 0c 00 30 18 0c 0c 0c 18 30 00 : ..000...0.....0.
3e5a : __ __ __ BYT 00 66 3c ff 3c 66 00 00 00 18 18 7e 18 18 00 00 : .f<.<f.....~....
3e6a : __ __ __ BYT 00 00 00 00 00 18 18 30 00 00 00 7e 00 00 00 00 : .......0...~....
3e7a : __ __ __ BYT 00 00 00 00 00 18 18 00 00 03 06 0c 18 30 60 00 : .............0`.
3e8a : __ __ __ BYT 3c 66 6e 76 66 66 3c 00 18 18 38 18 18 18 7e 00 : <fnvff<...8...~.
3e9a : __ __ __ BYT 3c 66 06 0c 30 60 7e 00 3c 66 06 1c 06 66 3c 00 : <f..0`~.<f...f<.
3eaa : __ __ __ BYT 06 0e 1e 66 7f 06 06 00 7e 60 7c 06 06 66 3c 00 : ...f....~`|..f<.
3eba : __ __ __ BYT 3c 66 60 7c 66 66 3c 00 7e 66 0c 18 18 18 18 00 : <f`|ff<.~f......
3eca : __ __ __ BYT 3c 66 66 3c 66 66 3c 00 3c 66 66 3e 06 66 3c 00 : <ff<ff<.<ff>.f<.
3eda : __ __ __ BYT 00 00 18 00 00 18 00 00 00 00 18 00 00 18 18 30 : ...............0
3eea : __ __ __ BYT 0e 18 30 60 30 18 0e 00 00 00 7e 00 7e 00 00 00 : ..0`0.....~.~...
3efa : __ __ __ BYT 70 18 0c 06 0c 18 70 00 3c 66 06 0c 18 00 18 00 : p.....p.<f......
3f0a : __ __ __ BYT 00 00 00 ff ff 00 00 00 18 3c 66 7e 66 66 66 00 : .........<f~fff.
3f1a : __ __ __ BYT 7c 66 66 7c 66 66 7c 00 3c 66 60 60 60 66 3c 00 : |ff|ff|.<f```f<.
3f2a : __ __ __ BYT 78 6c 66 66 66 6c 78 00 7e 60 60 78 60 60 7e 00 : xlffflx.~``x``~.
3f3a : __ __ __ BYT 7e 60 60 78 60 60 60 00 3c 66 60 6e 66 66 3c 00 : ~``x```.<f`nff<.
3f4a : __ __ __ BYT 66 66 66 7e 66 66 66 00 3c 18 18 18 18 18 3c 00 : fff~fff.<.....<.
3f5a : __ __ __ BYT 1e 0c 0c 0c 0c 6c 38 00 66 6c 78 70 78 6c 66 00 : .....l8.flxpxlf.
3f6a : __ __ __ BYT 60 60 60 60 60 60 7e 00 63 77 7f 6b 63 63 63 00 : ``````~.cw.kccc.
3f7a : __ __ __ BYT 66 76 7e 7e 6e 66 66 00 3c 66 66 66 66 66 3c 00 : fv~~nff.<fffff<.
3f8a : __ __ __ BYT 7c 66 66 7c 60 60 60 00 3c 66 66 66 66 3c 0e 00 : |ff|```.<ffff<..
3f9a : __ __ __ BYT 7c 66 66 7c 78 6c 66 00 3c 66 60 3c 06 66 3c 00 : |ff|xlf.<f`<.f<.
3faa : __ __ __ BYT 7e 18 18 18 18 18 18 00 66 66 66 66 66 66 3c 00 : ~.......ffffff<.
3fba : __ __ __ BYT 66 66 66 66 66 3c 18 00 63 63 63 6b 7f 77 63 00 : fffff<..ccck.wc.
3fca : __ __ __ BYT 66 66 3c 18 3c 66 66 00 66 66 66 3c 18 18 18 00 : ff<.<ff.fff<....
3fda : __ __ __ BYT 7e 06 0c 18 30 60 7e 00 18 18 18 ff ff 18 18 18 : ~...0`~.........
3fea : __ __ __ BYT c0 c0 30 30 c0 c0 30 30 18 18 18 18 18 18 18 18 : ..00..00........
3ffa : __ __ __ BYT 33 33 cc cc 33 33 cc cc 33 99 cc 66 33 99 cc 66 : 33..33..3..f3..f
400a : __ __ __ BYT 00 00 00 00 00 00 00 00 f0 f0 f0 f0 f0 f0 f0 f0 : ................
401a : __ __ __ BYT 00 00 00 00 ff ff ff ff ff 00 00 00 00 00 00 00 : ................
402a : __ __ __ BYT 00 00 00 00 00 00 00 ff c0 c0 c0 c0 c0 c0 c0 c0 : ................
403a : __ __ __ BYT cc cc 33 33 cc cc 33 33 03 03 03 03 03 03 03 03 : ..33..33........
404a : __ __ __ BYT 00 00 00 00 cc cc 33 33 cc 99 33 66 cc 99 33 66 : ......33..3f..3f
405a : __ __ __ BYT 03 03 03 03 03 03 03 03 18 18 18 1f 1f 18 18 18 : ................
406a : __ __ __ BYT 00 00 00 00 0f 0f 0f 0f 18 18 18 1f 1f 00 00 00 : ................
407a : __ __ __ BYT 00 00 00 f8 f8 18 18 18 00 00 00 00 00 00 ff ff : ................
408a : __ __ __ BYT 00 00 00 1f 1f 18 18 18 18 18 18 ff ff 00 00 00 : ................
409a : __ __ __ BYT 00 00 00 ff ff 18 18 18 18 18 18 f8 f8 18 18 18 : ................
40aa : __ __ __ BYT c0 c0 c0 c0 c0 c0 c0 c0 e0 e0 e0 e0 e0 e0 e0 e0 : ................
40ba : __ __ __ BYT 07 07 07 07 07 07 07 07 ff ff 00 00 00 00 00 00 : ................
40ca : __ __ __ BYT ff ff ff 00 00 00 00 00 00 00 00 00 00 ff ff ff : ................
40da : __ __ __ BYT 01 03 06 6c 78 70 60 00 00 00 00 00 f0 f0 f0 f0 : ...lxp`.........
40ea : __ __ __ BYT 0f 0f 0f 0f 00 00 00 00 18 18 18 f8 f8 00 00 00 : ................
40fa : __ __ __ BYT f0 f0 f0 f0 00 00 00 00 f0 f0 f0 f0 0f 0f 0f 0f : ................
410a : __ __ __ BYT c3 99 91 91 9f 99 c3 ff ff ff c3 f9 c1 99 c1 ff : ................
411a : __ __ __ BYT ff 9f 9f 83 99 99 83 ff ff ff c3 9f 9f 9f c3 ff : ................
412a : __ __ __ BYT ff f9 f9 c1 99 99 c1 ff ff ff c3 99 81 9f c3 ff : ................
413a : __ __ __ BYT ff f1 e7 c1 e7 e7 e7 ff ff ff c1 99 99 c1 f9 83 : ................
414a : __ __ __ BYT ff 9f 9f 83 99 99 99 ff ff e7 ff c7 e7 e7 c3 ff : ................
415a : __ __ __ BYT ff f9 ff f9 f9 f9 f9 c3 ff 9f 9f 93 87 93 99 ff : ................
416a : __ __ __ BYT ff c7 e7 e7 e7 e7 c3 ff ff ff 99 80 80 94 9c ff : ................
417a : __ __ __ BYT ff ff 83 99 99 99 99 ff ff ff c3 99 99 99 c3 ff : ................
418a : __ __ __ BYT ff ff 83 99 99 83 9f 9f ff ff c1 99 99 c1 f9 f9 : ................
419a : __ __ __ BYT ff ff 83 99 9f 9f 9f ff ff ff c1 9f c3 f9 83 ff : ................
41aa : __ __ __ BYT ff e7 81 e7 e7 e7 f1 ff ff ff 99 99 99 99 c1 ff : ................
41ba : __ __ __ BYT ff ff 99 99 99 c3 e7 ff ff ff 9c 94 80 c1 c9 ff : ................
41ca : __ __ __ BYT ff ff 99 c3 e7 c3 99 ff ff ff 99 99 99 c1 f3 87 : ................
41da : __ __ __ BYT ff ff 81 f3 e7 cf 81 ff c3 cf cf cf cf cf c3 ff : ................
41ea : __ __ __ BYT f3 ed cf 83 cf 9d 03 ff c3 f3 f3 f3 f3 f3 c3 ff : ................
41fa : __ __ __ BYT ff e7 c3 81 e7 e7 e7 e7 ff ef cf 80 80 cf ef ff : ................
420a : __ __ __ BYT ff ff ff ff ff ff ff ff e7 e7 e7 e7 ff ff e7 ff : ................
421a : __ __ __ BYT 99 99 99 ff ff ff ff ff 99 99 00 99 00 99 99 ff : ................
422a : __ __ __ BYT e7 c1 9f c3 f9 83 e7 ff 9d 99 f3 e7 cf 99 b9 ff : ................
423a : __ __ __ BYT c3 99 c3 c7 98 99 c0 ff f9 f3 e7 ff ff ff ff ff : ................
424a : __ __ __ BYT f3 e7 cf cf cf e7 f3 ff cf e7 f3 f3 f3 e7 cf ff : ................
425a : __ __ __ BYT ff 99 c3 00 c3 99 ff ff ff e7 e7 81 e7 e7 ff ff : ................
426a : __ __ __ BYT ff ff ff ff ff e7 e7 cf ff ff ff 81 ff ff ff ff : ................
427a : __ __ __ BYT ff ff ff ff ff e7 e7 ff ff fc f9 f3 e7 cf 9f ff : ................
428a : __ __ __ BYT c3 99 91 89 99 99 c3 ff e7 e7 c7 e7 e7 e7 81 ff : ................
429a : __ __ __ BYT c3 99 f9 f3 cf 9f 81 ff c3 99 f9 e3 f9 99 c3 ff : ................
42aa : __ __ __ BYT f9 f1 e1 99 80 f9 f9 ff 81 9f 83 f9 f9 99 c3 ff : ................
42ba : __ __ __ BYT c3 99 9f 83 99 99 c3 ff 81 99 f3 e7 e7 e7 e7 ff : ................
42ca : __ __ __ BYT c3 99 99 c3 99 99 c3 ff c3 99 99 c1 f9 99 c3 ff : ................
42da : __ __ __ BYT ff ff e7 ff ff e7 ff ff ff ff e7 ff ff e7 e7 cf : ................
42ea : __ __ __ BYT f1 e7 cf 9f cf e7 f1 ff ff ff 81 ff 81 ff ff ff : ................
42fa : __ __ __ BYT 8f e7 f3 f9 f3 e7 8f ff c3 99 f9 f3 e7 ff e7 ff : ................
430a : __ __ __ BYT ff ff ff 00 00 ff ff ff e7 c3 99 81 99 99 99 ff : ................
431a : __ __ __ BYT 83 99 99 83 99 99 83 ff c3 99 9f 9f 9f 99 c3 ff : ................
432a : __ __ __ BYT 87 93 99 99 99 93 87 ff 81 9f 9f 87 9f 9f 81 ff : ................
433a : __ __ __ BYT 81 9f 9f 87 9f 9f 9f ff c3 99 9f 91 99 99 c3 ff : ................
434a : __ __ __ BYT 99 99 99 81 99 99 99 ff c3 e7 e7 e7 e7 e7 c3 ff : ................
435a : __ __ __ BYT e1 f3 f3 f3 f3 93 c7 ff 99 93 87 8f 87 93 99 ff : ................
436a : __ __ __ BYT 9f 9f 9f 9f 9f 9f 81 ff 9c 88 80 94 9c 9c 9c ff : ................
437a : __ __ __ BYT 99 89 81 81 91 99 99 ff c3 99 99 99 99 99 c3 ff : ................
438a : __ __ __ BYT 83 99 99 83 9f 9f 9f ff c3 99 99 99 99 c3 f1 ff : ................
439a : __ __ __ BYT 83 99 99 83 87 93 99 ff c3 99 9f c3 f9 99 c3 ff : ................
43aa : __ __ __ BYT 81 e7 e7 e7 e7 e7 e7 ff 99 99 99 99 99 99 c3 ff : ................
43ba : __ __ __ BYT 99 99 99 99 99 c3 e7 ff 9c 9c 9c 94 80 88 9c ff : ................
43ca : __ __ __ BYT 99 99 c3 e7 c3 99 99 ff 99 99 99 c3 e7 e7 e7 ff : ................
43da : __ __ __ BYT 81 f9 f3 e7 cf 9f 81 ff e7 e7 e7 00 00 e7 e7 e7 : ................
43ea : __ __ __ BYT 3f 3f cf cf 3f 3f cf cf e7 e7 e7 e7 e7 e7 e7 e7 : ??..??..........
43fa : __ __ __ BYT cc cc 33 33 cc cc 33 33 cc 66 33 99 cc 66 33 99 : ..33..33.f3..f3.
440a : __ __ __ BYT ff ff ff ff ff ff ff ff 0f 0f 0f 0f 0f 0f 0f 0f : ................
441a : __ __ __ BYT ff ff ff ff 00 00 00 00 00 ff ff ff ff ff ff ff : ................
442a : __ __ __ BYT ff ff ff ff ff ff ff 00 3f 3f 3f 3f 3f 3f 3f 3f : ........????????
443a : __ __ __ BYT 33 33 cc cc 33 33 cc cc fc fc fc fc fc fc fc fc : 33..33..........
444a : __ __ __ BYT ff ff ff ff 33 33 cc cc 33 66 cc 99 33 66 cc 99 : ....33..3f..3f..
445a : __ __ __ BYT fc fc fc fc fc fc fc fc e7 e7 e7 e0 e0 e7 e7 e7 : ................
446a : __ __ __ BYT ff ff ff ff f0 f0 f0 f0 e7 e7 e7 e0 e0 ff ff ff : ................
447a : __ __ __ BYT ff ff ff 07 07 e7 e7 e7 ff ff ff ff ff ff 00 00 : ................
448a : __ __ __ BYT ff ff ff e0 e0 e7 e7 e7 e7 e7 e7 00 00 ff ff ff : ................
449a : __ __ __ BYT ff ff ff 00 00 e7 e7 e7 e7 e7 e7 07 07 e7 e7 e7 : ................
44aa : __ __ __ BYT 3f 3f 3f 3f 3f 3f 3f 3f 1f 1f 1f 1f 1f 1f 1f 1f : ????????........
44ba : __ __ __ BYT f8 f8 f8 f8 f8 f8 f8 f8 00 00 ff ff ff ff ff ff : ................
44ca : __ __ __ BYT 00 00 00 ff ff ff ff ff ff ff ff ff ff 00 00 00 : ................
44da : __ __ __ BYT fe fc f9 93 87 8f 9f ff ff ff ff ff 0f 0f 0f 0f : ................
44ea : __ __ __ BYT f0 f0 f0 f0 ff ff ff ff e7 e7 e7 07 07 ff ff ff : ................
44fa : __ __ __ BYT 0f 0f 0f 0f ff ff ff ff 0f 0f 0f 0f f0 f0 f0 f0 : ................
--------------------------------------------------------------------
vic_setbank:
166d:	ENTER	0, 2
1671:	MOVUB	T1, $dd00
1675:	ANDB	T1, #$00FC
1678:	MOVB	ACCU, P0
167a:	MOV	T2, #3
167d:	XOR	ACCU, T2
167f:	OR	ACCU, T1
1681:	MOVB	$dd00, ACCU
1685:	RETURN	0, 2
--------------------------------------------------------------------
i:
4574 : __ __ __ BSS	2
--------------------------------------------------------------------
cwin_init:
1689:	ENTER	0, 2
168d:	MOV	ACCU, P0
168f:	MOV	T0, ACCU
1691:	MOVB	ACCU, P4
1693:	MOVB	T1, ACCU
1695:	MOV	ADDR, T0
1697:	MOVB	0(ADDR), T1
169a:	MOVB	ACCU, P5
169c:	MOVB	T2, ACCU
169e:	MOVB	1(ADDR), T2
16a1:	MOVB	2(ADDR), P6
16a4:	MOVB	3(ADDR), P7
16a7:	MOV	ACCU, #0
16aa:	MOVB	4(ADDR), ACCU
16ad:	MOVB	5(ADDR), ACCU
16b0:	MOVB	ACCU, T2
16b2:	SHL	ACCU, #1
16b4:	LEAX	ADDR, mul40 + 0 + ACCU
16b8:	MOV	T4, 0(ADDR)
16bb:	MOV	ADDR, T0
16bd:	MOV	ACCU, P2
16bf:	ADD	ACCU, T4
16c1:	MOV	T5, ACCU
16c3:	MOVB	ACCU, T1
16c5:	MOV	T6, ACCU
16c7:	ADD	T5, ACCU
16c9:	MOV	6(ADDR), T5
16cc:	LEA	ACCU, $d800
16d0:	ADD	ACCU, T4
16d2:	ADD	ACCU, T6
16d4:	MOV	8(ADDR), ACCU
16d7:	RETURN	0, 2
--------------------------------------------------------------------
mul40:
450a : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
451a : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
452a : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
453a : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
outputwin:
4576 : __ __ __ BSS	10
--------------------------------------------------------------------
cwin_clear:
16db:	ENTER	0, 2
16df:	PUSH	#$0002
16e2:	MOVB	P9, #32
16e5:	MOVB	P10, #1
16e8:	MOV	ACCU, 2(FP)
16eb:	MOV	P7, ACCU
16ed:	CALL	cwin_fill + 0
16f0:	POP	#$0002
16f3:	RETURN	0, 2
--------------------------------------------------------------------
cwin_fill:
16f7:	ENTER	4, 6
16fb:	PUSH	#$0002
16fe:	MOV	ACCU, P7
1700:	MOV	T3, ACCU
1702:	MOV	ADDR, T3
1704:	MOV	T0, 6(ADDR)
1707:	MOV	T1, 8(ADDR)
170a:	MOVB	T2, #0
170d:	MOV	ADDR, T3
170f:	MOVUB	ACCU, 3(ADDR)
1712:	CMPUB	ACCU, T2
1714:	BGE	$1739
1716:	MOV	ACCU, T0
1718:	MOV	P0, ACCU
171a:	MOV	ACCU, T1
171c:	MOV	P2, ACCU
171e:	MOVB	P6, 2(ADDR)
1721:	MOVB	ACCU, P9
1723:	MOVB	P4, ACCU
1725:	MOVB	ACCU, P10
1727:	MOVB	P5, ACCU
1729:	JSR	fill_fwd + 0
172c:	ADDB	T2, #$0001
172f:	ADD	T0, #$0028
1733:	ADD	T1, #$0028
1737:	JUMP	$170D
1739:	POP	#$0002
173c:	RETURN	4, 6
--------------------------------------------------------------------
fill_fwd:
1740 : ea __ __ NOP
1741 : a6 11 __ LDX P4
1743 : a5 13 __ LDA P6
1745 : f0 0e __ BEQ $1755
1747 : a0 00 __ LDY #$00
1749 : 8a __ __ TXA
174a : 91 0d __ STA (P0),y
174c : a5 12 __ LDA P5
174e : 91 0f __ STA (P2),y
1750 : c8 __ __ INY
1751 : c4 13 __ CPY P6
1753 : 90 f4 __ BCC $1749
1755 : 60 __ __ RTS
--------------------------------------------------------------------
inputwin:
4580 : __ __ __ BSS	10
--------------------------------------------------------------------
msgwin:
458a : __ __ __ BSS	10
--------------------------------------------------------------------
corral:
1756:	ENTER	0, 2
175a:	MOV	ACCU, #0
175d:	MOV	i + 0, ACCU
1761:	MOV	T0, i + 0
1765:	LEAX	ADDR, $c800 + T0
1769:	MOVB	0(ADDR), T0
176c:	ADD	T0, #$0001
1770:	MOV	i + 0, T0
1774:	MOV	ACCU, T0
1776:	CMPS	ACCU, #$0078
1779:	BGT	$1761
177b:	MOV	ACCU, #6
177e:	MOVB	$d021, ACCU
1782:	MOV	ACCU, #0
1785:	MOV	i + 0, ACCU
1789:	MOV	T0, i + 0
178d:	MOV	ACCU, T0
178f:	ADD	ACCU, #$D800
1793:	MOV	ADDR, ACCU
1795:	MOV	ACCU, #1
1798:	MOVB	0(ADDR), ACCU
179b:	ADD	T0, #$0001
179f:	MOV	i + 0, T0
17a3:	MOV	ACCU, T0
17a5:	CMPS	ACCU, #$0078
17a8:	BGT	$1789
17aa:	RETURN	0, 2
--------------------------------------------------------------------
c:
4594 : __ __ __ BSS	1
--------------------------------------------------------------------
tmpstring:
4595 : __ __ __ BSS	25
--------------------------------------------------------------------
inputstring:
45ae : __ __ __ BSS	25
--------------------------------------------------------------------
17ae : a5 c6 __ LDA $c6
17b0 : d0 16 __ BNE $17c8
17b2 : a5 cc __ LDA $cc
17b4 : 48 __ __ PHA
17b5 : a9 01 __ LDA #$01
17b7 : 20 d3 17 JSR $17d3 
17ba : a5 c6 __ LDA $c6
17bc : f0 fc __ BEQ $17ba
17be : a2 00 __ LDX #$00
17c0 : 68 __ __ PLA
17c1 : d0 01 __ BNE $17c4
17c3 : e8 __ __ INX
17c4 : 8a __ __ TXA
17c5 : 20 d3 17 JSR $17d3 
17c8 : 20 b4 e5 JSR $e5b4 
17cb : 8d 78 c8 STA $c878 
17ce : a2 00 __ LDX #$00
17d0 : 4c fa 17 JMP $17fa 
17d3 : aa __ __ TAX
17d4 : d0 20 __ BNE $17f6
17d6 : a5 cc __ LDA $cc
17d8 : d0 19 __ BNE $17f3
17da : a9 01 __ LDA #$01
17dc : 85 cc __ STA $cc
17de : a5 cf __ LDA $cf
17e0 : f0 0d __ BEQ $17ef
17e2 : a4 d3 __ LDY $d3
17e4 : b1 d1 __ LDA ($d1),y
17e6 : 49 80 __ EOR #$80
17e8 : 91 d1 __ STA ($d1),y
17ea : ad 87 02 LDA $0287 
17ed : 91 f3 __ STA ($f3),y
17ef : a9 00 __ LDA #$00
17f1 : 85 cf __ STA $cf
17f3 : 4c fa 17 JMP $17fa 
17f6 : a9 00 __ LDA #$00
17f8 : 85 cc __ STA $cc
17fa : 60 __ __ RTS
--------------------------------------------------------------------
gotoxy:
17fb:	ENTER	0, 2
17ff:	JSR	$1806
1802:	RETURN	0, 2
--------------------------------------------------------------------
1806 : a6 0f __ LDX P2
1808 : a4 0d __ LDY P0
180a : 18 __ __ CLC
180b : 20 f0 ff JSR $fff0 
180e : 60 __ __ RTS
--------------------------------------------------------------------
printf:
180f:	ENTER	0, 2
1813:	PUSH	#$0009
1816:	MOV	ACCU, #1
1819:	MOVB	8(SP), ACCU
181c:	LEA	T0, $9fc2
1820:	MOV	2(SP), T0
1823:	MOV	T0, 2(FP)
1826:	MOV	4(SP), T0
1829:	LEA	T0, 4(FP)
182d:	MOV	6(SP), T0
1830:	CALL	sformat + 0
1833:	POP	#$0009
1836:	RETURN	0, 2
--------------------------------------------------------------------
sformat:
183a:	ENTER	8, 10
183e:	PUSH	#$000B
1841:	MOV	T0, 4(FP)
1844:	MOV	ADDR, T0
1846:	MOVB	T1, 0(ADDR)
1849:	MOV	T2, 2(FP)
184c:	MOVB	T3, #0
184f:	MOVB	ACCU, T1
1851:	BEQF	$195F
1854:	ADD	T0, #$0001
1858:	MOVB	ACCU, T1
185a:	CMPUB	ACCU, #$0025
185c:	BNEF	$1F2A
185f:	MOVB	ACCU, T3
1861:	BEQ	$1885
1863:	MOVUB	ACCU, 8(FP)
1866:	BNE	$1871
1868:	MOVB	ACCU, T3
186a:	ADD	T2, ACCU
186c:	MOVB	T3, #0
186f:	JUMP	$1885
1871:	MOV	ACCU, T2
1873:	MOV	P0, ACCU
1875:	MOVB	ACCU, T3
1877:	LEAX	ADDR, T2 + ACCU
1879:	MOV	ACCU, #0
187c:	MOVB	0(ADDR), ACCU
187f:	CALL	puts + 0
1882:	MOVB	T3, #0
1885:	MOV	ADDR, T0
1887:	MOVB	T1, 0(ADDR)
188a:	MOV	ACCU, #32
188d:	MOVB	$9ff4, ACCU
1891:	MOV	ACCU, #1
1894:	MOVB	$9ff5, ACCU
1898:	MOV	ACCU, #255
189b:	MOVB	$9ff6, ACCU
189f:	MOV	ACCU, #10
18a2:	MOV	$9ff7, ACCU
18a6:	MOV	ACCU, #0
18a9:	MOVB	$9ff9, ACCU
18ad:	MOVB	$9ffa, ACCU
18b1:	MOVB	$9ffb, ACCU
18b5:	ADD	T0, #$0001
18b9:	MOVB	ACCU, T1
18bb:	CMPUB	ACCU, #$002B
18bd:	BNE	$18CD
18bf:	MOV	ACCU, #1
18c2:	MOVB	$9ff9, ACCU
18c6:	MOV	ADDR, T0
18c8:	MOVB	T1, 0(ADDR)
18cb:	JUMP	$18B5
18cd:	MOVB	ACCU, T1
18cf:	CMPUB	ACCU, #$0030
18d1:	BNE	$18E1
18d3:	MOV	ACCU, #48
18d6:	MOVB	$9ff4, ACCU
18da:	MOV	ADDR, T0
18dc:	MOVB	T1, 0(ADDR)
18df:	JUMP	$18B5
18e1:	MOVB	ACCU, T1
18e3:	CMPUB	ACCU, #$0023
18e5:	BNE	$18F5
18e7:	MOV	ACCU, #1
18ea:	MOVB	$9ffb, ACCU
18ee:	MOV	ADDR, T0
18f0:	MOVB	T1, 0(ADDR)
18f3:	JUMP	$18B5
18f5:	MOVB	ACCU, T1
18f7:	CMPUB	ACCU, #$0030
18f9:	CMPSB	ACCU, #$0001
18fb:	MOVB	T4, ACCU
18fd:	MOVB	ACCU, ACCU
18ff:	BEQ	$1908
1901:	MOVB	ACCU, T1
1903:	CMPUB	ACCU, #$0039
1905:	BGEF	$1EF4
1908:	MOVB	ACCU, T1
190a:	CMPUB	ACCU, #$002E
190c:	BEQF	$1EB2
190f:	MOVB	ACCU, T1
1911:	CMPUB	ACCU, #$0064
1913:	BEQF	$1D73
1916:	MOVB	ACCU, T1
1918:	CMPUB	ACCU, #$0075
191a:	BEQF	$1C49
191d:	MOVB	ACCU, T1
191f:	CMPUB	ACCU, #$0078
1921:	BEQF	$1B06
1924:	MOVB	ACCU, T1
1926:	CMPUB	ACCU, #$006C
1928:	BEQF	$1A5D
192b:	MOVB	ACCU, T1
192d:	CMPUB	ACCU, #$0066
192f:	BEQF	$1A28
1932:	MOVB	ACCU, T1
1934:	CMPUB	ACCU, #$0067
1936:	BEQF	$1A28
1939:	MOVB	ACCU, T1
193b:	CMPUB	ACCU, #$0065
193d:	BEQF	$1A28
1940:	MOVB	ACCU, T1
1942:	CMPUB	ACCU, #$0073
1944:	BEQF	$19D3
1947:	MOVB	ACCU, T1
1949:	CMPUB	ACCU, #$0063
194b:	BEQ	$19A8
194d:	MOVB	ACCU, T1
194f:	BNE	$198E
1951:	MOV	ADDR, T0
1953:	MOVB	T1, 0(ADDR)
1956:	ADD	T0, #$0001
195a:	MOVB	ACCU, T1
195c:	BNEF	$1858
195f:	MOVB	ACCU, T3
1961:	ADD	ACCU, T2
1963:	MOV	T0, ACCU
1965:	MOV	ACCU, #0
1968:	MOV	ADDR, T0
196a:	MOVB	0(ADDR), ACCU
196d:	MOVB	ACCU, T3
196f:	BNE	$197A
1971:	MOV	ACCU, T2
1973:	POP	#$000B
1976:	RETURN	8, 10
197a:	MOVUB	ACCU, 8(FP)
197d:	BNE	$1983
197f:	MOV	ACCU, T0
1981:	JUMP	$1973
1983:	MOV	ACCU, T2
1985:	MOV	P0, ACCU
1987:	CALL	puts + 0
198a:	MOV	ACCU, T2
198c:	JUMP	$1973
198e:	MOVB	ACCU, T3
1990:	LEAX	ADDR, T2 + ACCU
1992:	MOVB	0(ADDR), T1
1995:	MOV	ADDR, T0
1997:	MOVB	T1, 0(ADDR)
199a:	ADDB	T3, #$0001
199d:	ADD	T0, #$0001
19a1:	MOVB	ACCU, T1
19a3:	BNEF	$1858
19a6:	JUMP	$195F
19a8:	MOV	T5, 6(FP)
19ab:	MOV	ACCU, T5
19ad:	MOV	ADDR, T5
19af:	MOV	T5, 0(ADDR)
19b2:	ADD	ACCU, #$0002
19b6:	MOV	6(FP), ACCU
19b9:	MOVB	ACCU, T3
19bb:	LEAX	ADDR, T2 + ACCU
19bd:	MOVB	0(ADDR), T5
19c0:	MOV	ADDR, T0
19c2:	MOVB	T1, 0(ADDR)
19c5:	ADDB	T3, #$0001
19c8:	ADD	T0, #$0001
19cc:	MOVB	ACCU, T1
19ce:	BNEF	$1858
19d1:	JUMP	$195F
19d3:	MOV	T5, 6(FP)
19d6:	MOV	ACCU, T5
19d8:	MOV	ADDR, T5
19da:	MOV	T5, 0(ADDR)
19dd:	ADD	ACCU, #$0002
19e1:	MOV	6(FP), ACCU
19e4:	MOVUB	ACCU, 8(FP)
19e7:	BEQ	$1A01
19e9:	MOV	ACCU, T5
19eb:	MOV	P0, ACCU
19ed:	CALL	puts + 0
19f0:	MOV	ADDR, T0
19f2:	MOVB	T1, 0(ADDR)
19f5:	ADD	T0, #$0001
19f9:	MOVB	ACCU, T1
19fb:	BNEF	$1858
19fe:	JUMPF	$195F
1a01:	MOV	ADDR, T5
1a03:	MOVB	T1, 0(ADDR)
1a06:	MOVB	ACCU, T1
1a08:	BEQF	$1951
1a0b:	ADD	T5, #$0001
1a0f:	MOV	ADDR, T2
1a11:	MOVB	0(ADDR), T1
1a14:	MOV	ADDR, T5
1a16:	MOVB	T1, 0(ADDR)
1a19:	ADD	T2, #$0001
1a1d:	ADD	T5, #$0001
1a21:	MOVB	ACCU, T1
1a23:	BNE	$1A0F
1a25:	JUMPF	$1951
1a28:	MOV	4(SP), T2
1a2b:	MOVB	10(SP), T1
1a2e:	LEA	T5, $9ff4
1a32:	MOV	2(SP), T5
1a35:	MOV	T5, 6(FP)
1a38:	MOV	ADDR, T5
1a3a:	MOVD	T10, 0(ADDR)
1a3d:	MOVD	6(SP), T10
1a40:	CALL	nformf + 0
1a43:	MOV	T3, ACCU
1a45:	ADD	T5, #$0004
1a49:	MOV	6(FP), T5
1a4c:	MOV	ADDR, T0
1a4e:	MOVB	T1, 0(ADDR)
1a51:	ADD	T0, #$0001
1a55:	MOVB	ACCU, T1
1a57:	BNEF	$1858
1a5a:	JUMPF	$195F
1a5d:	MOV	T5, 6(FP)
1a60:	MOV	ADDR, T5
1a62:	MOVD	T10, 0(ADDR)
1a65:	ADD	T5, #$0004
1a69:	MOV	6(FP), T5
1a6c:	MOV	ACCU, T0
1a6e:	MOV	T5, ACCU
1a70:	MOV	ADDR, T0
1a72:	MOVB	T1, 0(ADDR)
1a75:	MOVB	ACCU, T1
1a77:	CMPUB	ACCU, #$0064
1a79:	BNE	$1AA0
1a7b:	MOV	ACCU, T2
1a7d:	MOV	P2, ACCU
1a7f:	MOVD	ACCU, T10
1a81:	MOVD	P4, ACCU
1a83:	MOVB	P8, #1
1a86:	LEA	P0, $9ff4
1a8a:	CALL	nforml + 0
1a8d:	MOV	T3, ACCU
1a8f:	MOV	ADDR, T0
1a91:	MOVB	T1, 1(ADDR)
1a94:	ADD	T0, #$0002
1a98:	MOVB	ACCU, T1
1a9a:	BNEF	$1858
1a9d:	JUMPF	$195F
1aa0:	MOVB	ACCU, T1
1aa2:	CMPUB	ACCU, #$0075
1aa4:	BNE	$1ACB
1aa6:	MOV	ACCU, T2
1aa8:	MOV	P2, ACCU
1aaa:	MOVD	ACCU, T10
1aac:	MOVD	P4, ACCU
1aae:	MOVB	P8, #0
1ab1:	LEA	P0, $9ff4
1ab5:	CALL	nforml + 0
1ab8:	MOV	T3, ACCU
1aba:	MOV	ADDR, T0
1abc:	MOVB	T1, 1(ADDR)
1abf:	ADD	T0, #$0002
1ac3:	MOVB	ACCU, T1
1ac5:	BNEF	$1858
1ac8:	JUMPF	$195F
1acb:	ADD	T0, #$0001
1acf:	MOVB	ACCU, T1
1ad1:	CMPUB	ACCU, #$0078
1ad3:	BNEF	$1951
1ad6:	MOV	ACCU, T2
1ad8:	MOV	P2, ACCU
1ada:	MOVD	ACCU, T10
1adc:	MOVD	P4, ACCU
1ade:	MOVB	P8, #0
1ae1:	MOV	ACCU, #16
1ae4:	MOV	$9ff7, ACCU
1ae8:	LEA	P0, $9ff4
1aec:	CALL	nforml + 0
1aef:	MOV	T3, ACCU
1af1:	MOV	ADDR, T5
1af3:	MOVB	T1, 1(ADDR)
1af6:	MOV	ACCU, T5
1af8:	ADD	ACCU, #$0002
1afc:	MOV	T0, ACCU
1afe:	MOVB	ACCU, T1
1b00:	BNEF	$1858
1b03:	JUMPF	$195F
1b06:	MOV	ACCU, #16
1b09:	MOV	$9ff7, ACCU
1b0d:	MOV	T5, 6(FP)
1b10:	MOV	ACCU, T5
1b12:	MOV	ADDR, T5
1b14:	MOV	T5, 0(ADDR)
1b17:	ADD	ACCU, #$0002
1b1b:	MOV	6(FP), ACCU
1b1e:	MOV	ACCU, T2
1b20:	MOV	T7, ACCU
1b22:	MOVB	T1, #0
1b25:	MOVB	T3, #10
1b28:	MOV	ACCU, T5
1b2a:	BNEF	$1C17
1b2d:	MOVB	T4, $9ff6
1b31:	MOVB	ACCU, T4
1b33:	CMPUB	ACCU, #$00FF
1b35:	BNEF	$1C07
1b38:	MOVB	T4, #9
1b3b:	MOVB	ACCU, T3
1b3d:	CMPUB	ACCU, #$0009
1b3f:	BGE	$1B54
1b41:	ADDB	T3, #$00FF
1b44:	MOVB	ACCU, T3
1b46:	LEAX	ADDR, T7 + ACCU
1b48:	MOV	ACCU, #48
1b4b:	MOVB	0(ADDR), ACCU
1b4e:	MOVB	ACCU, T4
1b50:	CMPUB	ACCU, T3
1b52:	BGT	$1B41
1b54:	MOVUB	ACCU, $9ffb
1b58:	BEQ	$1B64
1b5a:	MOV	ACCU, $9ff7
1b5e:	CMPU	ACCU, #$0010
1b61:	BEQF	$1BE4
1b64:	MOVB	ACCU, T1
1b66:	BNE	$1BD5
1b68:	MOVUB	ACCU, $9ff9
1b6c:	BEQ	$1B7B
1b6e:	ADDB	T3, #$00FF
1b71:	MOVB	ACCU, T3
1b73:	LEAX	ADDR, T7 + ACCU
1b75:	MOV	ACCU, #43
1b78:	MOVB	0(ADDR), ACCU
1b7b:	MOVB	ACCU, T3
1b7d:	MOV	T8, ACCU
1b7f:	MOVUB	T5, $9ff5
1b83:	SUBR	T5, #$000A
1b87:	MOV	ACCU, T5
1b89:	CMPS	ACCU, T8
1b8b:	BLE	$1BA1
1b8d:	ADDB	T3, #$00FF
1b90:	MOVB	ACCU, T3
1b92:	ADD	ACCU, T7
1b94:	MOV	T5, ACCU
1b96:	MOVB	T1, $9ff4
1b9a:	MOV	ADDR, T5
1b9c:	MOVB	0(ADDR), T1
1b9f:	JUMP	$1B7B
1ba1:	MOVB	T4, #0
1ba4:	MOVB	ACCU, T3
1ba6:	CMPUB	ACCU, #$000A
1ba8:	BLE	$1BC0
1baa:	MOVB	ACCU, T3
1bac:	LEAX	ADDR, T7 + ACCU
1bae:	MOVB	T1, 0(ADDR)
1bb1:	MOVB	ACCU, T4
1bb3:	LEAX	ADDR, T7 + ACCU
1bb5:	MOVB	0(ADDR), T1
1bb8:	ADDB	T4, #$0001
1bbb:	LOOPB	T3, #$0A
1bbe:	BGT	$1BAA
1bc0:	MOV	ADDR, T0
1bc2:	MOVB	T1, 0(ADDR)
1bc5:	MOVB	ACCU, T4
1bc7:	MOV	T3, ACCU
1bc9:	ADD	T0, #$0001
1bcd:	MOVB	ACCU, T1
1bcf:	BNEF	$1858
1bd2:	JUMPF	$195F
1bd5:	ADDB	T3, #$00FF
1bd8:	MOVB	ACCU, T3
1bda:	LEAX	ADDR, T7 + ACCU
1bdc:	MOV	ACCU, #45
1bdf:	MOVB	0(ADDR), ACCU
1be2:	JUMP	$1B7B
1be4:	MOVB	ACCU, T3
1be6:	ADDB	ACCU, #$00FF
1be9:	MOVB	ACCU, ACCU
1beb:	LEAX	ADDR, T7 + ACCU
1bed:	MOV	ACCU, #88
1bf0:	MOVB	0(ADDR), ACCU
1bf3:	ADDB	T3, #$00FE
1bf6:	MOVB	ACCU, T3
1bf8:	LEAX	ADDR, T7 + ACCU
1bfa:	MOV	ACCU, #48
1bfd:	MOVB	0(ADDR), ACCU
1c00:	MOVB	ACCU, T1
1c02:	BNE	$1BD5
1c04:	JUMPF	$1B68
1c07:	MOVB	ACCU, T4
1c09:	SUBR	ACCU, #$000A
1c0d:	MOV	T4, ACCU
1c0f:	CMPUB	ACCU, T3
1c11:	BGTF	$1B41
1c14:	JUMPF	$1B54
1c17:	MOV	T8, $9ff7
1c1b:	MOV	ACCU, T5
1c1d:	MODU	ACCU, T8
1c1f:	MOV	T8, ACCU
1c21:	CMPS	ACCU, #$000A
1c24:	BLE	$1C2C
1c26:	ADD	T8, #$0030
1c2a:	JUMP	$1C30
1c2c:	ADD	T8, #$0037
1c30:	ADDB	T3, #$00FF
1c33:	MOVB	ACCU, T3
1c35:	LEAX	ADDR, T7 + ACCU
1c37:	MOVB	0(ADDR), T8
1c3a:	MOV	T8, $9ff7
1c3e:	MOV	ACCU, T5
1c40:	DIVU	ACCU, T8
1c42:	MOV	T5, ACCU
1c44:	BNE	$1C17
1c46:	JUMPF	$1B2D
1c49:	MOV	T5, 6(FP)
1c4c:	MOV	ACCU, T5
1c4e:	MOV	ADDR, T5
1c50:	MOV	T5, 0(ADDR)
1c53:	ADD	ACCU, #$0002
1c57:	MOV	6(FP), ACCU
1c5a:	MOV	ACCU, T2
1c5c:	MOV	T7, ACCU
1c5e:	MOVB	T1, #0
1c61:	MOVB	T3, #10
1c64:	MOV	ACCU, T5
1c66:	BNEF	$1D41
1c69:	MOVB	T4, $9ff6
1c6d:	MOVB	ACCU, T4
1c6f:	CMPUB	ACCU, #$00FF
1c71:	BNEF	$1D31
1c74:	MOVB	T4, #9
1c77:	MOVB	ACCU, T3
1c79:	CMPUB	ACCU, #$0009
1c7b:	BGE	$1C90
1c7d:	ADDB	T3, #$00FF
1c80:	MOVB	ACCU, T3
1c82:	LEAX	ADDR, T7 + ACCU
1c84:	MOV	ACCU, #48
1c87:	MOVB	0(ADDR), ACCU
1c8a:	MOVB	ACCU, T4
1c8c:	CMPUB	ACCU, T3
1c8e:	BGT	$1C7D
1c90:	MOVUB	ACCU, $9ffb
1c94:	BEQ	$1C9F
1c96:	MOV	ACCU, $9ff7
1c9a:	CMPU	ACCU, #$0010
1c9d:	BEQ	$1D0E
1c9f:	MOVB	ACCU, T1
1ca1:	BNE	$1CFF
1ca3:	MOVUB	ACCU, $9ff9
1ca7:	BEQ	$1CB6
1ca9:	ADDB	T3, #$00FF
1cac:	MOVB	ACCU, T3
1cae:	LEAX	ADDR, T7 + ACCU
1cb0:	MOV	ACCU, #43
1cb3:	MOVB	0(ADDR), ACCU
1cb6:	MOVB	ACCU, T3
1cb8:	MOV	T8, ACCU
1cba:	MOVUB	T5, $9ff5
1cbe:	SUBR	T5, #$000A
1cc2:	MOV	ACCU, T5
1cc4:	CMPS	ACCU, T8
1cc6:	BLE	$1CDC
1cc8:	ADDB	T3, #$00FF
1ccb:	MOVB	ACCU, T3
1ccd:	ADD	ACCU, T7
1ccf:	MOV	T5, ACCU
1cd1:	MOVB	T1, $9ff4
1cd5:	MOV	ADDR, T5
1cd7:	MOVB	0(ADDR), T1
1cda:	JUMP	$1CB6
1cdc:	MOVB	T4, #0
1cdf:	MOVB	ACCU, T3
1ce1:	CMPUB	ACCU, #$000A
1ce3:	BLEF	$1BC0
1ce6:	MOVB	ACCU, T3
1ce8:	LEAX	ADDR, T7 + ACCU
1cea:	MOVB	T1, 0(ADDR)
1ced:	MOVB	ACCU, T4
1cef:	LEAX	ADDR, T7 + ACCU
1cf1:	MOVB	0(ADDR), T1
1cf4:	ADDB	T4, #$0001
1cf7:	LOOPB	T3, #$0A
1cfa:	BGT	$1CE6
1cfc:	JUMPF	$1BC0
1cff:	ADDB	T3, #$00FF
1d02:	MOVB	ACCU, T3
1d04:	LEAX	ADDR, T7 + ACCU
1d06:	MOV	ACCU, #45
1d09:	MOVB	0(ADDR), ACCU
1d0c:	JUMP	$1CB6
1d0e:	MOVB	ACCU, T3
1d10:	ADDB	ACCU, #$00FF
1d13:	MOVB	ACCU, ACCU
1d15:	LEAX	ADDR, T7 + ACCU
1d17:	MOV	ACCU, #88
1d1a:	MOVB	0(ADDR), ACCU
1d1d:	ADDB	T3, #$00FE
1d20:	MOVB	ACCU, T3
1d22:	LEAX	ADDR, T7 + ACCU
1d24:	MOV	ACCU, #48
1d27:	MOVB	0(ADDR), ACCU
1d2a:	MOVB	ACCU, T1
1d2c:	BNE	$1CFF
1d2e:	JUMPF	$1CA3
1d31:	MOVB	ACCU, T4
1d33:	SUBR	ACCU, #$000A
1d37:	MOV	T4, ACCU
1d39:	CMPUB	ACCU, T3
1d3b:	BGTF	$1C7D
1d3e:	JUMPF	$1C90
1d41:	MOV	T8, $9ff7
1d45:	MOV	ACCU, T5
1d47:	MODU	ACCU, T8
1d49:	MOV	T8, ACCU
1d4b:	CMPS	ACCU, #$000A
1d4e:	BLE	$1D56
1d50:	ADD	T8, #$0030
1d54:	JUMP	$1D5A
1d56:	ADD	T8, #$0037
1d5a:	ADDB	T3, #$00FF
1d5d:	MOVB	ACCU, T3
1d5f:	LEAX	ADDR, T7 + ACCU
1d61:	MOVB	0(ADDR), T8
1d64:	MOV	T8, $9ff7
1d68:	MOV	ACCU, T5
1d6a:	DIVU	ACCU, T8
1d6c:	MOV	T5, ACCU
1d6e:	BNE	$1D41
1d70:	JUMPF	$1C69
1d73:	MOV	T5, 6(FP)
1d76:	MOV	ACCU, T5
1d78:	MOV	ADDR, T5
1d7a:	MOV	T5, 0(ADDR)
1d7d:	ADD	ACCU, #$0002
1d81:	MOV	6(FP), ACCU
1d84:	MOV	ACCU, T2
1d86:	MOV	T7, ACCU
1d88:	MOV	ACCU, T5
1d8a:	BGEF	$1EA3
1d8d:	NEG	ACCU
1d8e:	MOV	T8, ACCU
1d90:	MOVB	T1, #1
1d93:	MOVB	T3, #10
1d96:	BNEF	$1E71
1d99:	MOVB	T4, $9ff6
1d9d:	MOVB	ACCU, T4
1d9f:	CMPUB	ACCU, #$00FF
1da1:	BNEF	$1E61
1da4:	MOVB	T4, #9
1da7:	MOVB	ACCU, T3
1da9:	CMPUB	ACCU, #$0009
1dab:	BGE	$1DC0
1dad:	ADDB	T3, #$00FF
1db0:	MOVB	ACCU, T3
1db2:	LEAX	ADDR, T7 + ACCU
1db4:	MOV	ACCU, #48
1db7:	MOVB	0(ADDR), ACCU
1dba:	MOVB	ACCU, T4
1dbc:	CMPUB	ACCU, T3
1dbe:	BGT	$1DAD
1dc0:	MOVUB	ACCU, $9ffb
1dc4:	BEQ	$1DCF
1dc6:	MOV	ACCU, $9ff7
1dca:	CMPU	ACCU, #$0010
1dcd:	BEQ	$1E3E
1dcf:	MOVB	ACCU, T1
1dd1:	BNE	$1E2F
1dd3:	MOVUB	ACCU, $9ff9
1dd7:	BEQ	$1DE6
1dd9:	ADDB	T3, #$00FF
1ddc:	MOVB	ACCU, T3
1dde:	LEAX	ADDR, T7 + ACCU
1de0:	MOV	ACCU, #43
1de3:	MOVB	0(ADDR), ACCU
1de6:	MOVB	ACCU, T3
1de8:	MOV	T8, ACCU
1dea:	MOVUB	T5, $9ff5
1dee:	SUBR	T5, #$000A
1df2:	MOV	ACCU, T5
1df4:	CMPS	ACCU, T8
1df6:	BLE	$1E0C
1df8:	ADDB	T3, #$00FF
1dfb:	MOVB	ACCU, T3
1dfd:	ADD	ACCU, T7
1dff:	MOV	T5, ACCU
1e01:	MOVB	T1, $9ff4
1e05:	MOV	ADDR, T5
1e07:	MOVB	0(ADDR), T1
1e0a:	JUMP	$1DE6
1e0c:	MOVB	T4, #0
1e0f:	MOVB	ACCU, T3
1e11:	CMPUB	ACCU, #$000A
1e13:	BLEF	$1BC0
1e16:	MOVB	ACCU, T3
1e18:	LEAX	ADDR, T7 + ACCU
1e1a:	MOVB	T1, 0(ADDR)
1e1d:	MOVB	ACCU, T4
1e1f:	LEAX	ADDR, T7 + ACCU
1e21:	MOVB	0(ADDR), T1
1e24:	ADDB	T4, #$0001
1e27:	LOOPB	T3, #$0A
1e2a:	BGT	$1E16
1e2c:	JUMPF	$1BC0
1e2f:	ADDB	T3, #$00FF
1e32:	MOVB	ACCU, T3
1e34:	LEAX	ADDR, T7 + ACCU
1e36:	MOV	ACCU, #45
1e39:	MOVB	0(ADDR), ACCU
1e3c:	JUMP	$1DE6
1e3e:	MOVB	ACCU, T3
1e40:	ADDB	ACCU, #$00FF
1e43:	MOVB	ACCU, ACCU
1e45:	LEAX	ADDR, T7 + ACCU
1e47:	MOV	ACCU, #88
1e4a:	MOVB	0(ADDR), ACCU
1e4d:	ADDB	T3, #$00FE
1e50:	MOVB	ACCU, T3
1e52:	LEAX	ADDR, T7 + ACCU
1e54:	MOV	ACCU, #48
1e57:	MOVB	0(ADDR), ACCU
1e5a:	MOVB	ACCU, T1
1e5c:	BNE	$1E2F
1e5e:	JUMPF	$1DD3
1e61:	MOVB	ACCU, T4
1e63:	SUBR	ACCU, #$000A
1e67:	MOV	T4, ACCU
1e69:	CMPUB	ACCU, T3
1e6b:	BGTF	$1DAD
1e6e:	JUMPF	$1DC0
1e71:	MOV	T5, $9ff7
1e75:	MOV	ACCU, T8
1e77:	MODU	ACCU, T5
1e79:	MOV	T5, ACCU
1e7b:	CMPS	ACCU, #$000A
1e7e:	BLE	$1E86
1e80:	ADD	T5, #$0030
1e84:	JUMP	$1E8A
1e86:	ADD	T5, #$0037
1e8a:	ADDB	T3, #$00FF
1e8d:	MOVB	ACCU, T3
1e8f:	LEAX	ADDR, T7 + ACCU
1e91:	MOVB	0(ADDR), T5
1e94:	MOV	T5, $9ff7
1e98:	MOV	ACCU, T8
1e9a:	DIVU	ACCU, T5
1e9c:	MOV	T8, ACCU
1e9e:	BNE	$1E71
1ea0:	JUMPF	$1D99
1ea3:	MOV	T8, ACCU
1ea5:	MOVB	T1, #0
1ea8:	MOVB	T3, #10
1eab:	MOV	ACCU, T5
1ead:	BNE	$1E71
1eaf:	JUMPF	$1D99
1eb2:	MOV	ADDR, T0
1eb4:	MOVB	T1, 0(ADDR)
1eb7:	MOV	T5, #0
1eba:	ADD	T0, #$0001
1ebe:	MOVB	ACCU, T1
1ec0:	CMPUB	ACCU, #$0030
1ec2:	BGT	$1EE6
1ec4:	MOVB	ACCU, T1
1ec6:	CMPUB	ACCU, #$0039
1ec8:	BLT	$1EE6
1eca:	MOVB	ACCU, T1
1ecc:	MOV	T7, ACCU
1ece:	MOV	ADDR, T0
1ed0:	MOVB	T1, 0(ADDR)
1ed3:	MUL	T5, #10
1ed6:	ADD	T5, ACCU
1ed8:	ADD	T5, #$FFD0
1edc:	ADD	T0, #$0001
1ee0:	MOVB	ACCU, T1
1ee2:	CMPUB	ACCU, #$0030
1ee4:	BLE	$1EC4
1ee6:	MOVB	$9ff6, T5
1eea:	MOVB	ACCU, T1
1eec:	CMPUB	ACCU, #$0064
1eee:	BEQF	$1D73
1ef1:	JUMPF	$1916
1ef4:	MOV	T5, #0
1ef7:	MOVB	ACCU, T4
1ef9:	BEQ	$1F1D
1efb:	MOVB	ACCU, T1
1efd:	CMPUB	ACCU, #$0039
1eff:	BLT	$1F1D
1f01:	MOVB	ACCU, T1
1f03:	MOV	T7, ACCU
1f05:	MOV	ADDR, T0
1f07:	MOVB	T1, 0(ADDR)
1f0a:	MUL	T5, #10
1f0d:	ADD	T5, ACCU
1f0f:	ADD	T5, #$FFD0
1f13:	ADD	T0, #$0001
1f17:	MOVB	ACCU, T1
1f19:	CMPUB	ACCU, #$0030
1f1b:	BLE	$1EFB
1f1d:	MOVB	$9ff5, T5
1f21:	MOVB	ACCU, T1
1f23:	CMPUB	ACCU, #$002E
1f25:	BEQ	$1EB2
1f27:	JUMPF	$190F
1f2a:	MOVB	ACCU, T3
1f2c:	LEAX	ADDR, T2 + ACCU
1f2e:	MOVB	0(ADDR), T1
1f31:	LOOPB	T3, #$28
1f34:	BGTF	$1951
1f37:	MOVB	ACCU, T3
1f39:	MOV	T5, ACCU
1f3b:	MOVUB	ACCU, 8(FP)
1f3e:	BEQ	$1F63
1f40:	MOV	ACCU, T2
1f42:	MOV	P0, ACCU
1f44:	LEAX	ADDR, T5 + ACCU
1f46:	MOV	ACCU, #0
1f49:	MOVB	0(ADDR), ACCU
1f4c:	CALL	puts + 0
1f4f:	MOV	ADDR, T0
1f51:	MOVB	T1, 0(ADDR)
1f54:	MOVB	T3, #0
1f57:	ADD	T0, #$0001
1f5b:	MOVB	ACCU, T1
1f5d:	BNEF	$1858
1f60:	JUMPF	$195F
1f63:	MOV	ACCU, T5
1f65:	ADD	T2, ACCU
1f67:	MOV	ADDR, T0
1f69:	MOVB	T1, 0(ADDR)
1f6c:	MOVB	T3, #0
1f6f:	ADD	T0, #$0001
1f73:	MOVB	ACCU, T1
1f75:	BNEF	$1858
1f78:	JUMPF	$195F
--------------------------------------------------------------------
puts:
1f7b:	ENTER	0, 2
1f7f:	JSR	$1f86
1f82:	RETURN	0, 2
--------------------------------------------------------------------
1f86 : a0 00 __ LDY #$00
1f88 : b1 0d __ LDA (P0),y
1f8a : f0 0b __ BEQ $1f97
1f8c : 20 98 1f JSR $1f98 ; (putpch + 0)
1f8f : e6 0d __ INC P0
1f91 : d0 f3 __ BNE $1f86
1f93 : e6 0e __ INC P1
1f95 : d0 ef __ BNE $1f86
1f97 : 60 __ __ RTS
--------------------------------------------------------------------
putpch:
1f98 : ae 3c 45 LDX $453c ; (giocharmap + 0)
1f9b : e0 01 __ CPX #$01
1f9d : 90 22 __ BCC $1fc1
1f9f : c9 0a __ CMP #$0a
1fa1 : d0 02 __ BNE $1fa5
1fa3 : a9 0d __ LDA #$0d
1fa5 : e0 02 __ CPX #$02
1fa7 : 90 18 __ BCC $1fc1
1fa9 : c9 41 __ CMP #$41
1fab : 90 14 __ BCC $1fc1
1fad : c9 7b __ CMP #$7b
1faf : b0 10 __ BCS $1fc1
1fb1 : c9 61 __ CMP #$61
1fb3 : b0 04 __ BCS $1fb9
1fb5 : c9 5b __ CMP #$5b
1fb7 : b0 08 __ BCS $1fc1
1fb9 : 49 20 __ EOR #$20
1fbb : e0 03 __ CPX #$03
1fbd : f0 02 __ BEQ $1fc1
1fbf : 29 df __ AND #$df
1fc1 : 4c d2 ff JMP $ffd2 
--------------------------------------------------------------------
giocharmap:
453c : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
nforml:
1fc4:	ENTER	5, 7
1fc8:	MOVD	ACCU, P4
1fca:	MOVD	T0, ACCU
1fcc:	MOVD	T1, ACCU
1fce:	MOV	ACCU, P2
1fd0:	MOV	T2, ACCU
1fd2:	MOVB	T3, #0
1fd5:	MOVB	ACCU, P8
1fd7:	BEQ	$1FE6
1fd9:	MOVD	ACCU, #$00000000
1fdf:	EXTRT	T0, inp_op_cmp_s32 + 0
1fe3:	BLTF	$212A
1fe6:	MOVB	T4, #16
1fe9:	MOVD	ACCU, #$00000000
1fef:	EXTRT	T0, inp_op_cmp_u32 + 0
1ff3:	BLE	$204A
1ff5:	MOV	ACCU, P0
1ff7:	MOV	T6, ACCU
1ff9:	MOV	ADDR, T6
1ffb:	MOV	ACCU, 3(ADDR)
1ffe:	EXTRT	$00, inp_op_ext_u16 + 0
2002:	MOVD	T0, ACCU
2004:	MOVD	ACCU, T1
2006:	EXTRT	T0, inp_binop_mod_u32 + 0
200a:	MOVD	T0, ACCU
200c:	CMPS	ACCU, #$000A
200f:	BLE	$2019
2011:	MOV	ACCU, T0
2013:	ADD	ACCU, #$0030
2017:	JUMP	$201F
2019:	MOV	ACCU, T0
201b:	ADD	ACCU, #$0037
201f:	MOV	T7, ACCU
2021:	ADDB	T4, #$00FF
2024:	MOVB	ACCU, T4
2026:	LEAX	ADDR, T2 + ACCU
2028:	MOVB	0(ADDR), T7
202b:	MOV	ADDR, T6
202d:	MOV	ACCU, 3(ADDR)
2030:	EXTRT	$00, inp_op_ext_u16 + 0
2034:	MOVD	T0, ACCU
2036:	MOVD	ACCU, T1
2038:	EXTRT	T0, inp_binop_div_u32 + 0
203c:	MOVD	T1, ACCU
203e:	MOVD	ACCU, #$00000000
2044:	EXTRT	T1, inp_op_cmp_u32 + 0
2048:	BGT	$1FF9
204a:	MOV	ADDR, P0
204c:	MOVB	T5, 2(ADDR)
204f:	MOVB	ACCU, T5
2051:	CMPUB	ACCU, #$00FF
2053:	BNEF	$211A
2056:	MOVB	T5, #15
2059:	MOVB	ACCU, T4
205b:	CMPUB	ACCU, #$000F
205d:	BGE	$2072
205f:	ADDB	T4, #$00FF
2062:	MOVB	ACCU, T4
2064:	LEAX	ADDR, T2 + ACCU
2066:	MOV	ACCU, #48
2069:	MOVB	0(ADDR), ACCU
206c:	MOVB	ACCU, T5
206e:	CMPUB	ACCU, T4
2070:	BGT	$205F
2072:	MOV	ACCU, P0
2074:	MOV	T6, ACCU
2076:	MOV	ADDR, T6
2078:	MOVUB	ACCU, 7(ADDR)
207b:	BEQ	$2085
207d:	MOV	ACCU, 3(ADDR)
2080:	CMPU	ACCU, #$0010
2083:	BEQ	$20F7
2085:	MOVB	ACCU, T3
2087:	BNE	$20E8
2089:	MOV	ADDR, T6
208b:	MOVUB	ACCU, 5(ADDR)
208e:	BEQ	$209D
2090:	ADDB	T4, #$00FF
2093:	MOVB	ACCU, T4
2095:	LEAX	ADDR, T2 + ACCU
2097:	MOV	ACCU, #43
209a:	MOVB	0(ADDR), ACCU
209d:	MOV	ACCU, P0
209f:	MOV	T6, ACCU
20a1:	MOVB	ACCU, T4
20a3:	MOV	T8, ACCU
20a5:	MOV	ADDR, T6
20a7:	MOVUB	T7, 1(ADDR)
20aa:	SUBR	T7, #$0010
20ae:	MOV	ACCU, T7
20b0:	CMPS	ACCU, T8
20b2:	BLE	$20C3
20b4:	ADDB	T4, #$00FF
20b7:	MOVB	ACCU, T4
20b9:	MOVB	T3, 0(ADDR)
20bc:	LEAX	ADDR, T2 + ACCU
20be:	MOVB	0(ADDR), T3
20c1:	JUMP	$20A1
20c3:	MOVB	T3, #0
20c6:	MOVB	ACCU, T4
20c8:	CMPUB	ACCU, #$0010
20ca:	BLE	$20E2
20cc:	MOVB	ACCU, T4
20ce:	LEAX	ADDR, T2 + ACCU
20d0:	MOVB	T5, 0(ADDR)
20d3:	MOVB	ACCU, T3
20d5:	LEAX	ADDR, T2 + ACCU
20d7:	MOVB	0(ADDR), T5
20da:	ADDB	T3, #$0001
20dd:	LOOPB	T4, #$10
20e0:	BGT	$20CC
20e2:	MOVB	ACCU, T3
20e4:	RETURN	5, 7
20e8:	ADDB	T4, #$00FF
20eb:	MOVB	ACCU, T4
20ed:	LEAX	ADDR, T2 + ACCU
20ef:	MOV	ACCU, #45
20f2:	MOVB	0(ADDR), ACCU
20f5:	JUMP	$209D
20f7:	MOVB	ACCU, T4
20f9:	ADDB	ACCU, #$00FF
20fc:	MOVB	ACCU, ACCU
20fe:	LEAX	ADDR, T2 + ACCU
2100:	MOV	ACCU, #88
2103:	MOVB	0(ADDR), ACCU
2106:	ADDB	T4, #$00FE
2109:	MOVB	ACCU, T4
210b:	LEAX	ADDR, T2 + ACCU
210d:	MOV	ACCU, #48
2110:	MOVB	0(ADDR), ACCU
2113:	MOVB	ACCU, T3
2115:	BNE	$20E8
2117:	JUMPF	$2089
211a:	MOVB	ACCU, T5
211c:	SUBR	ACCU, #$0010
2120:	MOV	T5, ACCU
2122:	CMPUB	ACCU, T4
2124:	BGTF	$205F
2127:	JUMPF	$2072
212a:	MOVD	ACCU, T0
212c:	EXTRT	$00, negaccu32 + 0
2130:	MOVD	T1, ACCU
2132:	MOVB	T3, #1
2135:	MOVB	T4, #16
2138:	MOVD	ACCU, #$00000000
213e:	EXTRT	T1, inp_op_cmp_u32 + 0
2142:	BGTF	$1FF5
2145:	JUMPF	$204A
--------------------------------------------------------------------
nformf:
2148:	ENTER	10, 12
214c:	PUSH	#$0002
214f:	MOV	T0, 4(FP)
2152:	MOV	ACCU, T0
2154:	MOV	T1, ACCU
2156:	MOVD	T2, 6(FP)
2159:	MOVD	ACCU, #$00000000
215f:	CMPF	ACCU, T2
2161:	BLTF	$24C6
2164:	MOV	ADDR, 2(FP)
2167:	MOVUB	ACCU, 5(ADDR)
216a:	BNEF	$24AD
216d:	MOVD	ACCU, T2
216f:	MOVD	P0, ACCU
2171:	CALL	isinf + 0
2174:	MOVB	T4, #0
2177:	MOVB	ACCU, ACCU
2179:	BNEF	$247F
217c:	MOV	ADDR, 2(FP)
217f:	MOVB	T3, 2(ADDR)
2182:	MOV	T0, #0
2185:	MOVB	ACCU, T3
2187:	CMPUB	ACCU, #$00FF
2189:	BNEF	$246A
218c:	MOVB	T3, #6
218f:	MOVD	T2, 6(FP)
2192:	MOVD	ACCU, #$00000000
2198:	CMPF	ACCU, T2
219a:	BEQF	$221F
219d:	MOVD	T2, 6(FP)
21a0:	MOVD	ACCU, #$447a0000
21a6:	CMPF	ACCU, T2
21a8:	BLT	$21C8
21aa:	MOVD	ACCU, 6(FP)
21ad:	MOVD	$03, #$447a0000
21b3:	DIVF	ACCU, $03
21b5:	MOVD	T2, ACCU
21b7:	MOVD	6(FP), T2
21ba:	ADD	T0, #$0003
21be:	MOVD	ACCU, #$447a0000
21c4:	CMPF	ACCU, T2
21c6:	BGE	$21AA
21c8:	MOVD	T2, 6(FP)
21cb:	MOVD	ACCU, #$3f800000
21d1:	CMPF	ACCU, T2
21d3:	BGE	$21F3
21d5:	MOVD	ACCU, 6(FP)
21d8:	MOVD	$03, #$447a0000
21de:	MULF	ACCU, $03
21e0:	MOVD	T2, ACCU
21e2:	MOVD	6(FP), T2
21e5:	ADD	T0, #$FFFD
21e9:	MOVD	ACCU, #$3f800000
21ef:	CMPF	ACCU, T2
21f1:	BLT	$21D5
21f3:	MOVD	T2, 6(FP)
21f6:	MOVD	ACCU, #$41200000
21fc:	CMPF	ACCU, T2
21fe:	BLT	$221F
2200:	MOVD	ACCU, 6(FP)
2203:	MOVD	$03, #$41200000
2209:	DIVF	ACCU, $03
220b:	MOVD	T2, ACCU
220d:	MOVD	6(FP), T2
2210:	ADD	T0, #$0001
2214:	MOVD	ACCU, #$41200000
221a:	CMPF	ACCU, T2
221c:	BGE	$2200
221e:	NOP
221f:	MOVB	T9, 10(FP)
2222:	MOVB	ACCU, T9
2224:	CMPUB	ACCU, #$0065
2226:	NOT	ACCU
2227:	ANDB	ACCU, #$0001
222a:	MOVB	T10, ACCU
222c:	MOVB	T11, ACCU
222e:	MOVB	ACCU, T3
2230:	MOV	T5, ACCU
2232:	ADD	T5, #$0001
2236:	MOVB	ACCU, T9
2238:	CMPUB	ACCU, #$0067
223a:	BEQF	$2459
223d:	MOVB	ACCU, T10
223f:	BNEF	$240E
2242:	MOV	ACCU, T0
2244:	BGE	$225C
2246:	MOVD	ACCU, 6(FP)
2249:	MOVD	$03, #$41200000
224f:	DIVF	ACCU, $03
2251:	MOVD	6(FP), ACCU
2254:	ADD	T0, #$0001
2258:	MOV	ACCU, T0
225a:	BLT	$2246
225c:	MOVB	ACCU, T3
225e:	ADD	ACCU, T0
2260:	MOV	T5, ACCU
2262:	ADD	T5, #$0001
2266:	MOVD	T2, #$3f000000
226c:	MOVB	ACCU, T5
226e:	CMPUB	ACCU, #$0001
2270:	BGE	$228A
2272:	MOVB	T9, #1
2275:	MOVD	ACCU, T2
2277:	MOVD	$03, #$41200000
227d:	DIVF	ACCU, $03
227f:	MOVD	T2, ACCU
2281:	ADDB	T9, #$0001
2284:	MOVB	ACCU, T5
2286:	CMPUB	ACCU, T9
2288:	BLT	$2275
228a:	MOVD	ACCU, 6(FP)
228d:	ADDF	ACCU, T2
228f:	MOVD	T2, ACCU
2291:	MOVD	6(FP), T2
2294:	MOVD	ACCU, #$41200000
229a:	CMPF	ACCU, T2
229c:	BLT	$22AE
229e:	MOVD	ACCU, T2
22a0:	MOVD	$03, #$41200000
22a6:	DIVF	ACCU, $03
22a8:	MOVD	6(FP), ACCU
22ab:	ADDB	T3, #$00FF
22ae:	MOVB	ACCU, T5
22b0:	MOV	T6, ACCU
22b2:	MOVB	ACCU, T3
22b4:	NEG	ACCU
22b5:	ADD	ACCU, T6
22b7:	MOV	T6, ACCU
22b9:	MOVB	T3, ACCU
22bb:	MOVB	ACCU, T5
22bd:	CMPUB	ACCU, #$0014
22bf:	BLTF	$2403
22c2:	MOVB	ACCU, T6
22c4:	BEQ	$22CB
22c6:	MOVB	T9, #0
22c9:	JUMP	$22DB
22cb:	MOVB	ACCU, T4
22cd:	LEAX	ADDR, T1 + ACCU
22cf:	MOV	ACCU, #48
22d2:	MOVB	0(ADDR), ACCU
22d5:	ADDB	T4, #$0001
22d8:	MOVB	T9, #0
22db:	MOVB	ACCU, T3
22dd:	CMPUB	ACCU, T9
22df:	BNE	$22EE
22e1:	MOVB	ACCU, T4
22e3:	LEAX	ADDR, T1 + ACCU
22e5:	MOV	ACCU, #46
22e8:	MOVB	0(ADDR), ACCU
22eb:	ADDB	T4, #$0001
22ee:	MOVD	T2, 6(FP)
22f1:	MOVD	ACCU, T2
22f3:	CNVFS	ACCU
22f4:	MOV	T6, ACCU
22f6:	CNVSF	ACCU
22f7:	MOVD	T12, ACCU
22f9:	MOVD	ACCU, T2
22fb:	SUBF	ACCU, T12
22fd:	MOVD	$03, #$41200000
2303:	MULF	ACCU, $03
2305:	MOVD	6(FP), ACCU
2308:	ADD	T6, #$0030
230c:	MOVB	ACCU, T4
230e:	LEAX	ADDR, T1 + ACCU
2310:	MOVB	0(ADDR), T6
2313:	ADDB	T4, #$0001
2316:	ADDB	T9, #$0001
2319:	MOVB	ACCU, T5
231b:	CMPUB	ACCU, T9
231d:	BLT	$22DB
231f:	MOVB	ACCU, T11
2321:	BNE	$2395
2323:	MOV	T0, 2(FP)
2326:	MOV	ADDR, T0
2328:	MOVUB	ACCU, 1(ADDR)
232b:	CMPUB	ACCU, T4
232d:	BLT	$2338
232f:	MOVB	ACCU, T4
2331:	POP	#$0002
2334:	RETURN	10, 12
2338:	MOVB	ACCU, T4
233a:	CMPUB	ACCU, #$0001
233c:	BLE	$2366
233e:	MOVB	T3, #0
2341:	MOVB	ACCU, T3
2343:	MOV	T7, ACCU
2345:	MOV	ADDR, T0
2347:	MOVUB	T5, 1(ADDR)
234a:	MOVB	ACCU, T4
234c:	NEG	ACCU
234d:	ADD	ACCU, T5
234f:	CMPU	ACCU, T7
2351:	BGE	$2362
2353:	MOV	ACCU, T1
2355:	LEAX	ADDR, T7 + ACCU
2357:	MOV	ACCU, #32
235a:	MOVB	0(ADDR), ACCU
235d:	ADDB	T3, #$0001
2360:	JUMP	$2341
2362:	MOV	ACCU, T5
2364:	JUMP	$2331
2366:	MOV	ACCU, T0
2368:	MOV	T5, ACCU
236a:	MOVB	ACCU, T4
236c:	MOV	T6, ACCU
236e:	MOVB	T3, #1
2371:	MOVB	ACCU, T3
2373:	MOV	T7, ACCU
2375:	MOV	ACCU, T6
2377:	SUB	ACCU, T7
2379:	LEAX	ADDR, T1 + ACCU
237b:	MOVB	T9, 0(ADDR)
237e:	MOV	ADDR, T5
2380:	MOVUB	ACCU, 1(ADDR)
2383:	SUB	ACCU, T7
2385:	LEAX	ADDR, T1 + ACCU
2387:	MOVB	0(ADDR), T9
238a:	ADDB	T3, #$0001
238d:	MOVB	ACCU, T4
238f:	CMPUB	ACCU, T3
2391:	BLE	$2371
2393:	JUMP	$233E
2395:	MOVB	ACCU, T4
2397:	LEAX	ADDR, T1 + ACCU
2399:	MOV	ACCU, #69
239c:	MOVB	0(ADDR), ACCU
239f:	MOVB	ACCU, T4
23a1:	ADDB	ACCU, #$0001
23a4:	MOVB	ACCU, ACCU
23a6:	ADD	ACCU, T1
23a8:	MOV	T5, ACCU
23aa:	MOV	ACCU, T0
23ac:	BLT	$23B8
23ae:	MOV	ACCU, #43
23b1:	MOV	ADDR, T5
23b3:	MOVB	0(ADDR), ACCU
23b6:	JUMP	$23C5
23b8:	MOV	ACCU, #45
23bb:	MOV	ADDR, T5
23bd:	MOVB	0(ADDR), ACCU
23c0:	MOV	ACCU, T0
23c2:	NEG	ACCU
23c3:	MOV	T0, ACCU
23c5:	MOVB	ACCU, T4
23c7:	ADDB	ACCU, #$0002
23ca:	MOVB	T3, ACCU
23cc:	MOV	ACCU, T0
23ce:	MOV	ADDR, #10
23d1:	DIVS	ACCU, ADDR
23d3:	MOV	T5, ACCU
23d5:	ADD	T5, #$0030
23d9:	MOVB	ACCU, T3
23db:	LEAX	ADDR, T1 + ACCU
23dd:	MOVB	0(ADDR), T5
23e0:	MOV	ACCU, T0
23e2:	MOV	ADDR, #10
23e5:	MODS	ACCU, ADDR
23e7:	MOV	T0, ACCU
23e9:	ADD	T0, #$0030
23ed:	MOVB	ACCU, T3
23ef:	ADDB	ACCU, #$0001
23f2:	MOVB	ACCU, ACCU
23f4:	LEAX	ADDR, T1 + ACCU
23f6:	MOVB	0(ADDR), T0
23f9:	MOVB	ACCU, T3
23fb:	ADDB	ACCU, #$0002
23fe:	MOVB	T4, ACCU
2400:	JUMPF	$2323
2403:	MOVB	T5, #20
2406:	MOVB	ACCU, T6
2408:	BEQF	$22CB
240b:	JUMPF	$22C6
240e:	MOVD	T2, #$3f000000
2414:	MOVB	ACCU, T3
2416:	BEQ	$2430
2418:	MOVB	T9, #0
241b:	MOVD	ACCU, T2
241d:	MOVD	$03, #$41200000
2423:	DIVF	ACCU, $03
2425:	MOVD	T2, ACCU
2427:	ADDB	T9, #$0001
242a:	MOVB	ACCU, T3
242c:	CMPUB	ACCU, T9
242e:	BLT	$241B
2430:	MOVD	ACCU, 6(FP)
2433:	ADDF	ACCU, T2
2435:	MOVD	T2, ACCU
2437:	MOVD	6(FP), T2
243a:	MOVD	ACCU, #$41200000
2440:	CMPF	ACCU, T2
2442:	BLTF	$22AE
2445:	MOVD	ACCU, T2
2447:	MOVD	$03, #$41200000
244d:	DIVF	ACCU, $03
244f:	MOVD	6(FP), ACCU
2452:	ADD	T0, #$0001
2456:	JUMPF	$22AE
2459:	MOV	ACCU, T0
245b:	CMPS	ACCU, #$0003
245e:	BLT	$2465
2460:	MOV	ACCU, T0
2462:	BGEF	$223D
2465:	MOVB	T11, #1
2468:	JUMP	$240E
246a:	AND	T3, #$00FF
246e:	MOVD	T2, 6(FP)
2471:	MOVD	ACCU, #$00000000
2477:	CMPF	ACCU, T2
2479:	BNEF	$219D
247c:	JUMPF	$221F
247f:	MOVB	ACCU, T4
2481:	LEAX	ADDR, T0 + ACCU
2483:	MOV	ACCU, #73
2486:	MOVB	0(ADDR), ACCU
2489:	MOVB	ACCU, T4
248b:	ADDB	ACCU, #$0001
248e:	MOVB	ACCU, ACCU
2490:	LEAX	ADDR, T0 + ACCU
2492:	MOV	ACCU, #78
2495:	MOVB	0(ADDR), ACCU
2498:	MOVB	ACCU, T4
249a:	ADDB	ACCU, #$0002
249d:	MOVB	ACCU, ACCU
249f:	LEAX	ADDR, T0 + ACCU
24a1:	MOV	ACCU, #70
24a4:	MOVB	0(ADDR), ACCU
24a7:	ADDB	T4, #$0003
24aa:	JUMPF	$2323
24ad:	MOVD	ACCU, T2
24af:	MOVD	P0, ACCU
24b1:	MOV	ACCU, #43
24b4:	MOV	ADDR, T0
24b6:	MOVB	0(ADDR), ACCU
24b9:	CALL	isinf + 0
24bc:	MOVB	T4, #1
24bf:	MOVB	ACCU, ACCU
24c1:	BNE	$247F
24c3:	JUMPF	$217C
24c6:	MOVD	ACCU, T2
24c8:	NEGF	ACCU
24c9:	MOVD	T2, ACCU
24cb:	MOVD	P0, ACCU
24cd:	MOVD	6(FP), T2
24d0:	MOV	ACCU, #45
24d3:	MOV	ADDR, T0
24d5:	MOVB	0(ADDR), ACCU
24d8:	CALL	isinf + 0
24db:	MOVB	T4, #1
24de:	MOVB	ACCU, ACCU
24e0:	BNE	$247F
24e2:	JUMPF	$217C
--------------------------------------------------------------------
isinf:
24e5:	ENTER	0, 2
24e9:	MOVD	ACCU, P0
24eb:	MOVD	T0, ACCU
24ed:	MOVD	$9ffc, T0
24f1:	MOV	ACCU, $9ffe
24f5:	SHRU	ACCU, #7
24f7:	CMPUB	ACCU, #$00FF
24f9:	NOT	ACCU
24fa:	ANDB	ACCU, #$0001
24fd:	MOVB	ACCU, ACCU
24ff:	RETURN	0, 2
--------------------------------------------------------------------
2503 : __ __ __ BYT 25 73 00                                        : %s.
--------------------------------------------------------------------
2506 : a5 ce __ LDA $ce
2508 : 8d f3 c8 STA $c8f3 
250b : 60 __ __ RTS
--------------------------------------------------------------------
cwin_putat_string:
250c : ea __ __ NOP
250d : a5 10 __ LDA P3
250f : 0a __ __ ASL
2510 : a8 __ __ TAY
2511 : b9 0a 45 LDA $450a,y ; (mul40 + 0)
2514 : 18 __ __ CLC
2515 : 65 0f __ ADC P2
2517 : 85 44 __ STA T1 + 0
2519 : b9 0b 45 LDA $450b,y ; (mul40 + 1)
251c : 69 00 __ ADC #$00
251e : 85 45 __ STA T1 + 1
2520 : a0 06 __ LDY #$06
2522 : b1 0d __ LDA (P0),y
2524 : 18 __ __ CLC
2525 : 65 44 __ ADC T1 + 0
2527 : 85 48 __ STA T3 + 0
2529 : c8 __ __ INY
252a : b1 0d __ LDA (P0),y
252c : 65 45 __ ADC T1 + 1
252e : 85 49 __ STA T3 + 1
2530 : c8 __ __ INY
2531 : b1 0d __ LDA (P0),y
2533 : 18 __ __ CLC
2534 : 65 44 __ ADC T1 + 0
2536 : 85 44 __ STA T1 + 0
2538 : c8 __ __ INY
2539 : b1 0d __ LDA (P0),y
253b : 65 45 __ ADC T1 + 1
253d : 85 45 __ STA T1 + 1
253f : a9 00 __ LDA #$00
2541 : 85 43 __ STA T0 + 0
2543 : a4 43 __ LDY T0 + 0
2545 : b1 11 __ LDA (P4),y
2547 : f0 18 __ BEQ $2561
2549 : 85 4e __ STA T6 + 0
254b : 4a __ __ LSR
254c : 4a __ __ LSR
254d : 4a __ __ LSR
254e : 4a __ __ LSR
254f : 4a __ __ LSR
2550 : aa __ __ TAX
2551 : bd 3d 45 LDA $453d,x ; (p2smap + 0)
2554 : 45 4e __ EOR T6 + 0
2556 : 91 48 __ STA (T3 + 0),y
2558 : a5 13 __ LDA P6
255a : 91 44 __ STA (T1 + 0),y
255c : e6 43 __ INC T0 + 0
255e : 4c 43 25 JMP $2543 ; (cwin_putat_string + 55)
2561 : 84 1b __ STY ACCU + 0
2563 : 60 __ __ RTS
--------------------------------------------------------------------
p2smap:
453d : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
2564 : __ __ __ BYT 25 73 00                                        : %s.
--------------------------------------------------------------------
z:
45c7 : __ __ __ BSS	2
--------------------------------------------------------------------
strlen:
2567 : ea __ __ NOP
2568 : a0 00 __ LDY #$00
256a : b1 0d __ LDA (P0),y
256c : aa __ __ TAX
256d : a9 00 __ LDA #$00
256f : 85 46 __ STA T2 + 0
2571 : 85 47 __ STA T2 + 1
2573 : 8a __ __ TXA
2574 : d0 09 __ BNE $257f
2576 : a5 46 __ LDA T2 + 0
2578 : 85 1b __ STA ACCU + 0
257a : a5 47 __ LDA T2 + 1
257c : 85 1c __ STA ACCU + 1
257e : 60 __ __ RTS
257f : 18 __ __ CLC
2580 : a5 0d __ LDA P0
2582 : 65 46 __ ADC T2 + 0
2584 : 85 48 __ STA T3 + 0
2586 : a5 0e __ LDA P1
2588 : 65 47 __ ADC T2 + 1
258a : 85 49 __ STA T3 + 1
258c : a0 01 __ LDY #$01
258e : b1 48 __ LDA (T3 + 0),y
2590 : aa __ __ TAX
2591 : e6 46 __ INC T2 + 0
2593 : d0 de __ BNE $2573
2595 : e6 47 __ INC T2 + 1
2597 : 4c 73 25 JMP $2573 ; (strlen + 12)
--------------------------------------------------------------------
259a : __ __ __ BYT 45 51 55 41 4c 53 20 20 00                      : EQUALS  .
--------------------------------------------------------------------
25a3 : __ __ __ BYT 53 45 43 4f 4e 44 20 00                         : SECOND .
--------------------------------------------------------------------
25ab : __ __ __ BYT 55 4e 44 45 54 45 52 4d 49 4e 45 44 20 00       : UNDETERMINED .
--------------------------------------------------------------------
25b9 : __ __ __ BYT 41 00                                           : A.
--------------------------------------------------------------------
25bb : __ __ __ BYT 42 00                                           : B.
--------------------------------------------------------------------
25bd : __ __ __ BYT 43 00                                           : C.
--------------------------------------------------------------------
25bf : __ __ __ BYT 44 00                                           : D.
--------------------------------------------------------------------
25c1 : __ __ __ BYT 45 00                                           : E.
--------------------------------------------------------------------
25c3 : __ __ __ BYT 46 00                                           : F.
--------------------------------------------------------------------
25c5 : __ __ __ BYT 47 00                                           : G.
--------------------------------------------------------------------
25c7 : __ __ __ BYT 48 00                                           : H.
--------------------------------------------------------------------
25c9 : __ __ __ BYT 49 00                                           : I.
--------------------------------------------------------------------
25cb : __ __ __ BYT 4a 00                                           : J.
--------------------------------------------------------------------
25cd : __ __ __ BYT 4b 00                                           : K.
--------------------------------------------------------------------
25cf : __ __ __ BYT 4c 00                                           : L.
--------------------------------------------------------------------
25d1 : __ __ __ BYT 4d 00                                           : M.
--------------------------------------------------------------------
25d3 : __ __ __ BYT 4e 00                                           : N.
--------------------------------------------------------------------
25d5 : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
25d7 : __ __ __ BYT 50 00                                           : P.
--------------------------------------------------------------------
25d9 : __ __ __ BYT 51 00                                           : Q.
--------------------------------------------------------------------
25db : __ __ __ BYT 52 00                                           : R.
--------------------------------------------------------------------
25dd : __ __ __ BYT 53 00                                           : S.
--------------------------------------------------------------------
25df : __ __ __ BYT 54 00                                           : T.
--------------------------------------------------------------------
25e1 : __ __ __ BYT 55 00                                           : U.
--------------------------------------------------------------------
25e3 : __ __ __ BYT 56 00                                           : V.
--------------------------------------------------------------------
25e5 : __ __ __ BYT 57 00                                           : W.
--------------------------------------------------------------------
25e7 : __ __ __ BYT 58 00                                           : X.
--------------------------------------------------------------------
25e9 : __ __ __ BYT 59 00                                           : Y.
--------------------------------------------------------------------
25eb : __ __ __ BYT 5a 00                                           : Z.
--------------------------------------------------------------------
25ed : __ __ __ BYT 59 45 41 52 20 00                               : YEAR .
--------------------------------------------------------------------
25f3 : __ __ __ BYT 55 4e 49 4f 4e 20 00                            : UNION .
--------------------------------------------------------------------
25fa : __ __ __ BYT 4e 45 47 41 54 49 4f 4e 20 00                   : NEGATION .
--------------------------------------------------------------------
2604 : __ __ __ BYT 4d 41 54 48 20 00                               : MATH .
--------------------------------------------------------------------
260a : __ __ __ BYT 44 45 4c 54 41 20 00                            : DELTA .
--------------------------------------------------------------------
2611 : __ __ __ BYT 52 41 44 49 55 53 20 00                         : RADIUS .
--------------------------------------------------------------------
2619 : __ __ __ BYT 48 59 44 52 4f 47 45 4e 20 00                   : HYDROGEN .
--------------------------------------------------------------------
2623 : __ __ __ BYT 48 45 4c 49 55 4d 20 00                         : HELIUM .
--------------------------------------------------------------------
262b : __ __ __ BYT 43 41 52 42 4f 4e 20 00                         : CARBON .
--------------------------------------------------------------------
2633 : __ __ __ BYT 4e 49 54 52 4f 47 45 4e 20 00                   : NITROGEN .
--------------------------------------------------------------------
263d : __ __ __ BYT 25 4f 58 59 47 45 4e 64 20 00                   : %OXYGENd .
--------------------------------------------------------------------
2647 : __ __ __ BYT 41 4c 55 4d 49 4e 49 55 4d 20 00                : ALUMINIUM .
--------------------------------------------------------------------
2652 : __ __ __ BYT 53 49 4c 49 43 49 55 4d 20 00                   : SILICIUM .
--------------------------------------------------------------------
265c : __ __ __ BYT 49 52 4f 4e 20 00                               : IRON .
--------------------------------------------------------------------
2662 : __ __ __ BYT 53 4f 44 49 55 4d 20 00                         : SODIUM .
--------------------------------------------------------------------
266a : __ __ __ BYT 43 48 4c 4f 52 49 4e 45 20 00                   : CHLORINE .
--------------------------------------------------------------------
2674 : __ __ __ BYT 41 52 47 4f 4e 20 00                            : ARGON .
--------------------------------------------------------------------
267b : __ __ __ BYT 47 4f 4c 44 20 00                               : GOLD .
--------------------------------------------------------------------
2681 : __ __ __ BYT 53 49 4c 56 45 52 20 00                         : SILVER .
--------------------------------------------------------------------
2689 : __ __ __ BYT 53 55 4c 46 55 52 20 00                         : SULFUR .
--------------------------------------------------------------------
2691 : __ __ __ BYT 55 52 41 4e 49 55 4d 20 00                      : URANIUM .
--------------------------------------------------------------------
269a : __ __ __ BYT 5a 49 4e 43 20 00                               : ZINC .
--------------------------------------------------------------------
26a0 : __ __ __ BYT 54 49 4d 45 20 00                               : TIME .
--------------------------------------------------------------------
26a6 : __ __ __ BYT 46 4f 52 43 45 20 00                            : FORCE .
--------------------------------------------------------------------
26ad : __ __ __ BYT 45 4e 45 52 47 59 20 00                         : ENERGY .
--------------------------------------------------------------------
26b5 : __ __ __ BYT 50 52 45 53 53 55 52 45 20 00                   : PRESSURE .
--------------------------------------------------------------------
26bf : __ __ __ BYT 50 4f 57 45 52 20 00                            : POWER .
--------------------------------------------------------------------
26c6 : __ __ __ BYT 44 49 53 54 41 4e 43 45 20 00                   : DISTANCE .
--------------------------------------------------------------------
26d0 : __ __ __ BYT 43 48 41 52 47 45 20 00                         : CHARGE .
--------------------------------------------------------------------
26d8 : __ __ __ BYT 44 49 53 54 41 4e 43 45 20 00                   : DISTANCE .
--------------------------------------------------------------------
26e2 : __ __ __ BYT 50 48 59 53 49 43 53 20 00                      : PHYSICS .
--------------------------------------------------------------------
26eb : __ __ __ BYT 50 48 4f 54 4f 4e 20 00                         : PHOTON .
--------------------------------------------------------------------
26f3 : __ __ __ BYT 54 45 4d 50 45 52 41 54 55 52 45 20 00          : TEMPERATURE .
--------------------------------------------------------------------
2700 : __ __ __ BYT 43 45 4c 4c 20 00                               : CELL .
--------------------------------------------------------------------
2706 : __ __ __ BYT 42 49 4f 4c 4f 47 59 20 00                      : BIOLOGY .
--------------------------------------------------------------------
270f : __ __ __ BYT 4d 41 4c 45 20 00                               : MALE .
--------------------------------------------------------------------
2715 : __ __ __ BYT 46 45 4d 41 4c 45 20 00                         : FEMALE .
--------------------------------------------------------------------
271d : __ __ __ BYT 50 49 20 00                                     : PI .
--------------------------------------------------------------------
2721 : __ __ __ BYT 50 45 4f 50 4c 45 20 00                         : PEOPLE .
--------------------------------------------------------------------
2729 : __ __ __ BYT 50 45 4f 50 4c 45 20 00                         : PEOPLE .
--------------------------------------------------------------------
2731 : __ __ __ BYT 4a 55 50 49 54 45 52 20 00                      : JUPITER .
--------------------------------------------------------------------
273a : __ __ __ BYT 45 41 52 54 48 20 00                            : EARTH .
--------------------------------------------------------------------
2741 : __ __ __ BYT 4d 4f 4f 4e 20 00                               : MOON .
--------------------------------------------------------------------
2747 : __ __ __ BYT 53 55 4e 20 00                                  : SUN .
--------------------------------------------------------------------
274c : __ __ __ BYT 4d 41 52 53 20 00                               : MARS .
--------------------------------------------------------------------
2752 : __ __ __ BYT 4d 45 52 43 55 52 59 20 00                      : MERCURY .
--------------------------------------------------------------------
275b : __ __ __ BYT 4e 45 50 54 55 4e 45 20 00                      : NEPTUNE .
--------------------------------------------------------------------
2764 : __ __ __ BYT 50 4c 55 54 4f 20 00                            : PLUTO .
--------------------------------------------------------------------
276b : __ __ __ BYT 53 41 54 55 52 4e 20 00                         : SATURN .
--------------------------------------------------------------------
2773 : __ __ __ BYT 55 4e 49 56 45 52 53 45 20 00                   : UNIVERSE .
--------------------------------------------------------------------
277d : __ __ __ BYT 55 52 41 4e 55 53 20 00                         : URANUS .
--------------------------------------------------------------------
2785 : __ __ __ BYT 56 45 4e 55 53 20 00                            : VENUS .
--------------------------------------------------------------------
278c : __ __ __ BYT 45 54 43 20 00                                  : ETC .
--------------------------------------------------------------------
2791 : __ __ __ BYT 51 55 45 53 54 49 4f 4e 20 00                   : QUESTION .
--------------------------------------------------------------------
279b : __ __ __ BYT 4c 41 4e 44 20 00                               : LAND .
--------------------------------------------------------------------
27a1 : __ __ __ BYT 4f 43 45 41 4e 20 00                            : OCEAN .
--------------------------------------------------------------------
27a8 : __ __ __ BYT 53 4b 59 20 00                                  : SKY .
--------------------------------------------------------------------
27ad : __ __ __ BYT 54 41 52 47 45 54 20 00                         : TARGET .
--------------------------------------------------------------------
27b5 : __ __ __ BYT 41 47 45 20 00                                  : AGE .
--------------------------------------------------------------------
27ba : __ __ __ BYT 56 41 52 20 41 20 00                            : VAR A .
--------------------------------------------------------------------
27c1 : __ __ __ BYT 56 41 52 20 42 20 00                            : VAR B .
--------------------------------------------------------------------
27c8 : __ __ __ BYT 56 41 52 20 43 20 20 00                         : VAR C  .
--------------------------------------------------------------------
putchar:
27d0:	ENTER	0, 2
27d4:	JSR	$27db
27d7:	RETURN	0, 2
--------------------------------------------------------------------
27db : a5 0d __ LDA P0
27dd : 4c 98 1f JMP $1f98 ; (putpch + 0)
--------------------------------------------------------------------
27e0 : __ __ __ BYT 25 63 00                                        : %c.
--------------------------------------------------------------------
freg:
27e3 : b1 19 __ LDA (IP + 0),y
27e5 : c8 __ __ INY
27e6 : aa __ __ TAX
27e7 : b5 00 __ LDA $00,x
27e9 : 85 03 __ STA WORK + 0
27eb : b5 01 __ LDA $01,x
27ed : 85 04 __ STA WORK + 1
27ef : b5 02 __ LDA $02,x
27f1 : 85 05 __ STA WORK + 2
27f3 : b5 03 __ LDA WORK + 0,x
27f5 : 85 06 __ STA WORK + 3
27f7 : a5 05 __ LDA WORK + 2
27f9 : 0a __ __ ASL
27fa : a5 06 __ LDA WORK + 3
27fc : 2a __ __ ROL
27fd : 85 08 __ STA WORK + 5
27ff : f0 06 __ BEQ $2807
2801 : a5 05 __ LDA WORK + 2
2803 : 09 80 __ ORA #$80
2805 : 85 05 __ STA WORK + 2
2807 : a5 1d __ LDA ACCU + 2
2809 : 0a __ __ ASL
280a : a5 1e __ LDA ACCU + 3
280c : 2a __ __ ROL
280d : 85 07 __ STA WORK + 4
280f : f0 06 __ BEQ $2817
2811 : a5 1d __ LDA ACCU + 2
2813 : 09 80 __ ORA #$80
2815 : 85 1d __ STA ACCU + 2
2817 : 60 __ __ RTS
2818 : 06 1e __ ASL ACCU + 3
281a : a5 07 __ LDA WORK + 4
281c : 6a __ __ ROR
281d : 85 1e __ STA ACCU + 3
281f : b0 06 __ BCS $2827
2821 : a5 1d __ LDA ACCU + 2
2823 : 29 7f __ AND #$7f
2825 : 85 1d __ STA ACCU + 2
2827 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub:
2828 : a9 ff __ LDA #$ff
282a : c5 07 __ CMP WORK + 4
282c : f0 04 __ BEQ $2832
282e : c5 08 __ CMP WORK + 5
2830 : d0 11 __ BNE $2843
2832 : a5 1e __ LDA ACCU + 3
2834 : 09 7f __ ORA #$7f
2836 : 85 1e __ STA ACCU + 3
2838 : a9 80 __ LDA #$80
283a : 85 1d __ STA ACCU + 2
283c : a9 00 __ LDA #$00
283e : 85 1b __ STA ACCU + 0
2840 : 85 1c __ STA ACCU + 1
2842 : 60 __ __ RTS
2843 : 38 __ __ SEC
2844 : a5 07 __ LDA WORK + 4
2846 : e5 08 __ SBC WORK + 5
2848 : f0 38 __ BEQ $2882
284a : aa __ __ TAX
284b : b0 25 __ BCS $2872
284d : e0 e9 __ CPX #$e9
284f : b0 0e __ BCS $285f
2851 : a5 08 __ LDA WORK + 5
2853 : 85 07 __ STA WORK + 4
2855 : a9 00 __ LDA #$00
2857 : 85 1b __ STA ACCU + 0
2859 : 85 1c __ STA ACCU + 1
285b : 85 1d __ STA ACCU + 2
285d : f0 23 __ BEQ $2882
285f : a5 1d __ LDA ACCU + 2
2861 : 4a __ __ LSR
2862 : 66 1c __ ROR ACCU + 1
2864 : 66 1b __ ROR ACCU + 0
2866 : e8 __ __ INX
2867 : d0 f8 __ BNE $2861
2869 : 85 1d __ STA ACCU + 2
286b : a5 08 __ LDA WORK + 5
286d : 85 07 __ STA WORK + 4
286f : 4c 82 28 JMP $2882 ; (faddsub + 90)
2872 : e0 18 __ CPX #$18
2874 : b0 33 __ BCS $28a9
2876 : a5 05 __ LDA WORK + 2
2878 : 4a __ __ LSR
2879 : 66 04 __ ROR WORK + 1
287b : 66 03 __ ROR WORK + 0
287d : ca __ __ DEX
287e : d0 f8 __ BNE $2878
2880 : 85 05 __ STA WORK + 2
2882 : a5 1e __ LDA ACCU + 3
2884 : 29 80 __ AND #$80
2886 : 85 1e __ STA ACCU + 3
2888 : 45 06 __ EOR WORK + 3
288a : 30 31 __ BMI $28bd
288c : 18 __ __ CLC
288d : a5 1b __ LDA ACCU + 0
288f : 65 03 __ ADC WORK + 0
2891 : 85 1b __ STA ACCU + 0
2893 : a5 1c __ LDA ACCU + 1
2895 : 65 04 __ ADC WORK + 1
2897 : 85 1c __ STA ACCU + 1
2899 : a5 1d __ LDA ACCU + 2
289b : 65 05 __ ADC WORK + 2
289d : 85 1d __ STA ACCU + 2
289f : 90 08 __ BCC $28a9
28a1 : 66 1d __ ROR ACCU + 2
28a3 : 66 1c __ ROR ACCU + 1
28a5 : 66 1b __ ROR ACCU + 0
28a7 : e6 07 __ INC WORK + 4
28a9 : a5 07 __ LDA WORK + 4
28ab : c9 ff __ CMP #$ff
28ad : f0 83 __ BEQ $2832
28af : 4a __ __ LSR
28b0 : 05 1e __ ORA ACCU + 3
28b2 : 85 1e __ STA ACCU + 3
28b4 : b0 06 __ BCS $28bc
28b6 : a5 1d __ LDA ACCU + 2
28b8 : 29 7f __ AND #$7f
28ba : 85 1d __ STA ACCU + 2
28bc : 60 __ __ RTS
28bd : 38 __ __ SEC
28be : a5 1b __ LDA ACCU + 0
28c0 : e5 03 __ SBC WORK + 0
28c2 : 85 1b __ STA ACCU + 0
28c4 : a5 1c __ LDA ACCU + 1
28c6 : e5 04 __ SBC WORK + 1
28c8 : 85 1c __ STA ACCU + 1
28ca : a5 1d __ LDA ACCU + 2
28cc : e5 05 __ SBC WORK + 2
28ce : 85 1d __ STA ACCU + 2
28d0 : b0 19 __ BCS $28eb
28d2 : 38 __ __ SEC
28d3 : a9 00 __ LDA #$00
28d5 : e5 1b __ SBC ACCU + 0
28d7 : 85 1b __ STA ACCU + 0
28d9 : a9 00 __ LDA #$00
28db : e5 1c __ SBC ACCU + 1
28dd : 85 1c __ STA ACCU + 1
28df : a9 00 __ LDA #$00
28e1 : e5 1d __ SBC ACCU + 2
28e3 : 85 1d __ STA ACCU + 2
28e5 : a5 1e __ LDA ACCU + 3
28e7 : 49 80 __ EOR #$80
28e9 : 85 1e __ STA ACCU + 3
28eb : a5 1d __ LDA ACCU + 2
28ed : 30 ba __ BMI $28a9
28ef : 05 1c __ ORA ACCU + 1
28f1 : 05 1b __ ORA ACCU + 0
28f3 : f0 0f __ BEQ $2904
28f5 : c6 07 __ DEC WORK + 4
28f7 : f0 0b __ BEQ $2904
28f9 : 06 1b __ ASL ACCU + 0
28fb : 26 1c __ ROL ACCU + 1
28fd : 26 1d __ ROL ACCU + 2
28ff : 10 f4 __ BPL $28f5
2901 : 4c a9 28 JMP $28a9 ; (faddsub + 129)
2904 : a9 00 __ LDA #$00
2906 : 85 1b __ STA ACCU + 0
2908 : 85 1c __ STA ACCU + 1
290a : 85 1d __ STA ACCU + 2
290c : 85 1e __ STA ACCU + 3
290e : 60 __ __ RTS
--------------------------------------------------------------------
fmul:
290f : a5 1b __ LDA ACCU + 0
2911 : 05 1c __ ORA ACCU + 1
2913 : 05 1d __ ORA ACCU + 2
2915 : d0 03 __ BNE $291a
2917 : 85 1e __ STA ACCU + 3
2919 : 60 __ __ RTS
291a : a5 03 __ LDA WORK + 0
291c : 05 04 __ ORA WORK + 1
291e : 05 05 __ ORA WORK + 2
2920 : d0 09 __ BNE $292b
2922 : 85 1b __ STA ACCU + 0
2924 : 85 1c __ STA ACCU + 1
2926 : 85 1d __ STA ACCU + 2
2928 : 85 1e __ STA ACCU + 3
292a : 60 __ __ RTS
292b : a5 1e __ LDA ACCU + 3
292d : 45 06 __ EOR WORK + 3
292f : 29 80 __ AND #$80
2931 : 85 1e __ STA ACCU + 3
2933 : a9 ff __ LDA #$ff
2935 : c5 07 __ CMP WORK + 4
2937 : f0 42 __ BEQ $297b
2939 : c5 08 __ CMP WORK + 5
293b : f0 3e __ BEQ $297b
293d : a9 00 __ LDA #$00
293f : 85 09 __ STA WORK + 6
2941 : 85 0a __ STA WORK + 7
2943 : 85 0b __ STA $0b
2945 : a4 1b __ LDY ACCU + 0
2947 : a5 03 __ LDA WORK + 0
2949 : d0 06 __ BNE $2951
294b : a5 04 __ LDA WORK + 1
294d : f0 0a __ BEQ $2959
294f : d0 05 __ BNE $2956
2951 : 20 b0 29 JSR $29b0 ; (fmul8 + 0)
2954 : a5 04 __ LDA WORK + 1
2956 : 20 b0 29 JSR $29b0 ; (fmul8 + 0)
2959 : a5 05 __ LDA WORK + 2
295b : 20 b0 29 JSR $29b0 ; (fmul8 + 0)
295e : 38 __ __ SEC
295f : a5 0b __ LDA $0b
2961 : 30 06 __ BMI $2969
2963 : 06 09 __ ASL WORK + 6
2965 : 26 0a __ ROL WORK + 7
2967 : 2a __ __ ROL
2968 : 18 __ __ CLC
2969 : 29 7f __ AND #$7f
296b : 85 0b __ STA $0b
296d : a5 07 __ LDA WORK + 4
296f : 65 08 __ ADC WORK + 5
2971 : 90 19 __ BCC $298c
2973 : e9 7f __ SBC #$7f
2975 : b0 04 __ BCS $297b
2977 : c9 ff __ CMP #$ff
2979 : d0 15 __ BNE $2990
297b : a5 1e __ LDA ACCU + 3
297d : 09 7f __ ORA #$7f
297f : 85 1e __ STA ACCU + 3
2981 : a9 80 __ LDA #$80
2983 : 85 1d __ STA ACCU + 2
2985 : a9 00 __ LDA #$00
2987 : 85 1b __ STA ACCU + 0
2989 : 85 1c __ STA ACCU + 1
298b : 60 __ __ RTS
298c : e9 7e __ SBC #$7e
298e : 90 15 __ BCC $29a5
2990 : 4a __ __ LSR
2991 : 05 1e __ ORA ACCU + 3
2993 : 85 1e __ STA ACCU + 3
2995 : a9 00 __ LDA #$00
2997 : 6a __ __ ROR
2998 : 05 0b __ ORA $0b
299a : 85 1d __ STA ACCU + 2
299c : a5 0a __ LDA WORK + 7
299e : 85 1c __ STA ACCU + 1
29a0 : a5 09 __ LDA WORK + 6
29a2 : 85 1b __ STA ACCU + 0
29a4 : 60 __ __ RTS
29a5 : a9 00 __ LDA #$00
29a7 : 85 1b __ STA ACCU + 0
29a9 : 85 1c __ STA ACCU + 1
29ab : 85 1d __ STA ACCU + 2
29ad : 85 1e __ STA ACCU + 3
29af : 60 __ __ RTS
--------------------------------------------------------------------
fmul8:
29b0 : 38 __ __ SEC
29b1 : 6a __ __ ROR
29b2 : 90 1e __ BCC $29d2
29b4 : aa __ __ TAX
29b5 : 18 __ __ CLC
29b6 : 98 __ __ TYA
29b7 : 65 09 __ ADC WORK + 6
29b9 : 85 09 __ STA WORK + 6
29bb : a5 0a __ LDA WORK + 7
29bd : 65 1c __ ADC ACCU + 1
29bf : 85 0a __ STA WORK + 7
29c1 : a5 0b __ LDA $0b
29c3 : 65 1d __ ADC ACCU + 2
29c5 : 6a __ __ ROR
29c6 : 85 0b __ STA $0b
29c8 : 8a __ __ TXA
29c9 : 66 0a __ ROR WORK + 7
29cb : 66 09 __ ROR WORK + 6
29cd : 4a __ __ LSR
29ce : f0 0d __ BEQ $29dd
29d0 : b0 e2 __ BCS $29b4
29d2 : 66 0b __ ROR $0b
29d4 : 66 0a __ ROR WORK + 7
29d6 : 66 09 __ ROR WORK + 6
29d8 : 4a __ __ LSR
29d9 : 90 f7 __ BCC $29d2
29db : d0 d7 __ BNE $29b4
29dd : 60 __ __ RTS
--------------------------------------------------------------------
fdiv:
29de : a5 1b __ LDA ACCU + 0
29e0 : 05 1c __ ORA ACCU + 1
29e2 : 05 1d __ ORA ACCU + 2
29e4 : d0 03 __ BNE $29e9
29e6 : 85 1e __ STA ACCU + 3
29e8 : 60 __ __ RTS
29e9 : a5 1e __ LDA ACCU + 3
29eb : 45 06 __ EOR WORK + 3
29ed : 29 80 __ AND #$80
29ef : 85 1e __ STA ACCU + 3
29f1 : a5 08 __ LDA WORK + 5
29f3 : f0 62 __ BEQ $2a57
29f5 : a5 07 __ LDA WORK + 4
29f7 : c9 ff __ CMP #$ff
29f9 : f0 5c __ BEQ $2a57
29fb : a9 00 __ LDA #$00
29fd : 85 09 __ STA WORK + 6
29ff : 85 0a __ STA WORK + 7
2a01 : 85 0b __ STA $0b
2a03 : a2 18 __ LDX #$18
2a05 : a5 1b __ LDA ACCU + 0
2a07 : c5 03 __ CMP WORK + 0
2a09 : a5 1c __ LDA ACCU + 1
2a0b : e5 04 __ SBC WORK + 1
2a0d : a5 1d __ LDA ACCU + 2
2a0f : e5 05 __ SBC WORK + 2
2a11 : 90 13 __ BCC $2a26
2a13 : a5 1b __ LDA ACCU + 0
2a15 : e5 03 __ SBC WORK + 0
2a17 : 85 1b __ STA ACCU + 0
2a19 : a5 1c __ LDA ACCU + 1
2a1b : e5 04 __ SBC WORK + 1
2a1d : 85 1c __ STA ACCU + 1
2a1f : a5 1d __ LDA ACCU + 2
2a21 : e5 05 __ SBC WORK + 2
2a23 : 85 1d __ STA ACCU + 2
2a25 : 38 __ __ SEC
2a26 : 26 09 __ ROL WORK + 6
2a28 : 26 0a __ ROL WORK + 7
2a2a : 26 0b __ ROL $0b
2a2c : ca __ __ DEX
2a2d : f0 0a __ BEQ $2a39
2a2f : 06 1b __ ASL ACCU + 0
2a31 : 26 1c __ ROL ACCU + 1
2a33 : 26 1d __ ROL ACCU + 2
2a35 : b0 dc __ BCS $2a13
2a37 : 90 cc __ BCC $2a05
2a39 : 38 __ __ SEC
2a3a : a5 0b __ LDA $0b
2a3c : 30 06 __ BMI $2a44
2a3e : 06 09 __ ASL WORK + 6
2a40 : 26 0a __ ROL WORK + 7
2a42 : 2a __ __ ROL
2a43 : 18 __ __ CLC
2a44 : 29 7f __ AND #$7f
2a46 : 85 0b __ STA $0b
2a48 : a5 07 __ LDA WORK + 4
2a4a : e5 08 __ SBC WORK + 5
2a4c : 90 1a __ BCC $2a68
2a4e : 18 __ __ CLC
2a4f : 69 7f __ ADC #$7f
2a51 : b0 04 __ BCS $2a57
2a53 : c9 ff __ CMP #$ff
2a55 : d0 15 __ BNE $2a6c
2a57 : a5 1e __ LDA ACCU + 3
2a59 : 09 7f __ ORA #$7f
2a5b : 85 1e __ STA ACCU + 3
2a5d : a9 80 __ LDA #$80
2a5f : 85 1d __ STA ACCU + 2
2a61 : a9 00 __ LDA #$00
2a63 : 85 1c __ STA ACCU + 1
2a65 : 85 1b __ STA ACCU + 0
2a67 : 60 __ __ RTS
2a68 : 69 7f __ ADC #$7f
2a6a : 90 15 __ BCC $2a81
2a6c : 4a __ __ LSR
2a6d : 05 1e __ ORA ACCU + 3
2a6f : 85 1e __ STA ACCU + 3
2a71 : a9 00 __ LDA #$00
2a73 : 6a __ __ ROR
2a74 : 05 0b __ ORA $0b
2a76 : 85 1d __ STA ACCU + 2
2a78 : a5 0a __ LDA WORK + 7
2a7a : 85 1c __ STA ACCU + 1
2a7c : a5 09 __ LDA WORK + 6
2a7e : 85 1b __ STA ACCU + 0
2a80 : 60 __ __ RTS
2a81 : a9 00 __ LDA #$00
2a83 : 85 1e __ STA ACCU + 3
2a85 : 85 1d __ STA ACCU + 2
2a87 : 85 1c __ STA ACCU + 1
2a89 : 85 1b __ STA ACCU + 0
2a8b : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
2a8c : 38 __ __ SEC
2a8d : a9 00 __ LDA #$00
2a8f : e5 1b __ SBC ACCU + 0
2a91 : 85 1b __ STA ACCU + 0
2a93 : a9 00 __ LDA #$00
2a95 : e5 1c __ SBC ACCU + 1
2a97 : 85 1c __ STA ACCU + 1
2a99 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
2a9a : 38 __ __ SEC
2a9b : a9 00 __ LDA #$00
2a9d : e5 03 __ SBC WORK + 0
2a9f : 85 03 __ STA WORK + 0
2aa1 : a9 00 __ LDA #$00
2aa3 : e5 04 __ SBC WORK + 1
2aa5 : 85 04 __ STA WORK + 1
2aa7 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
2aa8 : a5 1c __ LDA ACCU + 1
2aaa : d0 31 __ BNE $2add
2aac : a5 04 __ LDA WORK + 1
2aae : d0 1e __ BNE $2ace
2ab0 : 85 06 __ STA WORK + 3
2ab2 : a2 04 __ LDX #$04
2ab4 : 06 1b __ ASL ACCU + 0
2ab6 : 2a __ __ ROL
2ab7 : c5 03 __ CMP WORK + 0
2ab9 : 90 02 __ BCC $2abd
2abb : e5 03 __ SBC WORK + 0
2abd : 26 1b __ ROL ACCU + 0
2abf : 2a __ __ ROL
2ac0 : c5 03 __ CMP WORK + 0
2ac2 : 90 02 __ BCC $2ac6
2ac4 : e5 03 __ SBC WORK + 0
2ac6 : 26 1b __ ROL ACCU + 0
2ac8 : ca __ __ DEX
2ac9 : d0 eb __ BNE $2ab6
2acb : 85 05 __ STA WORK + 2
2acd : 60 __ __ RTS
2ace : a5 1b __ LDA ACCU + 0
2ad0 : 85 05 __ STA WORK + 2
2ad2 : a5 1c __ LDA ACCU + 1
2ad4 : 85 06 __ STA WORK + 3
2ad6 : a9 00 __ LDA #$00
2ad8 : 85 1b __ STA ACCU + 0
2ada : 85 1c __ STA ACCU + 1
2adc : 60 __ __ RTS
2add : a5 04 __ LDA WORK + 1
2adf : d0 1f __ BNE $2b00
2ae1 : a5 03 __ LDA WORK + 0
2ae3 : 30 1b __ BMI $2b00
2ae5 : a9 00 __ LDA #$00
2ae7 : 85 06 __ STA WORK + 3
2ae9 : a2 10 __ LDX #$10
2aeb : 06 1b __ ASL ACCU + 0
2aed : 26 1c __ ROL ACCU + 1
2aef : 2a __ __ ROL
2af0 : c5 03 __ CMP WORK + 0
2af2 : 90 02 __ BCC $2af6
2af4 : e5 03 __ SBC WORK + 0
2af6 : 26 1b __ ROL ACCU + 0
2af8 : 26 1c __ ROL ACCU + 1
2afa : ca __ __ DEX
2afb : d0 f2 __ BNE $2aef
2afd : 85 05 __ STA WORK + 2
2aff : 60 __ __ RTS
2b00 : a9 00 __ LDA #$00
2b02 : 85 05 __ STA WORK + 2
2b04 : 85 06 __ STA WORK + 3
2b06 : 84 02 __ STY $02
2b08 : a0 10 __ LDY #$10
2b0a : 18 __ __ CLC
2b0b : 26 1b __ ROL ACCU + 0
2b0d : 26 1c __ ROL ACCU + 1
2b0f : 26 05 __ ROL WORK + 2
2b11 : 26 06 __ ROL WORK + 3
2b13 : 38 __ __ SEC
2b14 : a5 05 __ LDA WORK + 2
2b16 : e5 03 __ SBC WORK + 0
2b18 : aa __ __ TAX
2b19 : a5 06 __ LDA WORK + 3
2b1b : e5 04 __ SBC WORK + 1
2b1d : 90 04 __ BCC $2b23
2b1f : 86 05 __ STX WORK + 2
2b21 : 85 06 __ STA WORK + 3
2b23 : 88 __ __ DEY
2b24 : d0 e5 __ BNE $2b0b
2b26 : 26 1b __ ROL ACCU + 0
2b28 : 26 1c __ ROL ACCU + 1
2b2a : a4 02 __ LDY $02
2b2c : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16:
2b2d : 20 07 28 JSR $2807 ; (freg + 36)
2b30 : a5 07 __ LDA WORK + 4
2b32 : c9 7f __ CMP #$7f
2b34 : b0 07 __ BCS $2b3d
2b36 : a9 00 __ LDA #$00
2b38 : 85 1b __ STA ACCU + 0
2b3a : 85 1c __ STA ACCU + 1
2b3c : 60 __ __ RTS
2b3d : 38 __ __ SEC
2b3e : e9 8e __ SBC #$8e
2b40 : 90 0a __ BCC $2b4c
2b42 : a9 ff __ LDA #$ff
2b44 : 85 1b __ STA ACCU + 0
2b46 : a9 7f __ LDA #$7f
2b48 : 85 1c __ STA ACCU + 1
2b4a : d0 08 __ BNE $2b54
2b4c : aa __ __ TAX
2b4d : 46 1d __ LSR ACCU + 2
2b4f : 66 1c __ ROR ACCU + 1
2b51 : e8 __ __ INX
2b52 : d0 f9 __ BNE $2b4d
2b54 : 24 1e __ BIT ACCU + 3
2b56 : 10 0e __ BPL $2b66
2b58 : 38 __ __ SEC
2b59 : a9 00 __ LDA #$00
2b5b : e5 1c __ SBC ACCU + 1
2b5d : 85 1b __ STA ACCU + 0
2b5f : a9 00 __ LDA #$00
2b61 : e5 1d __ SBC ACCU + 2
2b63 : 85 1c __ STA ACCU + 1
2b65 : 60 __ __ RTS
2b66 : a5 1c __ LDA ACCU + 1
2b68 : 85 1b __ STA ACCU + 0
2b6a : a5 1d __ LDA ACCU + 2
2b6c : 85 1c __ STA ACCU + 1
2b6e : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float:
2b6f : 24 1c __ BIT ACCU + 1
2b71 : 30 03 __ BMI $2b76
2b73 : 4c 8d 2b JMP $2b8d ; (uint16_to_float + 0)
2b76 : 38 __ __ SEC
2b77 : a9 00 __ LDA #$00
2b79 : e5 1b __ SBC ACCU + 0
2b7b : 85 1b __ STA ACCU + 0
2b7d : a9 00 __ LDA #$00
2b7f : e5 1c __ SBC ACCU + 1
2b81 : 85 1c __ STA ACCU + 1
2b83 : 20 8d 2b JSR $2b8d ; (uint16_to_float + 0)
2b86 : a5 1e __ LDA ACCU + 3
2b88 : 09 80 __ ORA #$80
2b8a : 85 1e __ STA ACCU + 3
2b8c : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float:
2b8d : a5 1b __ LDA ACCU + 0
2b8f : 05 1c __ ORA ACCU + 1
2b91 : d0 05 __ BNE $2b98
2b93 : 85 1d __ STA ACCU + 2
2b95 : 85 1e __ STA ACCU + 3
2b97 : 60 __ __ RTS
2b98 : a2 8e __ LDX #$8e
2b9a : a5 1c __ LDA ACCU + 1
2b9c : 30 06 __ BMI $2ba4
2b9e : ca __ __ DEX
2b9f : 06 1b __ ASL ACCU + 0
2ba1 : 2a __ __ ROL
2ba2 : 10 fa __ BPL $2b9e
2ba4 : 29 7f __ AND #$7f
2ba6 : 85 1d __ STA ACCU + 2
2ba8 : a5 1b __ LDA ACCU + 0
2baa : 85 1c __ STA ACCU + 1
2bac : 8a __ __ TXA
2bad : 4a __ __ LSR
2bae : 85 1e __ STA ACCU + 3
2bb0 : a9 00 __ LDA #$00
2bb2 : 85 1b __ STA ACCU + 0
2bb4 : 6a __ __ ROR
2bb5 : 05 1d __ ORA ACCU + 2
2bb7 : 85 1d __ STA ACCU + 2
2bb9 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu32:
2bba : 38 __ __ SEC
2bbb : a9 00 __ LDA #$00
2bbd : e5 1b __ SBC ACCU + 0
2bbf : 85 1b __ STA ACCU + 0
2bc1 : a9 00 __ LDA #$00
2bc3 : e5 1c __ SBC ACCU + 1
2bc5 : 85 1c __ STA ACCU + 1
2bc7 : a9 00 __ LDA #$00
2bc9 : e5 1d __ SBC ACCU + 2
2bcb : 85 1d __ STA ACCU + 2
2bcd : a9 00 __ LDA #$00
2bcf : e5 1e __ SBC ACCU + 3
2bd1 : 85 1e __ STA ACCU + 3
2bd3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32:
2bd4 : 84 02 __ STY $02
2bd6 : a0 20 __ LDY #$20
2bd8 : a9 00 __ LDA #$00
2bda : 85 07 __ STA WORK + 4
2bdc : 85 08 __ STA WORK + 5
2bde : 85 09 __ STA WORK + 6
2be0 : 85 0a __ STA WORK + 7
2be2 : a5 05 __ LDA WORK + 2
2be4 : 05 06 __ ORA WORK + 3
2be6 : d0 39 __ BNE $2c21
2be8 : 18 __ __ CLC
2be9 : 26 1b __ ROL ACCU + 0
2beb : 26 1c __ ROL ACCU + 1
2bed : 26 1d __ ROL ACCU + 2
2bef : 26 1e __ ROL ACCU + 3
2bf1 : 26 07 __ ROL WORK + 4
2bf3 : 26 08 __ ROL WORK + 5
2bf5 : 90 0c __ BCC $2c03
2bf7 : a5 07 __ LDA WORK + 4
2bf9 : e5 03 __ SBC WORK + 0
2bfb : aa __ __ TAX
2bfc : a5 08 __ LDA WORK + 5
2bfe : e5 04 __ SBC WORK + 1
2c00 : 38 __ __ SEC
2c01 : b0 0c __ BCS $2c0f
2c03 : 38 __ __ SEC
2c04 : a5 07 __ LDA WORK + 4
2c06 : e5 03 __ SBC WORK + 0
2c08 : aa __ __ TAX
2c09 : a5 08 __ LDA WORK + 5
2c0b : e5 04 __ SBC WORK + 1
2c0d : 90 04 __ BCC $2c13
2c0f : 86 07 __ STX WORK + 4
2c11 : 85 08 __ STA WORK + 5
2c13 : 88 __ __ DEY
2c14 : d0 d3 __ BNE $2be9
2c16 : 26 1b __ ROL ACCU + 0
2c18 : 26 1c __ ROL ACCU + 1
2c1a : 26 1d __ ROL ACCU + 2
2c1c : 26 1e __ ROL ACCU + 3
2c1e : a4 02 __ LDY $02
2c20 : 60 __ __ RTS
2c21 : 18 __ __ CLC
2c22 : 26 1b __ ROL ACCU + 0
2c24 : 26 1c __ ROL ACCU + 1
2c26 : 26 1d __ ROL ACCU + 2
2c28 : 26 1e __ ROL ACCU + 3
2c2a : 26 07 __ ROL WORK + 4
2c2c : 26 08 __ ROL WORK + 5
2c2e : 26 09 __ ROL WORK + 6
2c30 : 26 0a __ ROL WORK + 7
2c32 : a5 07 __ LDA WORK + 4
2c34 : c5 03 __ CMP WORK + 0
2c36 : a5 08 __ LDA WORK + 5
2c38 : e5 04 __ SBC WORK + 1
2c3a : a5 09 __ LDA WORK + 6
2c3c : e5 05 __ SBC WORK + 2
2c3e : a5 0a __ LDA WORK + 7
2c40 : e5 06 __ SBC WORK + 3
2c42 : 90 18 __ BCC $2c5c
2c44 : a5 07 __ LDA WORK + 4
2c46 : e5 03 __ SBC WORK + 0
2c48 : 85 07 __ STA WORK + 4
2c4a : a5 08 __ LDA WORK + 5
2c4c : e5 04 __ SBC WORK + 1
2c4e : 85 08 __ STA WORK + 5
2c50 : a5 09 __ LDA WORK + 6
2c52 : e5 05 __ SBC WORK + 2
2c54 : 85 09 __ STA WORK + 6
2c56 : a5 0a __ LDA WORK + 7
2c58 : e5 06 __ SBC WORK + 3
2c5a : 85 0a __ STA WORK + 7
2c5c : 88 __ __ DEY
2c5d : d0 c3 __ BNE $2c22
2c5f : 26 1b __ ROL ACCU + 0
2c61 : 26 1c __ ROL ACCU + 1
2c63 : 26 1d __ ROL ACCU + 2
2c65 : 26 1e __ ROL ACCU + 3
2c67 : a4 02 __ LDY $02
2c69 : 60 __ __ RTS
--------------------------------------------------------------------
inp_op_ext_u16:
2c6a : a9 00 __ LDA #$00
2c6c : 85 1d __ STA ACCU + 2
2c6e : 85 1e __ STA ACCU + 3
2c70 : 60 __ __ RTS
--------------------------------------------------------------------
inp_binop_div_u32:
2c71 : b5 00 __ LDA $00,x
2c73 : 85 03 __ STA WORK + 0
2c75 : b5 01 __ LDA $01,x
2c77 : 85 04 __ STA WORK + 1
2c79 : b5 02 __ LDA $02,x
2c7b : 85 05 __ STA WORK + 2
2c7d : b5 03 __ LDA WORK + 0,x
2c7f : 85 06 __ STA WORK + 3
2c81 : 20 d4 2b JSR $2bd4 ; (divmod32 + 0)
2c84 : 60 __ __ RTS
--------------------------------------------------------------------
inp_binop_mod_u32:
2c85 : b5 00 __ LDA $00,x
2c87 : 85 03 __ STA WORK + 0
2c89 : b5 01 __ LDA $01,x
2c8b : 85 04 __ STA WORK + 1
2c8d : b5 02 __ LDA $02,x
2c8f : 85 05 __ STA WORK + 2
2c91 : b5 03 __ LDA WORK + 0,x
2c93 : 85 06 __ STA WORK + 3
2c95 : 20 d4 2b JSR $2bd4 ; (divmod32 + 0)
2c98 : a5 07 __ LDA WORK + 4
2c9a : 85 1b __ STA ACCU + 0
2c9c : a5 08 __ LDA WORK + 5
2c9e : 85 1c __ STA ACCU + 1
2ca0 : a5 09 __ LDA WORK + 6
2ca2 : 85 1d __ STA ACCU + 2
2ca4 : a5 0a __ LDA WORK + 7
2ca6 : 85 1e __ STA ACCU + 3
2ca8 : 60 __ __ RTS
--------------------------------------------------------------------
inp_op_cmp_u32:
2ca9 : b5 03 __ LDA WORK + 0,x
2cab : c5 1e __ CMP ACCU + 3
2cad : d0 20 __ BNE $2ccf
2caf : b5 02 __ LDA $02,x
2cb1 : c5 1d __ CMP ACCU + 2
2cb3 : d0 1a __ BNE $2ccf
2cb5 : b5 01 __ LDA $01,x
2cb7 : c5 1c __ CMP ACCU + 1
2cb9 : d0 14 __ BNE $2ccf
2cbb : b5 00 __ LDA $00,x
2cbd : c5 1b __ CMP ACCU + 0
2cbf : d0 0e __ BNE $2ccf
2cc1 : a9 00 __ LDA #$00
2cc3 : 85 1b __ STA ACCU + 0
2cc5 : 85 1c __ STA ACCU + 1
2cc7 : 60 __ __ RTS
2cc8 : a9 ff __ LDA #$ff
2cca : 85 1b __ STA ACCU + 0
2ccc : 85 1c __ STA ACCU + 1
2cce : 60 __ __ RTS
2ccf : 90 f7 __ BCC $2cc8
2cd1 : a9 01 __ LDA #$01
2cd3 : 85 1b __ STA ACCU + 0
2cd5 : a9 00 __ LDA #$00
2cd7 : 85 1c __ STA ACCU + 1
2cd9 : 60 __ __ RTS
--------------------------------------------------------------------
inp_op_cmp_s32:
2cda : a5 1e __ LDA ACCU + 3
2cdc : 49 80 __ EOR #$80
2cde : 85 1e __ STA ACCU + 3
2ce0 : b5 03 __ LDA WORK + 0,x
2ce2 : 49 80 __ EOR #$80
2ce4 : c5 1e __ CMP ACCU + 3
2ce6 : d0 20 __ BNE $2d08
2ce8 : b5 02 __ LDA $02,x
2cea : c5 1d __ CMP ACCU + 2
2cec : d0 1a __ BNE $2d08
2cee : b5 01 __ LDA $01,x
2cf0 : c5 1c __ CMP ACCU + 1
2cf2 : d0 14 __ BNE $2d08
2cf4 : b5 00 __ LDA $00,x
2cf6 : c5 1b __ CMP ACCU + 0
2cf8 : d0 0e __ BNE $2d08
2cfa : a9 00 __ LDA #$00
2cfc : 85 1b __ STA ACCU + 0
2cfe : 85 1c __ STA ACCU + 1
2d00 : 60 __ __ RTS
2d01 : a9 ff __ LDA #$ff
2d03 : 85 1b __ STA ACCU + 0
2d05 : 85 1c __ STA ACCU + 1
2d07 : 60 __ __ RTS
2d08 : 90 f7 __ BCC $2d01
2d0a : a9 01 __ LDA #$01
2d0c : 85 1b __ STA ACCU + 0
2d0e : a9 00 __ LDA #$00
2d10 : 85 1c __ STA ACCU + 1
2d12 : 60 __ __ RTS
--------------------------------------------------------------------
inp_nop:
2d13 : 4c 5e 08 JMP $085e ; (startup + 93)
--------------------------------------------------------------------
inp_const_8:
2d16 : b1 19 __ LDA (IP + 0),y
2d18 : aa __ __ TAX
2d19 : c8 __ __ INY
2d1a : b1 19 __ LDA (IP + 0),y
2d1c : 95 00 __ STA $00,x
2d1e : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_const_p8:
2d21 : b1 19 __ LDA (IP + 0),y
2d23 : aa __ __ TAX
2d24 : c8 __ __ INY
2d25 : b1 19 __ LDA (IP + 0),y
2d27 : 95 00 __ STA $00,x
2d29 : a9 00 __ LDA #$00
2d2b : 95 01 __ STA $01,x
2d2d : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_const_16:
2d30 : b1 19 __ LDA (IP + 0),y
2d32 : aa __ __ TAX
2d33 : c8 __ __ INY
2d34 : b1 19 __ LDA (IP + 0),y
2d36 : 95 00 __ STA $00,x
2d38 : c8 __ __ INY
2d39 : b1 19 __ LDA (IP + 0),y
2d3b : 95 01 __ STA $01,x
2d3d : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_const_32:
2d40 : b1 19 __ LDA (IP + 0),y
2d42 : aa __ __ TAX
2d43 : c8 __ __ INY
2d44 : b1 19 __ LDA (IP + 0),y
2d46 : 95 00 __ STA $00,x
2d48 : c8 __ __ INY
2d49 : b1 19 __ LDA (IP + 0),y
2d4b : 95 01 __ STA $01,x
2d4d : c8 __ __ INY
2d4e : b1 19 __ LDA (IP + 0),y
2d50 : 95 02 __ STA $02,x
2d52 : c8 __ __ INY
2d53 : b1 19 __ LDA (IP + 0),y
2d55 : 95 03 __ STA WORK + 0,x
2d57 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_load_reg_8:
2d5a : b1 19 __ LDA (IP + 0),y
2d5c : aa __ __ TAX
2d5d : b5 00 __ LDA $00,x
2d5f : 85 1b __ STA ACCU + 0
2d61 : a9 00 __ LDA #$00
2d63 : 85 1c __ STA ACCU + 1
2d65 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_store_reg_8:
2d68 : b1 19 __ LDA (IP + 0),y
2d6a : aa __ __ TAX
2d6b : a5 1b __ LDA ACCU + 0
2d6d : 95 00 __ STA $00,x
2d6f : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_load_reg_16:
2d72 : b1 19 __ LDA (IP + 0),y
2d74 : aa __ __ TAX
2d75 : b5 00 __ LDA $00,x
2d77 : 85 1b __ STA ACCU + 0
2d79 : b5 01 __ LDA $01,x
2d7b : 85 1c __ STA ACCU + 1
2d7d : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_store_reg_16:
2d80 : b1 19 __ LDA (IP + 0),y
2d82 : aa __ __ TAX
2d83 : a5 1b __ LDA ACCU + 0
2d85 : 95 00 __ STA $00,x
2d87 : a5 1c __ LDA ACCU + 1
2d89 : 95 01 __ STA $01,x
2d8b : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_addr_reg:
2d8e : b1 19 __ LDA (IP + 0),y
2d90 : aa __ __ TAX
2d91 : b5 00 __ LDA $00,x
2d93 : 85 1f __ STA ADDR + 0
2d95 : b5 01 __ LDA $01,x
2d97 : 85 20 __ STA ADDR + 1
2d99 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_load_reg_32:
2d9c : b1 19 __ LDA (IP + 0),y
2d9e : aa __ __ TAX
2d9f : b5 00 __ LDA $00,x
2da1 : 85 1b __ STA ACCU + 0
2da3 : b5 01 __ LDA $01,x
2da5 : 85 1c __ STA ACCU + 1
2da7 : b5 02 __ LDA $02,x
2da9 : 85 1d __ STA ACCU + 2
2dab : b5 03 __ LDA WORK + 0,x
2dad : 85 1e __ STA ACCU + 3
2daf : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_store_reg_32:
2db2 : b1 19 __ LDA (IP + 0),y
2db4 : aa __ __ TAX
2db5 : a5 1b __ LDA ACCU + 0
2db7 : 95 00 __ STA $00,x
2db9 : a5 1c __ LDA ACCU + 1
2dbb : 95 01 __ STA $01,x
2dbd : a5 1d __ LDA ACCU + 2
2dbf : 95 02 __ STA $02,x
2dc1 : a5 1e __ LDA ACCU + 3
2dc3 : 95 03 __ STA WORK + 0,x
2dc5 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_load_abs_8:
2dc8 : b1 19 __ LDA (IP + 0),y
2dca : 85 1f __ STA ADDR + 0
2dcc : c8 __ __ INY
2dcd : b1 19 __ LDA (IP + 0),y
2dcf : 85 20 __ STA ADDR + 1
2dd1 : c8 __ __ INY
2dd2 : b1 19 __ LDA (IP + 0),y
2dd4 : aa __ __ TAX
2dd5 : 84 02 __ STY $02
2dd7 : a0 00 __ LDY #$00
2dd9 : b1 1f __ LDA (ADDR + 0),y
2ddb : 95 00 __ STA $00,x
2ddd : 4c 52 08 JMP $0852 ; (startup + 81)
2de0 : b1 19 __ LDA (IP + 0),y
2de2 : aa __ __ TAX
2de3 : c8 __ __ INY
2de4 : b1 19 __ LDA (IP + 0),y
2de6 : 84 02 __ STY $02
2de8 : a8 __ __ TAY
2de9 : 4c d9 2d JMP $2dd9 ; (inp_load_abs_8 + 17)
--------------------------------------------------------------------
inp_load_abs_u8:
2dec : b1 19 __ LDA (IP + 0),y
2dee : 85 1f __ STA ADDR + 0
2df0 : c8 __ __ INY
2df1 : b1 19 __ LDA (IP + 0),y
2df3 : 85 20 __ STA ADDR + 1
2df5 : c8 __ __ INY
2df6 : b1 19 __ LDA (IP + 0),y
2df8 : aa __ __ TAX
2df9 : 84 02 __ STY $02
2dfb : a0 00 __ LDY #$00
2dfd : b1 1f __ LDA (ADDR + 0),y
2dff : 95 00 __ STA $00,x
2e01 : a9 00 __ LDA #$00
2e03 : 95 01 __ STA $01,x
2e05 : 4c 52 08 JMP $0852 ; (startup + 81)
2e08 : b1 19 __ LDA (IP + 0),y
2e0a : aa __ __ TAX
2e0b : c8 __ __ INY
2e0c : b1 19 __ LDA (IP + 0),y
2e0e : 84 02 __ STY $02
2e10 : a8 __ __ TAY
2e11 : 4c fd 2d JMP $2dfd ; (inp_load_abs_u8 + 17)
--------------------------------------------------------------------
inp_load_abs_16:
2e14 : b1 19 __ LDA (IP + 0),y
2e16 : 85 1f __ STA ADDR + 0
2e18 : c8 __ __ INY
2e19 : b1 19 __ LDA (IP + 0),y
2e1b : 85 20 __ STA ADDR + 1
2e1d : c8 __ __ INY
2e1e : b1 19 __ LDA (IP + 0),y
2e20 : aa __ __ TAX
2e21 : 84 02 __ STY $02
2e23 : a0 00 __ LDY #$00
2e25 : b1 1f __ LDA (ADDR + 0),y
2e27 : 95 00 __ STA $00,x
2e29 : c8 __ __ INY
2e2a : b1 1f __ LDA (ADDR + 0),y
2e2c : 95 01 __ STA $01,x
2e2e : 4c 52 08 JMP $0852 ; (startup + 81)
2e31 : b1 19 __ LDA (IP + 0),y
2e33 : aa __ __ TAX
2e34 : c8 __ __ INY
2e35 : b1 19 __ LDA (IP + 0),y
2e37 : 84 02 __ STY $02
2e39 : a8 __ __ TAY
2e3a : 4c 25 2e JMP $2e25 ; (inp_load_abs_16 + 17)
--------------------------------------------------------------------
inp_store_abs_8:
2e3d : b1 19 __ LDA (IP + 0),y
2e3f : 85 1f __ STA ADDR + 0
2e41 : c8 __ __ INY
2e42 : b1 19 __ LDA (IP + 0),y
2e44 : 85 20 __ STA ADDR + 1
2e46 : c8 __ __ INY
2e47 : b1 19 __ LDA (IP + 0),y
2e49 : aa __ __ TAX
2e4a : 84 02 __ STY $02
2e4c : a0 00 __ LDY #$00
2e4e : b5 00 __ LDA $00,x
2e50 : 91 1f __ STA (ADDR + 0),y
2e52 : 4c 52 08 JMP $0852 ; (startup + 81)
2e55 : b1 19 __ LDA (IP + 0),y
2e57 : aa __ __ TAX
2e58 : c8 __ __ INY
2e59 : b1 19 __ LDA (IP + 0),y
2e5b : 84 02 __ STY $02
2e5d : a8 __ __ TAY
2e5e : 4c 4e 2e JMP $2e4e ; (inp_store_abs_8 + 17)
--------------------------------------------------------------------
inp_store_abs_16:
2e61 : b1 19 __ LDA (IP + 0),y
2e63 : 85 1f __ STA ADDR + 0
2e65 : c8 __ __ INY
2e66 : b1 19 __ LDA (IP + 0),y
2e68 : 85 20 __ STA ADDR + 1
2e6a : c8 __ __ INY
2e6b : b1 19 __ LDA (IP + 0),y
2e6d : aa __ __ TAX
2e6e : 84 02 __ STY $02
2e70 : a0 00 __ LDY #$00
2e72 : b5 00 __ LDA $00,x
2e74 : 91 1f __ STA (ADDR + 0),y
2e76 : c8 __ __ INY
2e77 : b5 01 __ LDA $01,x
2e79 : 91 1f __ STA (ADDR + 0),y
2e7b : 4c 52 08 JMP $0852 ; (startup + 81)
2e7e : b1 19 __ LDA (IP + 0),y
2e80 : aa __ __ TAX
2e81 : c8 __ __ INY
2e82 : b1 19 __ LDA (IP + 0),y
2e84 : 84 02 __ STY $02
2e86 : a8 __ __ TAY
2e87 : 4c 72 2e JMP $2e72 ; (inp_store_abs_16 + 17)
--------------------------------------------------------------------
inp_store_abs_32:
2e8a : b1 19 __ LDA (IP + 0),y
2e8c : 85 1f __ STA ADDR + 0
2e8e : c8 __ __ INY
2e8f : b1 19 __ LDA (IP + 0),y
2e91 : 85 20 __ STA ADDR + 1
2e93 : c8 __ __ INY
2e94 : b1 19 __ LDA (IP + 0),y
2e96 : aa __ __ TAX
2e97 : 84 02 __ STY $02
2e99 : a0 00 __ LDY #$00
2e9b : b5 00 __ LDA $00,x
2e9d : 91 1f __ STA (ADDR + 0),y
2e9f : c8 __ __ INY
2ea0 : b5 01 __ LDA $01,x
2ea2 : 91 1f __ STA (ADDR + 0),y
2ea4 : c8 __ __ INY
2ea5 : b5 02 __ LDA $02,x
2ea7 : 91 1f __ STA (ADDR + 0),y
2ea9 : c8 __ __ INY
2eaa : b5 03 __ LDA WORK + 0,x
2eac : 91 1f __ STA (ADDR + 0),y
2eae : 4c 52 08 JMP $0852 ; (startup + 81)
2eb1 : b1 19 __ LDA (IP + 0),y
2eb3 : aa __ __ TAX
2eb4 : c8 __ __ INY
2eb5 : b1 19 __ LDA (IP + 0),y
2eb7 : 84 02 __ STY $02
2eb9 : a8 __ __ TAY
2eba : 4c 9b 2e JMP $2e9b ; (inp_store_abs_32 + 17)
--------------------------------------------------------------------
inp_lea_abs:
2ebd : b1 19 __ LDA (IP + 0),y
2ebf : aa __ __ TAX
2ec0 : c8 __ __ INY
2ec1 : b1 19 __ LDA (IP + 0),y
2ec3 : 95 00 __ STA $00,x
2ec5 : c8 __ __ INY
2ec6 : b1 19 __ LDA (IP + 0),y
2ec8 : 95 01 __ STA $01,x
2eca : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_lea_abs_index:
2ecd : b1 19 __ LDA (IP + 0),y
2ecf : aa __ __ TAX
2ed0 : c8 __ __ INY
2ed1 : 18 __ __ CLC
2ed2 : b5 00 __ LDA $00,x
2ed4 : 71 19 __ ADC (IP + 0),y
2ed6 : 85 1f __ STA ADDR + 0
2ed8 : c8 __ __ INY
2ed9 : b5 01 __ LDA $01,x
2edb : 71 19 __ ADC (IP + 0),y
2edd : 85 20 __ STA ADDR + 1
2edf : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_lea_accu_index:
2ee2 : b1 19 __ LDA (IP + 0),y
2ee4 : aa __ __ TAX
2ee5 : 18 __ __ CLC
2ee6 : b5 00 __ LDA $00,x
2ee8 : 65 1b __ ADC ACCU + 0
2eea : 85 1f __ STA ADDR + 0
2eec : b5 01 __ LDA $01,x
2eee : 65 1c __ ADC ACCU + 1
2ef0 : 85 20 __ STA ADDR + 1
2ef2 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_load_local_8:
2ef5 : b1 19 __ LDA (IP + 0),y
2ef7 : aa __ __ TAX
2ef8 : c8 __ __ INY
2ef9 : b1 19 __ LDA (IP + 0),y
2efb : 84 02 __ STY $02
2efd : a8 __ __ TAY
2efe : b1 25 __ LDA (FP + 0),y
2f00 : 95 00 __ STA $00,x
2f02 : 4c 52 08 JMP $0852 ; (startup + 81)
--------------------------------------------------------------------
inp_load_local_u8:
2f05 : b1 19 __ LDA (IP + 0),y
2f07 : aa __ __ TAX
2f08 : c8 __ __ INY
2f09 : b1 19 __ LDA (IP + 0),y
2f0b : 84 02 __ STY $02
2f0d : a8 __ __ TAY
2f0e : b1 25 __ LDA (FP + 0),y
2f10 : 95 00 __ STA $00,x
2f12 : a9 00 __ LDA #$00
2f14 : 95 01 __ STA $01,x
2f16 : 4c 52 08 JMP $0852 ; (startup + 81)
--------------------------------------------------------------------
inp_load_local_16:
2f19 : b1 19 __ LDA (IP + 0),y
2f1b : aa __ __ TAX
2f1c : c8 __ __ INY
2f1d : b1 19 __ LDA (IP + 0),y
2f1f : 84 02 __ STY $02
2f21 : a8 __ __ TAY
2f22 : b1 25 __ LDA (FP + 0),y
2f24 : 95 00 __ STA $00,x
2f26 : c8 __ __ INY
2f27 : b1 25 __ LDA (FP + 0),y
2f29 : 95 01 __ STA $01,x
2f2b : 4c 52 08 JMP $0852 ; (startup + 81)
--------------------------------------------------------------------
inp_load_local_32:
2f2e : b1 19 __ LDA (IP + 0),y
2f30 : aa __ __ TAX
2f31 : c8 __ __ INY
2f32 : b1 19 __ LDA (IP + 0),y
2f34 : 84 02 __ STY $02
2f36 : a8 __ __ TAY
2f37 : b1 25 __ LDA (FP + 0),y
2f39 : 95 00 __ STA $00,x
2f3b : c8 __ __ INY
2f3c : b1 25 __ LDA (FP + 0),y
2f3e : 95 01 __ STA $01,x
2f40 : c8 __ __ INY
2f41 : b1 25 __ LDA (FP + 0),y
2f43 : 95 02 __ STA $02,x
2f45 : c8 __ __ INY
2f46 : b1 25 __ LDA (FP + 0),y
2f48 : 95 03 __ STA WORK + 0,x
2f4a : 4c 52 08 JMP $0852 ; (startup + 81)
--------------------------------------------------------------------
inp_store_local_16:
2f4d : b1 19 __ LDA (IP + 0),y
2f4f : aa __ __ TAX
2f50 : c8 __ __ INY
2f51 : b1 19 __ LDA (IP + 0),y
2f53 : 84 02 __ STY $02
2f55 : a8 __ __ TAY
2f56 : b5 00 __ LDA $00,x
2f58 : 91 25 __ STA (FP + 0),y
2f5a : c8 __ __ INY
2f5b : b5 01 __ LDA $01,x
2f5d : 91 25 __ STA (FP + 0),y
2f5f : 4c 52 08 JMP $0852 ; (startup + 81)
--------------------------------------------------------------------
inp_store_local_32:
2f62 : b1 19 __ LDA (IP + 0),y
2f64 : aa __ __ TAX
2f65 : c8 __ __ INY
2f66 : b1 19 __ LDA (IP + 0),y
2f68 : 84 02 __ STY $02
2f6a : a8 __ __ TAY
2f6b : b5 00 __ LDA $00,x
2f6d : 91 25 __ STA (FP + 0),y
2f6f : c8 __ __ INY
2f70 : b5 01 __ LDA $01,x
2f72 : 91 25 __ STA (FP + 0),y
2f74 : c8 __ __ INY
2f75 : b5 02 __ LDA $02,x
2f77 : 91 25 __ STA (FP + 0),y
2f79 : c8 __ __ INY
2f7a : b5 03 __ LDA WORK + 0,x
2f7c : 91 25 __ STA (FP + 0),y
2f7e : 4c 52 08 JMP $0852 ; (startup + 81)
--------------------------------------------------------------------
inp_lea_local:
2f81 : b1 19 __ LDA (IP + 0),y
2f83 : aa __ __ TAX
2f84 : c8 __ __ INY
2f85 : 18 __ __ CLC
2f86 : b1 19 __ LDA (IP + 0),y
2f88 : 65 25 __ ADC FP + 0
2f8a : 95 00 __ STA $00,x
2f8c : c8 __ __ INY
2f8d : b1 19 __ LDA (IP + 0),y
2f8f : 65 26 __ ADC FP + 1
2f91 : 95 01 __ STA $01,x
2f93 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_store_frame_8:
2f96 : b1 19 __ LDA (IP + 0),y
2f98 : aa __ __ TAX
2f99 : c8 __ __ INY
2f9a : b1 19 __ LDA (IP + 0),y
2f9c : 84 02 __ STY $02
2f9e : a8 __ __ TAY
2f9f : b5 00 __ LDA $00,x
2fa1 : 91 23 __ STA (SP + 0),y
2fa3 : 4c 52 08 JMP $0852 ; (startup + 81)
--------------------------------------------------------------------
inp_store_frame_16:
2fa6 : b1 19 __ LDA (IP + 0),y
2fa8 : aa __ __ TAX
2fa9 : c8 __ __ INY
2faa : b1 19 __ LDA (IP + 0),y
2fac : 84 02 __ STY $02
2fae : a8 __ __ TAY
2faf : b5 00 __ LDA $00,x
2fb1 : 91 23 __ STA (SP + 0),y
2fb3 : c8 __ __ INY
2fb4 : b5 01 __ LDA $01,x
2fb6 : 91 23 __ STA (SP + 0),y
2fb8 : 4c 52 08 JMP $0852 ; (startup + 81)
--------------------------------------------------------------------
inp_store_frame_32:
2fbb : b1 19 __ LDA (IP + 0),y
2fbd : aa __ __ TAX
2fbe : c8 __ __ INY
2fbf : b1 19 __ LDA (IP + 0),y
2fc1 : 84 02 __ STY $02
2fc3 : a8 __ __ TAY
2fc4 : b5 00 __ LDA $00,x
2fc6 : 91 23 __ STA (SP + 0),y
2fc8 : c8 __ __ INY
2fc9 : b5 01 __ LDA $01,x
2fcb : 91 23 __ STA (SP + 0),y
2fcd : c8 __ __ INY
2fce : b5 02 __ LDA $02,x
2fd0 : 91 23 __ STA (SP + 0),y
2fd2 : c8 __ __ INY
2fd3 : b5 03 __ LDA WORK + 0,x
2fd5 : 91 23 __ STA (SP + 0),y
2fd7 : 4c 52 08 JMP $0852 ; (startup + 81)
--------------------------------------------------------------------
inp_load_abs_32:
2fda : b1 19 __ LDA (IP + 0),y
2fdc : 85 1f __ STA ADDR + 0
2fde : c8 __ __ INY
2fdf : b1 19 __ LDA (IP + 0),y
2fe1 : 85 20 __ STA ADDR + 1
2fe3 : c8 __ __ INY
2fe4 : b1 19 __ LDA (IP + 0),y
2fe6 : aa __ __ TAX
2fe7 : 84 02 __ STY $02
2fe9 : a0 00 __ LDY #$00
2feb : b1 1f __ LDA (ADDR + 0),y
2fed : 95 00 __ STA $00,x
2fef : c8 __ __ INY
2ff0 : b1 1f __ LDA (ADDR + 0),y
2ff2 : 95 01 __ STA $01,x
2ff4 : c8 __ __ INY
2ff5 : b1 1f __ LDA (ADDR + 0),y
2ff7 : 95 02 __ STA $02,x
2ff9 : c8 __ __ INY
2ffa : b1 1f __ LDA (ADDR + 0),y
2ffc : 95 03 __ STA WORK + 0,x
2ffe : 4c 52 08 JMP $0852 ; (startup + 81)
3001 : b1 19 __ LDA (IP + 0),y
3003 : aa __ __ TAX
3004 : c8 __ __ INY
3005 : b1 19 __ LDA (IP + 0),y
3007 : 84 02 __ STY $02
3009 : a8 __ __ TAY
300a : 4c eb 2f JMP $2feb ; (inp_load_abs_32 + 17)
--------------------------------------------------------------------
inp_binop_addr_16:
300d : b1 19 __ LDA (IP + 0),y
300f : aa __ __ TAX
3010 : 18 __ __ CLC
3011 : a5 1b __ LDA ACCU + 0
3013 : 75 00 __ ADC $00,x
3015 : 85 1b __ STA ACCU + 0
3017 : a5 1c __ LDA ACCU + 1
3019 : 75 01 __ ADC $01,x
301b : 85 1c __ STA ACCU + 1
301d : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_subr_16:
3020 : b1 19 __ LDA (IP + 0),y
3022 : aa __ __ TAX
3023 : 38 __ __ SEC
3024 : a5 1b __ LDA ACCU + 0
3026 : f5 00 __ SBC $00,x
3028 : 85 1b __ STA ACCU + 0
302a : a5 1c __ LDA ACCU + 1
302c : f5 01 __ SBC $01,x
302e : 85 1c __ STA ACCU + 1
3030 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_orr_16:
3033 : b1 19 __ LDA (IP + 0),y
3035 : aa __ __ TAX
3036 : a5 1b __ LDA ACCU + 0
3038 : 15 00 __ ORA $00,x
303a : 85 1b __ STA ACCU + 0
303c : a5 1c __ LDA ACCU + 1
303e : 15 01 __ ORA $01,x
3040 : 85 1c __ STA ACCU + 1
3042 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_xorr_16:
3045 : b1 19 __ LDA (IP + 0),y
3047 : aa __ __ TAX
3048 : a5 1b __ LDA ACCU + 0
304a : 55 00 __ EOR $00,x
304c : 85 1b __ STA ACCU + 0
304e : a5 1c __ LDA ACCU + 1
3050 : 55 01 __ EOR $01,x
3052 : 85 1c __ STA ACCU + 1
3054 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_divr_u16:
3057 : b1 19 __ LDA (IP + 0),y
3059 : aa __ __ TAX
305a : b5 00 __ LDA $00,x
305c : 85 03 __ STA WORK + 0
305e : b5 01 __ LDA $01,x
3060 : 85 04 __ STA WORK + 1
3062 : 20 a8 2a JSR $2aa8 ; (divmod + 0)
3065 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_modr_u16:
3068 : b1 19 __ LDA (IP + 0),y
306a : aa __ __ TAX
306b : b5 00 __ LDA $00,x
306d : 85 03 __ STA WORK + 0
306f : b5 01 __ LDA $01,x
3071 : 85 04 __ STA WORK + 1
3073 : 20 a8 2a JSR $2aa8 ; (divmod + 0)
3076 : a5 05 __ LDA WORK + 2
3078 : 85 1b __ STA ACCU + 0
307a : a5 06 __ LDA WORK + 3
307c : 85 1c __ STA ACCU + 1
307e : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_divr_s16:
3081 : b1 19 __ LDA (IP + 0),y
3083 : aa __ __ TAX
3084 : b5 00 __ LDA $00,x
3086 : 85 03 __ STA WORK + 0
3088 : b5 01 __ LDA $01,x
308a : 85 04 __ STA WORK + 1
308c : 24 1c __ BIT ACCU + 1
308e : 10 10 __ BPL $30a0
3090 : 20 8c 2a JSR $2a8c ; (negaccu + 0)
3093 : 24 04 __ BIT WORK + 1
3095 : 10 10 __ BPL $30a7
3097 : 20 9a 2a JSR $2a9a ; (negtmp + 0)
309a : 20 a8 2a JSR $2aa8 ; (divmod + 0)
309d : 4c 54 08 JMP $0854 ; (startup + 83)
30a0 : 24 04 __ BIT WORK + 1
30a2 : 10 f6 __ BPL $309a
30a4 : 20 9a 2a JSR $2a9a ; (negtmp + 0)
30a7 : 20 a8 2a JSR $2aa8 ; (divmod + 0)
30aa : 20 8c 2a JSR $2a8c ; (negaccu + 0)
30ad : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_modr_s16:
30b0 : b1 19 __ LDA (IP + 0),y
30b2 : aa __ __ TAX
30b3 : b5 00 __ LDA $00,x
30b5 : 85 03 __ STA WORK + 0
30b7 : b5 01 __ LDA $01,x
30b9 : 85 04 __ STA WORK + 1
30bb : 24 1c __ BIT ACCU + 1
30bd : 10 18 __ BPL $30d7
30bf : 20 8c 2a JSR $2a8c ; (negaccu + 0)
30c2 : 24 04 __ BIT WORK + 1
30c4 : 10 18 __ BPL $30de
30c6 : 20 9a 2a JSR $2a9a ; (negtmp + 0)
30c9 : 20 a8 2a JSR $2aa8 ; (divmod + 0)
30cc : a5 05 __ LDA WORK + 2
30ce : 85 1b __ STA ACCU + 0
30d0 : a5 06 __ LDA WORK + 3
30d2 : 85 1c __ STA ACCU + 1
30d4 : 4c 54 08 JMP $0854 ; (startup + 83)
30d7 : 24 04 __ BIT WORK + 1
30d9 : 10 ee __ BPL $30c9
30db : 20 9a 2a JSR $2a9a ; (negtmp + 0)
30de : 20 a8 2a JSR $2aa8 ; (divmod + 0)
30e1 : a5 05 __ LDA WORK + 2
30e3 : 85 1b __ STA ACCU + 0
30e5 : a5 06 __ LDA WORK + 3
30e7 : 85 1c __ STA ACCU + 1
30e9 : 20 8c 2a JSR $2a8c ; (negaccu + 0)
30ec : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_adda_16:
30ef : b1 19 __ LDA (IP + 0),y
30f1 : aa __ __ TAX
30f2 : 18 __ __ CLC
30f3 : b5 00 __ LDA $00,x
30f5 : 65 1b __ ADC ACCU + 0
30f7 : 95 00 __ STA $00,x
30f9 : b5 01 __ LDA $01,x
30fb : 65 1c __ ADC ACCU + 1
30fd : 95 01 __ STA $01,x
30ff : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_addi_16:
3102 : b1 19 __ LDA (IP + 0),y
3104 : c8 __ __ INY
3105 : aa __ __ TAX
3106 : 18 __ __ CLC
3107 : b5 00 __ LDA $00,x
3109 : 71 19 __ ADC (IP + 0),y
310b : c8 __ __ INY
310c : 95 00 __ STA $00,x
310e : b5 01 __ LDA $01,x
3110 : 71 19 __ ADC (IP + 0),y
3112 : 95 01 __ STA $01,x
3114 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_subi_16:
3117 : b1 19 __ LDA (IP + 0),y
3119 : c8 __ __ INY
311a : aa __ __ TAX
311b : 38 __ __ SEC
311c : b1 19 __ LDA (IP + 0),y
311e : c8 __ __ INY
311f : f5 00 __ SBC $00,x
3121 : 95 00 __ STA $00,x
3123 : b1 19 __ LDA (IP + 0),y
3125 : f5 01 __ SBC $01,x
3127 : 95 01 __ STA $01,x
3129 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_andi_16:
312c : b1 19 __ LDA (IP + 0),y
312e : c8 __ __ INY
312f : aa __ __ TAX
3130 : b5 00 __ LDA $00,x
3132 : 31 19 __ AND (IP + 0),y
3134 : c8 __ __ INY
3135 : 95 00 __ STA $00,x
3137 : b5 01 __ LDA $01,x
3139 : 31 19 __ AND (IP + 0),y
313b : 95 01 __ STA $01,x
313d : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_muli8_16:
3140 : b1 19 __ LDA (IP + 0),y
3142 : c8 __ __ INY
3143 : aa __ __ TAX
3144 : a9 00 __ LDA #$00
3146 : 85 05 __ STA WORK + 2
3148 : 85 06 __ STA WORK + 3
314a : b5 00 __ LDA $00,x
314c : 85 03 __ STA WORK + 0
314e : b5 01 __ LDA $01,x
3150 : 85 04 __ STA WORK + 1
3152 : b1 19 __ LDA (IP + 0),y
3154 : 4a __ __ LSR
3155 : 85 07 __ STA WORK + 4
3157 : 90 0d __ BCC $3166
3159 : 18 __ __ CLC
315a : a5 05 __ LDA WORK + 2
315c : 65 03 __ ADC WORK + 0
315e : 85 05 __ STA WORK + 2
3160 : a5 06 __ LDA WORK + 3
3162 : 65 04 __ ADC WORK + 1
3164 : 85 06 __ STA WORK + 3
3166 : 06 03 __ ASL WORK + 0
3168 : 26 04 __ ROL WORK + 1
316a : 46 07 __ LSR WORK + 4
316c : b0 eb __ BCS $3159
316e : d0 f6 __ BNE $3166
3170 : a5 05 __ LDA WORK + 2
3172 : 95 00 __ STA $00,x
3174 : a5 06 __ LDA WORK + 3
3176 : 95 01 __ STA $01,x
3178 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_addi_8:
317b : b1 19 __ LDA (IP + 0),y
317d : c8 __ __ INY
317e : aa __ __ TAX
317f : 18 __ __ CLC
3180 : b5 00 __ LDA $00,x
3182 : 71 19 __ ADC (IP + 0),y
3184 : 95 00 __ STA $00,x
3186 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_andi_8:
3189 : b1 19 __ LDA (IP + 0),y
318b : c8 __ __ INY
318c : aa __ __ TAX
318d : b5 00 __ LDA $00,x
318f : 31 19 __ AND (IP + 0),y
3191 : 95 00 __ STA $00,x
3193 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_shl_16:
3196 : b1 19 __ LDA (IP + 0),y
3198 : aa __ __ TAX
3199 : b5 00 __ LDA $00,x
319b : 2c b1 19 BIT $19b1 ; (sformat + 375)
319e : 29 0f __ AND #$0f
31a0 : f0 0b __ BEQ $31ad
31a2 : aa __ __ TAX
31a3 : a5 1c __ LDA ACCU + 1
31a5 : 06 1b __ ASL ACCU + 0
31a7 : 2a __ __ ROL
31a8 : ca __ __ DEX
31a9 : d0 fa __ BNE $31a5
31ab : 85 1c __ STA ACCU + 1
31ad : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_binop_shr_u16:
31b0 : b1 19 __ LDA (IP + 0),y
31b2 : aa __ __ TAX
31b3 : b5 00 __ LDA $00,x
31b5 : 2c b1 19 BIT $19b1 ; (sformat + 375)
31b8 : 29 0f __ AND #$0f
31ba : f0 0b __ BEQ $31c7
31bc : aa __ __ TAX
31bd : a5 1c __ LDA ACCU + 1
31bf : 4a __ __ LSR
31c0 : 66 1b __ ROR ACCU + 0
31c2 : ca __ __ DEX
31c3 : d0 fa __ BNE $31bf
31c5 : 85 1c __ STA ACCU + 1
31c7 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
cmp16:
31ca : b1 19 __ LDA (IP + 0),y
31cc : aa __ __ TAX
31cd : 38 __ __ SEC
31ce : b5 01 __ LDA $01,x
31d0 : e5 1c __ SBC ACCU + 1
31d2 : f0 11 __ BEQ $31e5
31d4 : 50 02 __ BVC $31d8
31d6 : 49 80 __ EOR #$80
31d8 : 30 2a __ BMI $3204
31da : 10 33 __ BPL $320f
31dc : b1 19 __ LDA (IP + 0),y
31de : aa __ __ TAX
31df : b5 01 __ LDA $01,x
31e1 : c5 1c __ CMP ACCU + 1
31e3 : d0 28 __ BNE $320d
31e5 : b5 00 __ LDA $00,x
31e7 : c5 1b __ CMP ACCU + 0
31e9 : d0 22 __ BNE $320d
31eb : f0 0e __ BEQ $31fb
31ed : b1 19 __ LDA (IP + 0),y
31ef : aa __ __ TAX
31f0 : c8 __ __ INY
31f1 : b1 19 __ LDA (IP + 0),y
31f3 : c5 1c __ CMP ACCU + 1
31f5 : d0 16 __ BNE $320d
31f7 : e4 1b __ CPX ACCU + 0
31f9 : d0 12 __ BNE $320d
31fb : a9 00 __ LDA #$00
31fd : 85 1b __ STA ACCU + 0
31ff : 85 1c __ STA ACCU + 1
3201 : 4c 54 08 JMP $0854 ; (startup + 83)
3204 : a9 ff __ LDA #$ff
3206 : 85 1b __ STA ACCU + 0
3208 : 85 1c __ STA ACCU + 1
320a : 4c 54 08 JMP $0854 ; (startup + 83)
320d : 90 f5 __ BCC $3204
320f : a9 01 __ LDA #$01
3211 : 85 1b __ STA ACCU + 0
3213 : a9 00 __ LDA #$00
3215 : 85 1c __ STA ACCU + 1
3217 : 4c 54 08 JMP $0854 ; (startup + 83)
321a : b1 19 __ LDA (IP + 0),y
321c : c8 __ __ INY
321d : aa __ __ TAX
321e : b1 19 __ LDA (IP + 0),y
3220 : 38 __ __ SEC
3221 : e5 1c __ SBC ACCU + 1
3223 : d0 af __ BNE $31d4
3225 : e4 1b __ CPX ACCU + 0
3227 : d0 e4 __ BNE $320d
3229 : f0 d0 __ BEQ $31fb
322b : 60 __ __ RTS
--------------------------------------------------------------------
cmp8:
322c : b1 19 __ LDA (IP + 0),y
322e : aa __ __ TAX
322f : 38 __ __ SEC
3230 : b5 00 __ LDA $00,x
3232 : e5 1b __ SBC ACCU + 0
3234 : f0 19 __ BEQ $324f
3236 : 50 02 __ BVC $323a
3238 : 49 80 __ EOR #$80
323a : 30 1c __ BMI $3258
323c : 10 25 __ BPL $3263
323e : b1 19 __ LDA (IP + 0),y
3240 : aa __ __ TAX
3241 : b5 00 __ LDA $00,x
3243 : c5 1b __ CMP ACCU + 0
3245 : d0 1a __ BNE $3261
3247 : f0 06 __ BEQ $324f
3249 : b1 19 __ LDA (IP + 0),y
324b : c5 1b __ CMP ACCU + 0
324d : d0 12 __ BNE $3261
324f : a9 00 __ LDA #$00
3251 : 85 1b __ STA ACCU + 0
3253 : 85 1c __ STA ACCU + 1
3255 : 4c 54 08 JMP $0854 ; (startup + 83)
3258 : a9 ff __ LDA #$ff
325a : 85 1b __ STA ACCU + 0
325c : 85 1c __ STA ACCU + 1
325e : 4c 54 08 JMP $0854 ; (startup + 83)
3261 : 90 f5 __ BCC $3258
3263 : a9 01 __ LDA #$01
3265 : 85 1b __ STA ACCU + 0
3267 : a9 00 __ LDA #$00
3269 : 85 1c __ STA ACCU + 1
326b : 4c 54 08 JMP $0854 ; (startup + 83)
326e : b1 19 __ LDA (IP + 0),y
3270 : 38 __ __ SEC
3271 : e5 1b __ SBC ACCU + 0
3273 : d0 c1 __ BNE $3236
3275 : f0 d8 __ BEQ $324f
3277 : 60 __ __ RTS
--------------------------------------------------------------------
inp_op_negate_16:
3278 : 38 __ __ SEC
3279 : a9 00 __ LDA #$00
327b : e5 1b __ SBC ACCU + 0
327d : 85 1b __ STA ACCU + 0
327f : a9 00 __ LDA #$00
3281 : e5 1c __ SBC ACCU + 1
3283 : 85 1c __ STA ACCU + 1
3285 : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_op_invert_16:
3288 : a5 1b __ LDA ACCU + 0
328a : 49 ff __ EOR #$ff
328c : 85 1b __ STA ACCU + 0
328e : a5 1c __ LDA ACCU + 1
3290 : 49 ff __ EOR #$ff
3292 : 85 1c __ STA ACCU + 1
3294 : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_binop_add_f32:
3297 : 20 e3 27 JSR $27e3 ; (freg + 0)
329a : 20 28 28 JSR $2828 ; (faddsub + 0)
329d : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_binop_sub_f32:
32a0 : 20 e3 27 JSR $27e3 ; (freg + 0)
32a3 : a5 06 __ LDA WORK + 3
32a5 : 49 80 __ EOR #$80
32a7 : 85 06 __ STA WORK + 3
32a9 : 20 28 28 JSR $2828 ; (faddsub + 0)
32ac : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_binop_mul_f32:
32af : 20 e3 27 JSR $27e3 ; (freg + 0)
32b2 : 84 02 __ STY $02
32b4 : 20 0f 29 JSR $290f ; (fmul + 0)
32b7 : a4 02 __ LDY $02
32b9 : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_binop_div_f32:
32bc : 20 e3 27 JSR $27e3 ; (freg + 0)
32bf : 20 de 29 JSR $29de ; (fdiv + 0)
32c2 : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_binop_cmp_f32:
32c5 : b1 19 __ LDA (IP + 0),y
32c7 : c8 __ __ INY
32c8 : aa __ __ TAX
32c9 : a5 1e __ LDA ACCU + 3
32cb : 55 03 __ EOR WORK + 0,x
32cd : 10 1e __ BPL $32ed
32cf : a5 1e __ LDA ACCU + 3
32d1 : 29 7f __ AND #$7f
32d3 : 05 1d __ ORA ACCU + 2
32d5 : 05 1c __ ORA ACCU + 1
32d7 : 05 1b __ ORA ACCU + 0
32d9 : d0 0c __ BNE $32e7
32db : b5 03 __ LDA WORK + 0,x
32dd : 29 7f __ AND #$7f
32df : 15 02 __ ORA $02,x
32e1 : 15 01 __ ORA $01,x
32e3 : 15 00 __ ORA $00,x
32e5 : f0 1e __ BEQ $3305
32e7 : a5 1e __ LDA ACCU + 3
32e9 : 30 29 __ BMI $3314
32eb : 10 36 __ BPL $3323
32ed : a5 1e __ LDA ACCU + 3
32ef : d5 03 __ CMP WORK + 0,x
32f1 : d0 1b __ BNE $330e
32f3 : a5 1d __ LDA ACCU + 2
32f5 : d5 02 __ CMP $02,x
32f7 : d0 15 __ BNE $330e
32f9 : a5 1c __ LDA ACCU + 1
32fb : d5 01 __ CMP $01,x
32fd : d0 0f __ BNE $330e
32ff : a5 1b __ LDA ACCU + 0
3301 : d5 00 __ CMP $00,x
3303 : d0 09 __ BNE $330e
3305 : a9 00 __ LDA #$00
3307 : 85 1b __ STA ACCU + 0
3309 : 85 1c __ STA ACCU + 1
330b : 4c 55 08 JMP $0855 ; (startup + 84)
330e : b0 0f __ BCS $331f
3310 : 24 1e __ BIT ACCU + 3
3312 : 30 0f __ BMI $3323
3314 : a9 00 __ LDA #$00
3316 : 85 1c __ STA ACCU + 1
3318 : a9 01 __ LDA #$01
331a : 85 1b __ STA ACCU + 0
331c : 4c 55 08 JMP $0855 ; (startup + 84)
331f : 24 1e __ BIT ACCU + 3
3321 : 30 f1 __ BMI $3314
3323 : a9 ff __ LDA #$ff
3325 : 85 1b __ STA ACCU + 0
3327 : 85 1c __ STA ACCU + 1
3329 : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_op_negate_f32:
332c : a5 1e __ LDA ACCU + 3
332e : 49 80 __ EOR #$80
3330 : 85 1e __ STA ACCU + 3
3332 : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_conv_i16_f32:
3335 : 20 6f 2b JSR $2b6f ; (sint16_to_float + 0)
3338 : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_conv_f32_i16:
333b : 20 2d 2b JSR $2b2d ; (f32_to_i16 + 0)
333e : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
bra:
3341 : b1 19 __ LDA (IP + 0),y
3343 : 30 0c __ BMI $3351
3345 : 38 __ __ SEC
3346 : 65 19 __ ADC IP + 0
3348 : 85 19 __ STA IP + 0
334a : 90 02 __ BCC $334e
334c : e6 1a __ INC IP + 1
334e : 4c 5e 08 JMP $085e ; (startup + 93)
3351 : 38 __ __ SEC
3352 : 65 19 __ ADC IP + 0
3354 : 85 19 __ STA IP + 0
3356 : b0 02 __ BCS $335a
3358 : c6 1a __ DEC IP + 1
335a : 4c 5e 08 JMP $085e ; (startup + 93)
335d : a5 1b __ LDA ACCU + 0
335f : 05 1c __ ORA ACCU + 1
3361 : f0 de __ BEQ $3341
3363 : 4c 54 08 JMP $0854 ; (startup + 83)
3366 : a5 1b __ LDA ACCU + 0
3368 : 05 1c __ ORA ACCU + 1
336a : d0 d5 __ BNE $3341
336c : 4c 54 08 JMP $0854 ; (startup + 83)
336f : a5 1c __ LDA ACCU + 1
3371 : 30 04 __ BMI $3377
3373 : 05 1b __ ORA ACCU + 0
3375 : d0 ca __ BNE $3341
3377 : 4c 54 08 JMP $0854 ; (startup + 83)
337a : a5 1c __ LDA ACCU + 1
337c : 10 c3 __ BPL $3341
337e : 4c 54 08 JMP $0854 ; (startup + 83)
3381 : a5 1c __ LDA ACCU + 1
3383 : 30 bc __ BMI $3341
3385 : 4c 54 08 JMP $0854 ; (startup + 83)
3388 : a5 1c __ LDA ACCU + 1
338a : 30 b5 __ BMI $3341
338c : 05 1b __ ORA ACCU + 0
338e : f0 b1 __ BEQ $3341
3390 : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
braf:
3393 : 38 __ __ SEC
3394 : b1 19 __ LDA (IP + 0),y
3396 : 65 19 __ ADC IP + 0
3398 : aa __ __ TAX
3399 : c8 __ __ INY
339a : b1 19 __ LDA (IP + 0),y
339c : 65 1a __ ADC IP + 1
339e : 85 1a __ STA IP + 1
33a0 : 86 19 __ STX IP + 0
33a2 : 4c 5e 08 JMP $085e ; (startup + 93)
33a5 : a5 1b __ LDA ACCU + 0
33a7 : 05 1c __ ORA ACCU + 1
33a9 : f0 e8 __ BEQ $3393
33ab : c8 __ __ INY
33ac : 4c 54 08 JMP $0854 ; (startup + 83)
33af : a5 1b __ LDA ACCU + 0
33b1 : 05 1c __ ORA ACCU + 1
33b3 : d0 de __ BNE $3393
33b5 : c8 __ __ INY
33b6 : 4c 54 08 JMP $0854 ; (startup + 83)
33b9 : a5 1c __ LDA ACCU + 1
33bb : 30 04 __ BMI $33c1
33bd : 05 1b __ ORA ACCU + 0
33bf : d0 d2 __ BNE $3393
33c1 : c8 __ __ INY
33c2 : 4c 54 08 JMP $0854 ; (startup + 83)
33c5 : a5 1c __ LDA ACCU + 1
33c7 : 10 ca __ BPL $3393
33c9 : c8 __ __ INY
33ca : 4c 54 08 JMP $0854 ; (startup + 83)
33cd : a5 1c __ LDA ACCU + 1
33cf : 30 c2 __ BMI $3393
33d1 : c8 __ __ INY
33d2 : 4c 54 08 JMP $0854 ; (startup + 83)
33d5 : a5 1c __ LDA ACCU + 1
33d7 : 30 ba __ BMI $3393
33d9 : 05 1b __ ORA ACCU + 0
33db : f0 b6 __ BEQ $3393
33dd : c8 __ __ INY
33de : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
loopu8:
33e1 : b1 19 __ LDA (IP + 0),y
33e3 : aa __ __ TAX
33e4 : f6 00 __ INC $00,x
33e6 : c8 __ __ INY
33e7 : b1 19 __ LDA (IP + 0),y
33e9 : d5 00 __ CMP $00,x
33eb : 4c 4d 32 JMP $324d ; (cmp8 + 33)
--------------------------------------------------------------------
inp_jsr:
33ee : b1 19 __ LDA (IP + 0),y
33f0 : 8d 04 34 STA $3404 ; (inp_jsr + 22)
33f3 : c8 __ __ INY
33f4 : b1 19 __ LDA (IP + 0),y
33f6 : 8d 05 34 STA $3405 ; (inp_jsr + 23)
33f9 : 98 __ __ TYA
33fa : 38 __ __ SEC
33fb : 65 19 __ ADC IP + 0
33fd : 85 19 __ STA IP + 0
33ff : 90 02 __ BCC $3403
3401 : e6 1a __ INC IP + 1
3403 : 20 00 00 JSR $0000 
3406 : 4c 4e 08 JMP $084e ; (startup + 77)
--------------------------------------------------------------------
inp_native:
3409 : 98 __ __ TYA
340a : 18 __ __ CLC
340b : 65 19 __ ADC IP + 0
340d : 8d 18 34 STA $3418 ; (inp_native + 15)
3410 : a5 1a __ LDA IP + 1
3412 : 69 00 __ ADC #$00
3414 : 8d 19 34 STA $3419 ; (inp_native + 16)
3417 : 20 00 00 JSR $0000 
341a : a0 00 __ LDY #$00
341c : b1 23 __ LDA (SP + 0),y
341e : 85 19 __ STA IP + 0
3420 : c8 __ __ INY
3421 : b1 23 __ LDA (SP + 0),y
3423 : 85 1a __ STA IP + 1
3425 : 88 __ __ DEY
3426 : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_enter:
3429 : 38 __ __ SEC
342a : a5 23 __ LDA SP + 0
342c : f1 19 __ SBC (IP + 0),y
342e : c8 __ __ INY
342f : 85 23 __ STA SP + 0
3431 : a5 24 __ LDA SP + 1
3433 : f1 19 __ SBC (IP + 0),y
3435 : c8 __ __ INY
3436 : 85 24 __ STA SP + 1
3438 : b1 19 __ LDA (IP + 0),y
343a : 84 02 __ STY $02
343c : a8 __ __ TAY
343d : a5 25 __ LDA FP + 0
343f : 91 23 __ STA (SP + 0),y
3441 : c8 __ __ INY
3442 : a5 26 __ LDA FP + 1
3444 : 91 23 __ STA (SP + 0),y
3446 : 98 __ __ TYA
3447 : 38 __ __ SEC
3448 : 65 23 __ ADC SP + 0
344a : 85 25 __ STA FP + 0
344c : a9 00 __ LDA #$00
344e : 65 24 __ ADC SP + 1
3450 : 85 26 __ STA FP + 1
3452 : 88 __ __ DEY
3453 : f0 08 __ BEQ $345d
3455 : b9 52 00 LDA $0052,y 
3458 : 88 __ __ DEY
3459 : 91 23 __ STA (SP + 0),y
345b : d0 f8 __ BNE $3455
345d : a4 02 __ LDY $02
345f : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_return:
3462 : b1 19 __ LDA (IP + 0),y
3464 : c8 __ __ INY
3465 : 84 02 __ STY $02
3467 : a8 __ __ TAY
3468 : b1 23 __ LDA (SP + 0),y
346a : 85 25 __ STA FP + 0
346c : c8 __ __ INY
346d : b1 23 __ LDA (SP + 0),y
346f : 85 26 __ STA FP + 1
3471 : 88 __ __ DEY
3472 : f0 09 __ BEQ $347d
3474 : 88 __ __ DEY
3475 : b1 23 __ LDA (SP + 0),y
3477 : 99 53 00 STA $0053,y 
347a : 88 __ __ DEY
347b : 10 f8 __ BPL $3475
347d : a4 02 __ LDY $02
347f : 18 __ __ CLC
3480 : b1 19 __ LDA (IP + 0),y
3482 : c8 __ __ INY
3483 : 65 23 __ ADC SP + 0
3485 : 85 23 __ STA SP + 0
3487 : b1 19 __ LDA (IP + 0),y
3489 : c8 __ __ INY
348a : 65 24 __ ADC SP + 1
348c : 85 24 __ STA SP + 1
348e : a0 01 __ LDY #$01
3490 : b1 23 __ LDA (SP + 0),y
3492 : 85 1a __ STA IP + 1
3494 : 88 __ __ DEY
3495 : b1 23 __ LDA (SP + 0),y
3497 : 85 19 __ STA IP + 0
3499 : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_call:
349c : b1 19 __ LDA (IP + 0),y
349e : 85 1f __ STA ADDR + 0
34a0 : c8 __ __ INY
34a1 : b1 19 __ LDA (IP + 0),y
34a3 : 85 20 __ STA ADDR + 1
34a5 : c8 __ __ INY
34a6 : 98 __ __ TYA
34a7 : a0 00 __ LDY #$00
34a9 : 18 __ __ CLC
34aa : 65 19 __ ADC IP + 0
34ac : 91 23 __ STA (SP + 0),y
34ae : c8 __ __ INY
34af : a5 1a __ LDA IP + 1
34b1 : 69 00 __ ADC #$00
34b3 : 91 23 __ STA (SP + 0),y
34b5 : a5 1f __ LDA ADDR + 0
34b7 : 85 19 __ STA IP + 0
34b9 : a5 20 __ LDA ADDR + 1
34bb : 85 1a __ STA IP + 1
34bd : 4c 4e 08 JMP $084e ; (startup + 77)
--------------------------------------------------------------------
inp_push_frame:
34c0 : 38 __ __ SEC
34c1 : a5 23 __ LDA SP + 0
34c3 : f1 19 __ SBC (IP + 0),y
34c5 : c8 __ __ INY
34c6 : 85 23 __ STA SP + 0
34c8 : a5 24 __ LDA SP + 1
34ca : f1 19 __ SBC (IP + 0),y
34cc : 85 24 __ STA SP + 1
34ce : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_pop_frame:
34d1 : 18 __ __ CLC
34d2 : b1 19 __ LDA (IP + 0),y
34d4 : c8 __ __ INY
34d5 : 65 23 __ ADC SP + 0
34d7 : 85 23 __ STA SP + 0
34d9 : b1 19 __ LDA (IP + 0),y
34db : 65 24 __ ADC SP + 1
34dd : 85 24 __ STA SP + 1
34df : 4c 54 08 JMP $0854 ; (startup + 83)
--------------------------------------------------------------------
inp_strcpy:
34e2 : 84 02 __ STY $02
34e4 : a0 ff __ LDY #$ff
34e6 : c8 __ __ INY
34e7 : b1 1b __ LDA (ACCU + 0),y
34e9 : 91 1f __ STA (ADDR + 0),y
34eb : d0 f9 __ BNE $34e6
34ed : a4 02 __ LDY $02
34ef : 4c 55 08 JMP $0855 ; (startup + 84)
--------------------------------------------------------------------
inp_op_extrt:
34f2 : b1 19 __ LDA (IP + 0),y
34f4 : c8 __ __ INY
34f5 : 8d 03 35 STA $3503 ; (inp_op_extrt + 17)
34f8 : b1 19 __ LDA (IP + 0),y
34fa : c8 __ __ INY
34fb : 8d 04 35 STA $3504 ; (inp_op_extrt + 18)
34fe : b1 19 __ LDA (IP + 0),y
3500 : c8 __ __ INY
3501 : aa __ __ TAX
3502 : 20 00 00 JSR $0000 
3505 : 4c 55 08 JMP $0855 ; (startup + 84)
