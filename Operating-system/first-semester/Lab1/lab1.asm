CODE SEGMENT
	ASSUME CS: CODE
START:
	MOV AX,3508h  ; AH = 35h AL = 08h
	INT 21h
	MOV AH, 4Ch   ; exit
	INT 21h
CODE ENDS
END START
