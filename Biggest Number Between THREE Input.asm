;Finding larger number between three numbers

.model small
.stack 100h
.data
num1 dw 0
num2 dw 0
num3 dw 0
msg1 db 'Enter first number: $'
msg2 db 10,13, 'Enter second number: $'
msg3 db 10,13, 'Enter third number: $'
msg4 db 10,13, 'The largest number is: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg1
    int 21h
    

    mov ah,1
    int 21h
    sub al, '0' 
    mov num1, ax
    

    mov ah,9
    lea dx, msg2
    int 21h
    

    mov ah,1
    int 21h
    sub al, '0' 
    mov num2, ax
    
   
    mov ah, 9
    lea dx, msg3
    int 21h
    

    mov ah, 1
    int 21h
    sub al, '0' 
    mov num3, ax
              
  
    mov ah, 9
    lea dx, msg4
    int 21h
    
    mov ax, num1
    cmp ax, num2
    jge l3 
    mov ax, num2
    
    l3: 
    
    cmp ax, num3
    jge printresult
    mov ax, num3 
    
printresult:
    add ax, '0' 
    mov dx, ax
    mov ah, 2
    int 21h
    
   
    mov ah, 4ch
    int 21h
main endp
end main