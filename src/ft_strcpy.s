; ft_strcpy.s
global ft_strcpy

section .text
ft_strcpy:
    mov rax, rdi               ; Guarda el puntero de destino (para retornar)
    xor rcx, rcx               ; Inicializa el índice a 0

.loop:
    mov dl, byte [rsi + rcx]   ; Obtiene el byte de la fuente
    mov byte [rdi + rcx], dl   ; Lo copia al destino
    cmp dl, 0                  ; Comprueba si es el byte nulo
    je .done                   ; Si es 0, termina
    inc rcx                    ; Incrementa el índice
    jmp .loop                  ; Repite

.done:
    ret                        ; Retorna el puntero de destino (en rax)