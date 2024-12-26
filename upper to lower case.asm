.MODEL SMALL
.STACK 
.DATA                                                                                                                                                    
  A DB 'UPPER CASE $'
  B DB 10,13,'LOWER CASE $'   
.CODE
MAIN PROC
   
    MOV AX,@DATA
    MOV DS,AX
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL  
    
    MOV AH,9
    LEA DX,B
    INT 21H 
    
    MOV AH,2
    ADD BL,32
    MOV DL,BL
    INT 21H

    MOV AH, 4CH        
    INT 21H

MAIN ENDP
END MAIN
