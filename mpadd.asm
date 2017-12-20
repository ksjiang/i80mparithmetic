mpadd:	PUSH PSW	;save registers
	PUSH B
	PUSH D
	PUSH H

mpadd1:	LXI H, 000AH	;do SP + 10
	DAD SP
	SPHL
	POP H		;*res
	INX SP
	INX SP
	POP D		;*add2
	POP B		;counter
	MOV C, B	;dup counter

mpadd2:	LDAX D		;copy addend to result block
	MOV M, A
	INX D
	INX H
	DCR B
	JNZ mpadd2

mpadd3:	LXI H, 0FFF8H	;do SP - 8
	DAD SP
	SPHL
	POP H		;*res
	POP D		;*add1
	ORA A		;reset carry flag

mpadd4:	LDAX D		;main addition loop
	ADC M
	MOV M, A
	DCR C		;duped counter
	JZ mpadd5	;all done
	INX D
	INX H
	JMP mpadd4

mpadd5:	PUSH PSW	;save carry info
	POP B
	LXI H, 0FFF2H	;do SP - 14
	DAD SP
	SPHL
	PUSH B		;restore carry info
	POP PSW
	POP H		;restore registers
	POP D
	POP B
	JC mpadd6
	POP PSW
	STC
	CCF
	RET		;return to calling procedure

mpadd6:	POP PSW
	STC
	RET
