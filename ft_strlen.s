section .text			; define the section as text
global ft_strlen		; define the function as global

ft_strlen:
    xor rcx, rcx        ; clear rcx (length counter) || xor = exclusive OR
    mov rsi, rdi        ; copy the string pointer to rsi(src to dest) || mov = move

.loop:
    cmp byte [rsi + rcx], 0 ; compare the current byte with 0 (null terminator) || cmp = compare
    je .done                ; if it is 0, jump to done || je = jump if equal
    inc rcx                 ; increment the length counter || inc = increment
    jmp .loop               ; repeat the loop || jmp = jump

.done:
    mov rax, rcx        ; move the length counter to rax (return value)
    ret                 ; return

