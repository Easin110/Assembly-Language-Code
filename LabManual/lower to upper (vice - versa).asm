.MODEL SMALL
.STACK 
.DATA                                                                                                                                                    
 A DB 'Enter Lower case: $' 
 B db 10,13,'In Upper case: $'
 C DB 10,13,'Upper case: $'
 D DB 10,13,'In Lower case: $' 
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
    SUB BL,32 
    MOV DL,BL
    INT 21H
            
    MOV AH,9
    LEA DX,C
    INT 21H
    
    
           
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,9
    LEA DX,B
    INT 21H
    
     
    MOV AH,2
    ADD BH,32
    MOV DL,BH
    INT 21H
    
    
    
    
    MOV AH, 4CH        
    INT 21H

MAIN ENDP
END MAIN