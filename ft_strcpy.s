section .text
global ft_strcpy

ft_strcpy:
    ; arguments:
    ; rdi - destination string
    ; rsi - source string

    mov rdx, rdi        ; Save the destination pointer in rdx

.copy_loop:
    mov al, [rsi]       ; copy the byte from source string to al
    mov [rdi], al       ; store the byte in the destination string
    inc rsi             ; increment the source pointer
    inc rdi             ; increment the destination pointer
    test al, al         ; test if the byte is 0 (null terminator)
    jnz .copy_loop      ; jnz = jump if not zero

    mov rax, rdx        ; move the destination pointer to rax (return value)
    ret                 ; return
