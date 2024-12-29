section .text
global ft_write

ft_write:
    ; Arguments:
    ; rdi - file descriptor
    ; rsi - buffer to write
    ; rdx - number of bytes to write

    mov rax, 1          ; syscall number for sys_write
    syscall             ; make the syscall
    ret                 ; return