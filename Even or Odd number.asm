
org 100h

.data 
    ms1 db "Enter a number: $"
    msg db 10,13,'AL contains an even number.$'
    msg_odd db 10,13, 'AL contains an odd number.$'

.code 
main proc 
    lea dx,ms1
    mov ah,09h
    int 21h
    

start:
    
    mov ah, 01h      
    int 21h        
    sub al, '0'    

   
    test al, 1     
    jz even_number 
    
    
    lea dx, msg_odd 
    jmp print_msg        

even_number:
    
    lea dx, msg   

print_msg:
    
    mov ah, 9      
    int 21h        

    
    mov ah,76    
    int 21h       

end start
