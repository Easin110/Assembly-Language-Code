org 100h
.data
m1 db 10,13, "Enter single ascii digit: $" 
m2 db 10,13, "number : $"


.code
main proc 
    lea dx,m1
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    
    mov bl,al
    
    lea dx,m2
    mov ah,09h
    int 21h  
    
    and bl,0FH 
    mov dl,bl
    add dl,48 
    
    mov ah,02h
    int 21h
    
endp
end main
ret
    
    