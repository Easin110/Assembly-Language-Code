.model small
.stack 100h

.data
    input_msg db 'Enter a number between 2 and 9: $'
    result_msg db 0dh, 0ah, 'The result is: $'
    n db ?
    result dw 0

.code
main proc
    mov ax, @data
    mov ds, ax
    lea dx, input_msg
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'         ; Convert input character to integer
    mov n, al
    cmp al, 2
    jl invalid_input
    cmp al, 9
    jg invalid_input
    xor bx, bx          ; Initialize bx to 0 for the sum loop
    mov al, n           ; Load n into al
    mov result, 0       ; Clear result register

sum_loop:
    add result, bx      ; Add bx to the result
    inc bx              ; Increment bx (1, 2, 3, ...)
    cmp bl, al          ; Compare bx with n
    jle sum_loop        ; If bx <= n, continue the loop

    lea dx, result_msg
    mov ah, 09h
    int 21h
    mov ax, result
    call print_number
    mov ah, 4ch
    int 21h

invalid_input:
    lea dx, result_msg
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h

print_number proc
    push ax
    xor cx, cx
    mov bx, 10

convert_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz convert_loop

print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits
    pop ax
    ret
print_number endp

end main
