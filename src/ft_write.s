extern __errno_location

section .text
    global ft_write

ft_write:
    ; Parameters are already in the correct registers
    ; rdi = file descriptor
    ; rsi = pointer to string
    ; rdx = number of characters to write

    ; Perform the write syscall
    mov rax, 1         ; syscall number for sys_write - https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
    syscall
    
    ; Check for error (if rax < 0)
    cmp rax, 0
    jge no_error       ; if rax >= 0, no error

    ; Handle error
    neg rax            ; negate rax to get the positive error number
    mov rdi, rax       ; error number to rdi
    call __errno_location WRT ..plt ; get address of errno
    mov rdi, rax       ; store the address of errno in rdi
    mov [rdi], edi     ; store error number in errno
    mov rax, -1        ; return -1 to indicate error

no_error:
    ret