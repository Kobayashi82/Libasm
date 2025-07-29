; ft_strlen.s
global ft_strlen

section .text
ft_strlen:
    xor rax, rax            ; Inicializa contador a 0 (rax = 0)

.loop:
    cmp byte [rdi + rax], 0 ; Compara el byte actual con 0
    je .done                ; Si es 0, termina
    inc rax                 ; Incrementa el contador
    jmp .loop               ; Vuelve al inicio del bucle

.done:
    ret                     ; Retorna (longitud en rax)