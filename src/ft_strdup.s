; ft_strdup.s
global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy

section .text
ft_strdup:
    push rbp                ; Guarda el frame pointer
    mov rbp, rsp            ; Establece nuevo frame pointer
    push rdi                ; Guarda el puntero original
    
    call ft_strlen          ; Calcula la longitud (resultado en rax)
    
    add rax, 1              ; Añade 1 para el carácter nulo
    mov rdi, rax            ; Pasa la longitud como argumento a malloc
    
    call malloc             ; Llama a malloc (resultado en rax)
    
    test rax, rax           ; Comprueba si malloc falló
    jz .error               ; Si es 0, ir a error
    
    mov rdi, rax            ; Destino = nuevo buffer
    pop rsi                 ; Origen = cadena original
    
    call ft_strcpy          ; Copia la cadena
    
    mov rsp, rbp            ; Restaura stack pointer
    pop rbp                 ; Restaura frame pointer
    ret                     ; Retorna (resultado ya en rax)
    
.error:
    pop rdi                 ; Limpia el stack
    mov rsp, rbp            ; Restaura stack pointer
    pop rbp                 ; Restaura frame pointer
    ret                     ; Retorna con 0 en rax (ya está en 0)