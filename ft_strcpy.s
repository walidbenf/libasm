section .text
global ft_strcpy

ft_strcpy:
    ; Arguments:
    ; rdi - destination string
    ; rsi - source string

    mov rdx, rdi        ; Save the destination pointer in rdx

.copy_loop:
    mov al, [rsi]       ; Load the byte from source string
    mov [rdi], al       ; Store the byte in destination string
    inc rsi             ; Move to the next byte in source string
    inc rdi             ; Move to the next byte in destination string
    test al, al         ; Check if the byte is 0 (null terminator)
    jnz .copy_loop      ; If not, repeat the loop

    mov rax, rdx        ; Move the destination pointer to rax (return value)
    ret                 ; Return