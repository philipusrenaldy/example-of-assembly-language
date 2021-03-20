.MODEL SMALL
.DATA       
    
    JUMLAH DW 50 DUP (?)

.CODE
.STARTUP

        MOV  BX, 1020H
        MOV  ES, BX
        MOV  DI, 00H
        MOV  AL, 02H
        MOV  CX, 49
        
ULANG1:  

        MOV  ES:[DI], AL
        INC  DI
        MOV  ES:[DI], 00H
        INC  DI
        INC  AL
        
        LOOP ULANG1

        MOV  DI, 00H
        MOV  SI, 00H
        MOV  CX, 50 
        MOV  AX, 00H 
        
ULANG2: 

        ADD  AX, ES:[DI]
        MOV  JUMLAH[0], AX
        INC  DI
        INC  DI
            
        LOOP ULANG2  
        
.EXIT
END