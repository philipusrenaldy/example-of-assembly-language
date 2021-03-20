.MODEL SMALL
.DATA
    
    NUMB    DW 0049H
    PEMBAGI DB 10H
    TEMP1 DB 2 DUP (?)
    TEMP2 DB 2 DUP (?)
    
.CODE
.STARTUP

        MOV AX,NUMB
        DIV PEMBAGI
        
        MOV TEMP1[1],AH
        MOV TEMP1[0],AL
        
        OR AX, 3030H
        
        MOV TEMP2[1],AH
        MOV TEMP2[0],AL

.EXIT
END