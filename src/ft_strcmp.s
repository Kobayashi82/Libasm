; ft_strcmp.s
global ft_strcmp

section .text
ft_strcmp:
    xor rcx, rcx               ; Inicializa el índice a 0
    xor rax, rax               ; Inicializa rax a 0
    xor rdx, rdx               ; Inicializa rdx a 0

.loop:
    mov al, byte [rdi + rcx]   ; Carga el byte de la primera cadena
    mov dl, byte [rsi + rcx]   ; Carga el byte de la segunda cadena
    
    cmp al, 0                  ; Comprueba si el primer byte es 0
    je .compare                ; Si es 0, compara
    
    cmp dl, 0                  ; Comprueba si el segundo byte es 0
    je .compare                ; Si es 0, compara
    
    cmp al, dl                 ; Compara los dos bytes
    jne .compare               ; Si son diferentes, compara
    
    inc rcx                    ; Incrementa el índice
    jmp .loop                  ; Repite
    
.compare:
    sub rax, rdx               ; Calcula la diferencia (al - dl)
    ret                        ; Retorna la diferencia