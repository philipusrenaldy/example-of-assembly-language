.MODEL SMALL
.DATA

.CODE
.STARTUP
       
        MOV AX, 1000H
        MOV DS, AX
        MOV DI, 200H       

        MOV CX, 49      
        MOV BX, 02H
        MOV AH,02H
        INT 21H
        
    HITUNG:           

        MOV [DI], BX   
        ADD BX, 02H  
        INC SI     
        MOV AH,2H
        INT 21H     
        
        LOOP HITUNG        
.EXIT
END