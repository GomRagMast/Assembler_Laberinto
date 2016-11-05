org 100h

mov ah, 0
mov al, 13h
int 10h    

lea bx, lab 
call aleatorio

inicio:
    cmp [bx],'x'
    je et1 
    call punto
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

punto:
    mov al, valor
    cmp pin,al
    jge reload  
    inc pin
ret    
reload:  
    mov color,40         
    call pixel
    mov pin,0 
    call aleatorio
ret    

pixel:
    mov al, color
    mov cx, columna
    mov dx, fila
    mov ah, 0ch
    int 10h
    
ret              
;------------------------------------------------------
aleatorio:
    mov ah,0
    int 1ah
    mov ax, dx
    xor dx, dx
    mov cx, 100
    div cx
    mov valor, dl
ret
;--------------------------------------------
;Variables
columna dw 10
fila    dw 10
color   db 40                   
pin     db 0 
valor   db 0

;Importar Libreria mapa laberinto
include "_laberinto.map.asm"    