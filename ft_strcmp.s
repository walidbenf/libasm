section .text
global ft_strcmp
extern __errno_location
ft_strcmp:
    ; arguments:
    ; rdi - pointer to the first string (s1)
    ; rsi - pointer to the second string (s2)

    xor rax, rax        ; clear rax (used for return value)

.compare_loop:
    mov al, [rdi]       ; load the byte from first string to al
    mov dl, [rsi]       ; load the byte from second string to al
    cmp al, dl          ; compare the bytes of the strings
    jne .not_equal      ; if they are not equal, jump to not_equal
    test al, al         ; check if the byte is 0 (null terminator)
    je .equal           ; if it is 0, the strings are equal, jump to equal
    inc rdi             ; move to the next byte in the first string
    inc rsi             ; move to the next byte in the second string
    jmp .compare_loop   ; repeat the loop

.not_equal:
    sub al, dl          ; calculate the difference between the bytes
    movsx rax, al       ; copy the difference to rax (sign-extend) || movsx = move with sign extension
    ret                 ; return the result

.equal:
    xor eax, eax        ; set the return value to 0 (strings are equal)
    ret                 ; return