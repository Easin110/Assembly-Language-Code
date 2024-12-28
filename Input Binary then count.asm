
org 100h

.data
ms db "Input binary number is: 10101101010 $"
ms1 db 10,13,10,13,'Number of one is: $'

.code
main proc
    lea dx,ms
    mov ah,09
    int 21h
    
    
    mov bx,10101101010b
    xor ax,ax
    mov cx,16
    
   top:   
   rol bx,1
   jnc next
   inc ax
   
   next:
   loop top
   
   end:
   mov bx,ax
   lea dx,ms1
   mov ah,09h
   int 21h
   add bl,48d
   mov dl,bl
   mov ah,02h
   int 21h
   main endp
   

ret




