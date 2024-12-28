.model small
.stack 100h

.data
    input_string db 'WE aRE DUET STuDeNTs', 0dh, 0ah, '$'
    no_small_msg db 'No small letters', 0dh, 0ah, '$'
    newline db 0dh, 0ah, '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, input_string
    mov ah, 09h
    int 21h

    lea si, input_string
    xor bx, bx
    mov al, 0
    mov cl, 0

find_small:
    mov dl, [si]
    cmp dl, '$'
    je check_results
    cmp dl, 'a'
    jl next_char
    cmp dl, 'z'
    jg next_char
    cmp cl, 0
    jne update_last
    mov al, dl
    mov cl, 1

update_last:
    mov bx, si

next_char:
    inc si
    jmp find_small

check_results:
    cmp cl, 0
    je display_no_small
    mov dl, al
    mov ah, 02h
    int 21h
    lea dx, newline
    mov ah, 09h
    int 21h
    mov dl, [bx]
    mov ah, 02h
    int 21h
    jmp exit_program

display_no_small:
    lea dx, no_small_msg
    mov ah, 09h
    int 21h

exit_program:
    mov ah, 4ch
    int 21h
main endp

end main
