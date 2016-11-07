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
    cmp columna, 70   ;20
    je et3
    jmp et4
et3:  
    mov columna, 10
    inc fila
et4:
    cmp fila, 50      ;20
    je finlab
    jmp inicio
finlab: 
    mov columna, 10
    mov fila, 11
    mov color,91
    call pixel 
llega:
    cmp fila,48       ;18
    je meta 
    call bot 
    jmp llega
meta:
    cmp columna,69    ;19
    je gameover
    call bot     
    jmp llega
gameover:      
ret 
;--------------------------------------------------
bot:
    cmp der, 1
    je arriba
    cmp izq, 1
    je abajo
    cmp arr, 1
    je izquierda
    cmp aba, 1
    je derecha
    jmp bot
arriba:
    mov arr,1
    mov aba,0
    mov izq,0
    mov der,0
    dec fila
    call compara 
    inc fila 
    cmp al,71
    je derecha
    mov color,9 
    call pixel  
    mov color,91
    dec fila  
    cmp al, 40
    je punte
    jmp continua
derecha:
    mov arr,0
    mov aba,0
    mov izq,0
    mov der,1 
    inc columna
    call compara 
    dec columna 
    cmp al,71
    je abajo    
    mov color,9 
    call pixel  
    mov color,91
    inc columna
    cmp al, 40
    je punte 
    jmp continua
abajo:
    mov arr,0
    mov aba,1
    mov izq,0
    mov der,0
    inc fila
    call compara 
    dec fila  
    cmp al,71
    je izquierda
    mov color,9 
    call pixel  
    mov color,91
    inc fila    
    cmp al, 40
    je punte
    jmp continua          
izquierda: 
    mov arr,0
    mov aba,0
    mov izq,1
    mov der,0
    dec columna
    call compara 
    inc columna 
    cmp al,71
    je arriba   
    mov color,9 
    call pixel  
    mov color,91
    dec columna 
    cmp al, 40
    je punte
    jmp continua 
punte:
    call puntar
continua:
    call pixel
ret  
;--------------------------------------------------
compara:        
    mov cx, columna
    mov dx, fila
    mov ah, 0dh
    int 10h
ret
;-------------------------------------------------- 
puntar:
    inc puntos                                             
ret
;-------------------------------------------------- 
punto:
    mov al, valor
    cmp pin,al
    jge reload  
    inc pin
ret
;--------------------------------------------------
reload:  
    mov color,40         
    call pixel
    mov pin,0 
    call aleatorio
ret    
;--------------------------------------------------
pixel:
    mov al, color
    mov cx, columna
    mov dx, fila
    mov ah, 0ch
    int 10h
ret              
;--------------------------------------------------
aleatorio:
    mov ah,0
    int 1ah
    mov ax, dx
    xor dx, dx
    mov cx, 100
    div cx
    mov valor, dl
ret
;--------------------------------------------------

;-----------------Variables------------------------
columna dw 10
fila    dw 10
color   db 40                   
pin     db 0 
valor   db 0   
der     db 1
izq     db 0
arr     db 0
aba     db 0 
puntos  db 0

;Importar Libreria mapa laberinto
include "2_laberinto.map.asm"    