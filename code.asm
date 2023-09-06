; Made by Sudeep Saurabh

DATA SEGMENT
PORTA EQU 00H	; define PORTA connection PORTB EQU 02H	; define PORTB connection PORTC EQU 04H	; define PORTC connection PORT_CON EQU 06H		; define PORT_CON connection DATA ENDS

CODE SEGMENT MOV AX, DATA
MOV DS, AX	; connecting data and code segments ORG 0000H		; set origin value
START:

MOV DX, PORT_CON
MOV AL, 10000010B	; set the control word value OUT DX, AL
JMP VAL

VAL:	; function for checking input values MOV DX, PORTB
IN AL, DX
CMP AL, 11100000B JZ S0
IN AL, DX
CMP AL, 11010000B JZ S1
IN AL, DX
CMP AL, 11110000B
 
JZ S2

IN AL, DX
CMP AL, 00100000B JZ S3
IN AL, DX
CMP AL, 00110000B JZ S3
IN AL, DX
CMP AL, 01100000B JZ S3
IN AL, DX
CMP AL, 01110000B JZ S3
IN AL, DX
CMP AL, 10100000B JZ S3
IN AL, DX
CMP AL, 10110000B JZ S3


IN AL, DX
CMP AL, 00000000B JZ S4
IN AL, DX
CMP AL, 00010000B JZ S4
IN AL, DX
CMP AL, 01000000B JZ S4
IN AL, DX
CMP AL, 0101000B
 
JZ S4
IN AL, DX
CMP AL, 10000000B JZ S4
IN AL, DX
CMP AL, 10010000B JZ S4
IN AL, DX
CMP AL, 11000000B JZ S5

JMP VAL

S0:	; Funcation about blue+alarm MOV AL, 10100000B
MOV DX, PORTA OUT DX, AL
JMP VAL

S1:	; function about red+alarm
MOV AL, 11000000B	; red LED and buzzer on to show seatbelt is not in
MOV DX, PORTA OUT DX, AL
JMP VAL

S2:	; funcation about blue+red+alarm
MOV AL, 11100000B	; both LEDs and buzzer off to show pressure sensor is not triggered
MOV DX, PORTA OUT DX, AL
JMP VAL
 
S3:	; Funcation about blue
MOV AL, 00100000B	; both LEDs and buzzer off to show pressure sensor is not triggered
MOV DX, PORTA OUT DX, AL
JMP VAL

S4:	; Nothing
MOV AL, 00000000B MOV DX, PORTA OUT DX, AL
JMP VAL

S5:	; Green Light - GO ahead MOV AL, 00010000B
MOV DX, PORTA OUT DX, AL
JMP VAL JMP START CODE ENDS END
