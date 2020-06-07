PUBLIC F1
PUBLIC F3
PUBLIC F5

DSEG	SEGMENT PARA PUBLIC 'DATA'
		NLINE	DB	10, 13, '$'
		table	db	'0123456789ABCDEF'
		stroka	db	'    ', '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG
		
F1		PROC NEAR
		PUSH BP
		MOV  BP, SP
		
		MOV  BX, [BP + 6]
		
		MOV CX, 16
		
		F1_1:
			SHL BX, 1
			JNC F1_2
			MOV DH, 1
			JMP F1_4
		F1_2:
			DEC CX
			JNZ F1_1
		F1_3:
			MOV DH, 0
			SHL BX, 1
			JNC F1_4
			INC DH
		F1_4:
			MOV  DL, '0'
			ADD  DL, DH
			
			MOV  AH, 2
			INT  21h
			
			DEC  CX
			JNZ  F1_3
		
		MOV  AH, 9
		MOV  DX, OFFSET NLINE
		INT  21H

		POP BP
		RET 4
F1		ENDP
		
F3		PROC NEAR
		PUSH BP
		MOV	 BP, SP
		
		MOV	 AX, [BP + 6]
		
        F3_1:
            XOR CX, CX
            MOV BX, 10
        F3_2:
            XOR DX,DX
            DIV BX
            ADD DX, '0'
            PUSH DX
            INC CX
            CMP AX,0
            JNE F3_2

            MOV AH,2
        F3_3:
            POP DX
            INT 21h
            LOOP F3_3
		
		MOV  AH, 9
		MOV  DX, OFFSET NLINE
		INT  21H
		
		POP BP
		RET 4
F3		ENDP
		
F5		PROC NEAR
		PUSH BP
		MOV  BP, SP
		
		mov  bx, offset table
		
		mov  dx, [bp + 6]
		
		mov  di, 3
		mov  cx, 4
		
		F5_1:
			mov  ah, 15
			and  ah, dl
			
			mov  al, ah
			xlat
			
			mov  stroka[di], al
			dec  di
		
			shr  dx, 1
			shr  dx, 1
			shr  dx, 1
			shr  dx, 1
			
			cmp  di, 0
			je   f5_2
			
			cmp  dx, 0
			jnz  F5_1
			
	F5_2:
	
	mov  ah, 9
	
	mov  dx, offset stroka
	int  21h
	
	mov  dx, offset nline
	int  21h
	
	pop  bp
	ret  4
		
F5		ENDP
		
CSEG	ENDS
END
