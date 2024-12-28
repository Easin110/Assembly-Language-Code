.model small
.stack 100h

.data
    s db 100 dup('$')  ; Reserve space for the input string
    msg1 db 10,13, 'The string is a palindrome!$'
    msg2 db 10,13,'The string is not a palindrome!$'
    prompt db 'Enter a string: $'

.code
start:
    mov ax, @data
    mov ds, ax

    ; Display prompt
    mov ah, 9
    mov dx, offset prompt
    int 21h

    ; Read string from user
    mov ah, 0Ah
    lea dx, s
    int 21h

    ; Calculate string length
    lea di, s + 2  ; Start of the actual string
    mov cl, [s+1]  ; Length of the input string
    mov ch, 0
    mov si, di
    add si, cx
    dec si

    ; Check if the string is a palindrome
    shr cx, 1

next_char:
    mov al, [di]
    mov bl, [si]
    cmp al, bl
    jne not_palindrome
    inc di
    dec si
    loop next_char

is_palindrome:
    mov ah, 9
    mov dx, offset msg1
    int 21h
    jmp stop

not_palindrome:
    mov ah, 9
    mov dx, offset msg2
    int 21h

stop:
    mov ah, 0
    int 16h

ret