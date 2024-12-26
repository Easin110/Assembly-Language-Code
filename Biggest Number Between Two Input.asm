.MODEL SMALL
.STACK 100H
.DATA                                                                                                                                                    
  A DB 'Input Two Number: $'
  B DB 10,13,'Largest Number: $'
     
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
    INT 21H
    MOV BH,AL 
    
   Biggest:
    CMP BL,BH
    JG Level1
    JMP Level2
           
   Level2:
   
    MOV AH,9
    LEA DX,B
    INT 21H  
    
    MOV AH,2
    MOV DL,BH
    INT 21H 
    JMP Exit
    
   Level1:
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H 
    JMP Exit 
   
   Exit:  
   
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
