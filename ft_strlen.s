section .text
global ft_strlen

ft_strlen:
    xor rcx, rcx        ; Clear rcx (length counter)
    mov rsi, rdi        ; Copy the string pointer to rsi

.loop:
    cmp byte [rsi + rcx], 0 ; Compare the current byte with 0 (null terminator)
    je .done                ; If it is 0, jump to done
    inc rcx                 ; Increment the length counter
    jmp .loop               ; Repeat the loop

.done:
    mov rax, rcx        ; Move the length counter to rax (return value)
    ret                 ; Return