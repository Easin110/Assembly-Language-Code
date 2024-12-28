.model small
.stack 100h

.data
    input_msg db 'Enter a number between 2 and 9: $'
    result_msg db 0dh, 0ah, 'The result is: $'
    n db ?
    result dw 0
    squares dw 1, 4, 9, 16, 25, 36, 49, 64, 81

.code
main proc
    mov ax, @data
    mov ds, ax
    lea dx, input_msg
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov n, al
    cmp al, 2
    jl invalid_input
    cmp al, 9
    jg invalid_input
    xor bx, bx
    mov al, n
    mov ah, 0
    mov cx, ax
    mov result, 0

sum_loop:
    mov ax, squares[bx]
    add result, ax
    add bx, 2
    loop sum_loop

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
