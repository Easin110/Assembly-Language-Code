org 100h
.code
main proc
    mov cx, 80        ; Set loop counter to 80
    lea si, msg       ; Load address of the string into SI

top:
    mov dl, [si]      ; Load current character of the string into DL
    or dl, dl         ; Check if it's the null terminator
    jz next           ; If null terminator, jump to next iteration
    mov ah, 2         ; Function to print a character
    int 21h           ; Print the character
    inc si            ; Move to the next character in the string
    jmp top           ; Repeat for the next character

next:
    lea si, msg       ; Reload address of the string
    loop top          ; Decrement CX and repeat the loop if CX != 0

    mov ah, 4Ch       ; Exit the program
    int 21h

msg db 'DUET', 0      ; The string to print (null-terminated)
main endp
end main
