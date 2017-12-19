mpadd:	PUSH PSW	;save registers
	PUSH B
	PUSH D
	PUSH H
	LXI B, X
	LXI H, Z
	MVI D, SL
mpadd1:	LDAX B		;copy addend to result block
	MOV M, A
	INX B
	INX H
	DCR D
	JNZ mpadd1
mpadd2:	LXI B, Y
	LXI H, Z
	MVI D, SL
	ORA A		;reset carry flag
mpadd3:	LDAX B		;main addition loop
	ADC M
	MOV M, A
	DCR D
	JZ mpadd4
	INX B
	INX H
	JMP mpadd3
mpadd4:	JNC mpadd5
	INX H
	INR M
mpadd5:	POP H		;restore registers
	POP D
	POP B
	POP PSW
	RET		;return to calling procedure

SL	EQU	03H
X	EQU	0FE00H
Y	EQU	0FE80H
Z	EQU	0FF00H
