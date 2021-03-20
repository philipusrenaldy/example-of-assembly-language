.MODEL SMALL
.DATA

    KATA  DB 13,10,'MASUKKAN YANG INGIN DIBAGI (2 DIGIT):',13,10,'$' 
    KATA1 DB 13,10,'MASUKKAN PEMBAGI (1 DIGIT):',13,10,'$'	
    KATA2 DB 13,10,'HASILNYA ADALAH:',13,10,'$'
    KATA3 DB 13,10,'SISA PEMBAGIAN:',13,10,'$'  

    ANGKA1   DB 2 DUP (?)
    ANGKA2   DB 1 DUP (?) 
    HASIL    DB 00H
    SISA     DB 00H

.CODE
.STARTUP

        LEA DX, KATA    
        MOV AH,09H               
        INT 21H                  

        MOV AH, 01H            
        INT 21H
        SUB AL, 30H               
        MOV ANGKA1[0], AL      
        INT 21H
        SUB AL, 30H              
        MOV ANGKA1[1], AL

        LEA DX, KATA1
        MOV AH,09H             
        INT 21H                

        MOV AH, 01H                         
        INT 21H 
        SUB AL, 30H          
        MOV ANGKA2[1], AL

        MOV AH, ANGKA1[0]                         
        MOV AL, ANGKA1[1]                         
        MOV BL, ANGKA2[1]    
    
        DIV BL
        OR  AX, 3030H
        MOV HASIL, AL
        MOV SISA,  AH
        AAD
        LEA DX, KATA2
        MOV AH, 09H           
        INT 21H                

        MOV AH, 02H           
        MOV DL, HASIL                 
        INT 21H

        LEA DX, KATA3
        MOV AH, 09H           
        INT 21H                

        MOV AH, 02H           
        MOV DL, SISA                 
        INT 21H                

.EXIT
END       