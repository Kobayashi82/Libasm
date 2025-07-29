; ft_read.s
global ft_read
extern __errno_location     ; Para Linux
; extern ___error           ; Para macOS (descomentar si usas macOS)

section .text
ft_read:
    mov rax, 0              ; Número de syscall para read
    syscall                 ; Llamada al sistema
    
    cmp rax, 0              ; Comprueba si hay error
    jl .error               ; Si es negativo, hay error
    ret                     ; Si no, retorna normalmente
    
.error:
    neg rax                 ; Convierte el código de error a positivo
    mov rdi, rax            ; Guarda el código de error
    
    call __errno_location   ; Obtiene la dirección de errno
    ; call ___error         ; Para macOS (descomentar si usas macOS)
    
    mov [rax], rdi          ; Guarda el código de error en errno
    mov rax, -1             ; Retorna -1 para indicar error
    ret