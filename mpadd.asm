mpadd:	PUSH B		;save registers
	PUSH D
	PUSH H

mpadd1:	LXI H, 0008H	;do SP + 8
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

mpadd5:	LXI H, 0FFF4H	;do SP - 12
	DAD SP
	SPHL
	POP H		;restore registers
	POP D
	POP B
	RET		;return to calling procedure
