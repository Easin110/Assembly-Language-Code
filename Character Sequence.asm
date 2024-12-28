org 100h
.data
m1 db 10,13,"Enter first character:$"
m2 db 10,13,"Enter second character:$"
m3 db 10,13,"first sequence in character: $"

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
    
    mov ah,01h
    int 21h
    
    cmp bl,al
    jnae next
    mov bl,al
    
    next:
    lea dx,m3
    mov ah,09h
    int 21h
    
    mov dl,bl
    mov ah,02h
    int 21h

ret