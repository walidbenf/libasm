section .text
global ft_write
extern __errno_location

ft_write:
    ; Arguments:
    ; rdi - file descriptor
    ; rsi - buffer to write
    ; rdx - number of bytes to write

    mov rax, 1          ; syscall number for sys_write
    syscall             ; make the syscall

    ; Check for errors
    cmp rax, 0          ; compare rax with 0
    jge .no_error       ; if rax >= 0, no error

    ; Set errno
    neg rax             ; make the error code positive
    mov rdi, rax        ; move the error code to rdi
    call __errno_location wrt ..plt ; Get the address of errno
    mov [rax], edi      ; store the error code in errno
    mov rax, -1         ; set the return value to -1

.no_error:
    ret                 ; return