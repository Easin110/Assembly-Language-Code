.MODEL SMALL
.STACK 
.DATA                                                                                                                                                    
  A DB '1st digit: $'
  B DB 10,13,'2nd digit: $'   
  C DB 10,13,'2nd digit: $'
  R DB 10,13,'RESULT: $'   
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
    
    MOV AH,1
    INT 21H
    MOV BH,AL 
    
    MOV AH,9
    LEA DX,C
    INT 21H  
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    ADD BL,BH
    SUB BL,48
    
    MOV CH,BL
    
    ADD CH,CL
    SUB CH,48 
   
    
    MOV AH,9
    LEA DX,R
    INT 21H 
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    MOV AH, 4CH        
    INT 21H

 MAIN ENDP
END MAIN
