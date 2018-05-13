PUBLIC F2
PUBLIC F4
PUBLIC F6

EXTRN  F1 : NEAR
EXTRN  F3 : NEAR
EXTRN  F5 : NEAR

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG
		
F2		PROC NEAR
		PUSH BP
		MOV  BP, SP
		
		MOV  CX, [BP + 4]
		MOV  BX, [BP + 6]
		
		CMP  CL, 0
		JE   F2_SKIP_NEG
		
		MOV  AH, 2
		MOV  DL, '-'
		INT  21H
		
		NEG  BX
		
F2_SKIP_NEG:
		PUSH BX
		PUSH CX
		
		CALL F1
		
		POP BP
		RET 4
F2		ENDP
		
F4		PROC NEAR
		PUSH BP
		MOV  BP, SP
		
		MOV  CX, [BP + 4]
		MOV  BX, [BP + 6]
		
		CMP  CL, 0
		JE   F4_SKIP_NEG
		
		MOV  AH, 2
		MOV  DL, '-'
		INT  21H
		
		NEG  BX
		
F4_SKIP_NEG:
		PUSH  BX
		PUSH  CX
		
		CALL  F3
		
		POP BP
		RET 4
F4		ENDP
		
F6		PROC NEAR
		PUSH BP
		MOV  BP, SP
		
		MOV  CX, [BP + 4]
		MOV  BX, [BP + 6]
		
		CMP  CL, 0
		JE   F6_SKIP_NEG
		
		MOV  AH, 2
		MOV  DL, '-'
		INT  21H
		
		NEG  BX
		
F6_SKIP_NEG:
		PUSH  BX
		PUSH  CX
		
		CALL  F5
		
		POP BP
		RET 4
F6		ENDP
		
CSEG	ENDS
END