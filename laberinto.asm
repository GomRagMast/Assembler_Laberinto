
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

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
    cmp columna, 60
    je et3
    jmp et4
et3:  
    mov columna, 10
    inc fila
et4:
    cmp fila, 30
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
color   db 79    

;------------------------------------------------------
;--------Importar Libreria mapa laberinto
include "_laberinto.map.asm"    
    
    
    
    ;Taller Practico: 
;    
;Laberinto 60 x 40  (solo la variable laberinto)
;Archivo laberinto.asm (imprime laberinto, coloca pixel de color x, )
;archivo .asm robot
;coordenada inicial 10, 10
;entrada 10,11
;salida 70,49
;color diferente a negro
;pixel 71
;Jueves de la semana 12 en emu8086
;NASM jueves de la semana 15

    ;Taller teorico
;Jueves Semana 15