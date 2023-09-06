; Made by Sudeep Saurabh
DATA SEGMENT
 PORTA EQU 00H       ; define PORTA connection
 PORTB EQU 02H       ; define PORTB connection
 PORTC EQU 04H       ; define PORTC connection
 PORT_CON EQU 06H    ; define PORT_CON connection
DATA ENDS

CODE SEGMENT
 MOV AX, DATA
 MOV DS, AX          ; connecting data and code segments

ORG 0000H            ; set origin value

START:

 MOV DX, PORT_CON
 MOV AL, 10000010B   ; set the control word value
 OUT DX, AL
 JMP VAL
 
VAL:                 ; function for checking input values
 MOV DX, PORTB
 IN AL, DX
 CMP AL, 11000000B
 JZ S0
 IN AL, DX
 CMP AL, 11000001B
 JZ S1
 IN AL, DX
 CMP AL, 00000001B
 JZ S2
 IN AL, DX
 CMP AL, 01000001B
 JZ S2
 IN AL, DX
 CMP AL, 10000001B
 JZ S2
 JMP VAL

S0:                  ; function to change output LEDs and buzzer
 MOV AL, 00100000B   ; only blue LED on to show seatbelt is in
 MOV DX, PORTA
 OUT DX, AL
 JMP VAL

S1:                  ; function to change output LEDs and buzzer
 MOV AL, 11000000B   ; red LED and buzzer on to show seatbelt is not in
 MOV DX, PORTA
 OUT DX, AL
 JMP VAL

S2:                  ; function to change output LEDs and buzzer
 MOV AL, 00000000B   ; both LEDs and buzzer off to show pressure sensor is not triggered
 MOV DX, PORTA
 OUT DX, AL
 JMP VAL
 
JMP START
CODE ENDS
END
