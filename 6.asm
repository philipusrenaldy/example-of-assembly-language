.MODEL SMALL
.DATA
    
    TULISAN  DB 13,10,'MASUKKAN ANGKA PERTAMA:',13,10,'$'
    TULISAN1 DB 13,10,'MASUKKAN ANGKA KEDUA:',13,10,'$'
    TULISAN2 DB 13,10,'MASUKKAN PEMBAGI:',13,10,'$'   
    TULISAN3 DB 13,10,'GENAP/GANJIL:',13,10,'$' 
    TULISAN4 DB 13,10,'SISA:',13,10,'$'
    HASIL1   DB 13,10,'GENAP',13,10,'$'
    HASIL2   DB 13,10,'GANJIL',13,10,'$'
    
    GENAP   DB 0
    GANJIL  DB 0
    SISA    DB 0

.CODE
.STARTUP
    
    LEA DX, TULISAN    
    MOV AH,09H               
    INT 21H                  

    MOV AH, 01H            
    INT 21H         
    SUB AL, 30H      
    MOV BL, AL     
    
    LEA DX, TULISAN1
    MOV AH, 09H             
    INT 21H
    MOV AH, 01H            
    INT 21H         
    SUB AL, 30H      
    
    LEA DX, TULISAN2
    MOV AH, 09H
    INT 21H
    MOV AH, 01H            
    INT 21H         
    MOV CL, AL

    ADD AL, BL
    DIV CL 
       
    MOV CL, AL
    MOV CH, AH

    CMP AH, 0
    JNE GENAP1
    
    MOV BL, 2
    DIV BL
    CMP AH, 0
    JNE GANJIL1
    
GENAP1:
    MOV [GENAP], CL
    LEA DX, TULISAN3
    MOV AH, 09H           
    INT 21H                
    MOV AH, 09H           
    LEA DX, HASIL1                 
    INT 21H
    JMP END
    
GANJIL1:
    MOV [GANJIL], CL
    LEA DX, TULISAN3
    MOV AH, 09H           
    INT 21H
    
    MOV AH, 09H           
    LEA DX, HASIL2                 
    INT 21H
    
    MOV [SISA], CH
    LEA DX, TULISAN4
    MOV AH, 09H           
    INT 21H
    
    JMP END 
    
END:   
.EXIT
END