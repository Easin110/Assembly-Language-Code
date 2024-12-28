org 100h
.data 
ms1 db 10,13, 'Enter the hexa value:$'
ms2 db 10,13,'Output Decimal:$'
.code                                   
main proc
    mov ax ,@data
    mov ds,ax
    
    lea dx,ms1
    mov ah,9h
    int 21h
    
    mov ah,1h
    int 21h
    
    mov bl,al
    
    lea dx,ms2
    mov ah,9
    int 21h
    
    mov ah,2h
    mov dl,31h
    int 21h
    
    sub bl,11h
    
    mov dl,bl
    int 21h
    
    
    main endp
end main
ret