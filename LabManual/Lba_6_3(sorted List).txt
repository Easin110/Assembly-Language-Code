.model small
.stack 100h

.data
    inp db 2, 6, 1, 9, 4
    len db 5
    msg_unsorted db 'The unsorted list is: $'
    msg_sorted db 'The sorted list is: $'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg_unsorted
    mov ah, 09h
    int 21h

    mov si, 0
display_unsorted:
    mov al, inp[si]
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    mov dl, ' '
    int 21h

    inc si
    mov bl, len
    mov bh, 0
    cmp si, bx
    jne display_unsorted

    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    int 21h

    mov cl, len
    dec cl
outer_loop:
    mov si, 0
    mov ch, cl
inner_loop:
    mov al, inp[si]
    mov bl, inp[si + 1]
    cmp al, bl
    jbe skip_swap

    mov inp[si], bl
    mov inp[si + 1], al

skip_swap:
    inc si
    dec ch
    jnz inner_loop

    dec cl
    jnz outer_loop

    lea dx, msg_sorted
    mov ah, 09h
    int 21h

    mov si, 0
display_sorted:
    mov al, inp[si]
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    mov dl, ' '
    int 21h

    inc si
    mov bl, len
    mov bh, 0
    cmp si, bx
    jne display_sorted

    mov ah, 4Ch
    int 21h
main endp
end main
