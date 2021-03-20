.MODEL SMALL

.DATA

HURUF   DB        20 DUP(?)
INPUT   DB        "MASUKKAN 20 CHAR:", "$"

.CODE

GETINPUT2 PROC NEAR

        LEA DX, INPUT
        MOV AH, 09H
        INT 21H

        MOV DI, 0    
        MOV CX, 20

INPUT1:
        
        MOV AH, 01H
        INT 21H
        MOV HURUF[DI], AL
        INC DI
        LOOP INPUT1
        RET
    
GETINPUT2 ENDP

.STARTUP

        CALL GETINPUT2
        JMP  HITUNG1
    
HITUNG1:
        
        MOV AX, 0
        MOV DI, 0
        MOV CX, 20

CHECK:
        
        MOV BL, HURUF[DI]
        CMP BL, 41H
        JE  TRUE
        CMP BL, 61H
        JNE FALSE
            
TRUE:

        INC AL
            
FALSE:

        INC DI
        LOOP CHECK      

.EXIT
END 