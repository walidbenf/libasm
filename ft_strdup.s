section .text
global ft_strdup
extern ft_strlen
extern malloc
extern ft_strcpy
extern __errno_location

ft_strdup:
    ; Arguments:
    ; rdi - source string

    ; check if the source string is NULL
    test rdi, rdi
    jz .null_error

    ; calculate the length of the source string
    push rdi            ; save rdi on the stack
    call ft_strlen      ; call ft_strlen to get the length of the string
    add rax, 1          ; Include the null terminator in the length

    ; allocate memory for the new string
    mov rdi, rax        ; set the size for malloc
    call malloc wrt ..plt ; call malloc using the PLT
    test rax, rax       ; check if malloc returned NULL
    je .malloc_error    ; if NULL, jump to malloc_error

    ; copy the source string to the new string
    pop rsi             ; restore rdi (source string) from the stack to rsi
    mov rdi, rax        ; copy the destination pointer (malloc result) to rdi
    call ft_strcpy      ; call ft_strcpy to copy the string

    ; return the pointer to the new string
    ret

.null_error:
    call __errno_location wrt ..plt ; get the address of errno
    mov dword [rax], 22 ; set errno to EINVAL (22)
    xor rax, rax        ; set the return value to NULL
    ret

.malloc_error:
    pop rsi             ; restore rdi (source string) from the stack
    call __errno_location wrt ..plt ; get the address of errno
    mov dword [rax], 12 ; set errno to ENOMEM (12)
    xor rax, rax        ; set the return value to NULL
    ret