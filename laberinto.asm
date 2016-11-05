
org 100h

mov ah, 0
mov al, 13h
int 10h    

lea bx, lab

inicio:
    cmp [bx],'x'
    je et1
    jmp et2

et1:  
    mov color, 71
    call pixel
et2:
    inc bx    
    inc columna
    cmp columna, 70
    je et3
    jmp et4
et3:  
    mov columna, 10
    inc fila
et4:
    cmp fila, 50
    je fin
    jmp inicio
fin: 
    ;Codigo robot

ret    

pixel:
    mov al, color
    mov cx, columna
    mov dx, fila
    mov ah, 0ch
    int 10h
    
ret

columna dw 10
fila    dw 10
color   db 40    

;------------------------------------------------------
;Importar Libreria mapa laberinto
include "_laberinto.map.asm"    
    