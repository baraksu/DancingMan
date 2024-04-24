.MODEL SMALL
.STACK 100H
.DATA
Righthand1 db 1
Lefthand2 db 1
Rightleg3 db 1
Leftleg4 db 1
Msg1 db 13,10,"what body part do you want to choose ",13,10,"$"
Msg2 db 13,10," Right hand 1",13,10,"$"
Msg3 db 13,10," left hand 1",13,10,"$"
Msg4 db 13,10," Right leg 3 1",13,10,"$"
Msg5 db 13,10,"left leg 4",13,10,"$"
color dw 0fh
.CODE 
jmp start
Proc body
Bodyloop:
Mov ah,0ch
Int 10h 
Inc dx
dec bx
cmp bx,0
jne Bodyloop
ret
endp body

Proc hand
handloop:
Mov ah,0ch
Int 10h 
Inc cx
dec bx
cmp bx,0
jne handloop
ret
endp hand

proc circle
 mov bp,sp
 pusha

 mov bx, [bp+4]
 mov ax,2
 mul bx
 mov bx,3
 sub bx,ax ; E=3-2r
 mov [bp+2],bx
 
 mov ax,color ;color goes in al
 mov ah,0ch
 
drawcircle:
 mov ax,color ;color goes in al
 mov ah,0ch
 
 mov cx, [bp+4] ;Octonant 1
 add cx, [bp+10] ;( x_value + x_center,  y_value + y_center)
 mov dx, [bp+6]
 add dx, [bp+8]
 int 10h
 
 mov cx, [bp+4] ;Octonant 4
 neg cx
 add cx, [bp+10] ;( -x_value + x_center,  y_value + y_center)
 int 10h
; 
 mov cx, [bp+6] ;Octonant 2
 add cx, [bp+10] ;( y_value + x_center,  x_value + y_center)
 mov dx, [bp+4]
 add dx, [bp+8]
 int 10h
; 
 mov cx, [bp+6] ;Octonant 3
 neg cx
 add cx, [bp+10] ;( -y_value + x_center,  x_value + y_center)
 int 10h
 
 mov cx, [bp+4] ;Octonant 8
 add cx, [bp+10] ;( x_value + x_center,  -y_value + y_center)
 mov dx, [bp+6]
 neg dx
 add dx, [bp+8]
 int 10h
; 
 mov cx, [bp+4] ;Octonant 5
 neg cx
 add cx, [bp+10] ;( -x_value + x_center,  -y_value + y_center)
 int 10h

 mov cx, [bp+6] ;Octonant 7
 add cx, [bp+10] ;( y_value + x_center,  -x_value + y_center)
 mov dx, [bp+4]
 neg dx
 add dx, [bp+8]
 int 10h
; 
 mov cx, [bp+6] ;Octonant 6
 neg cx
 add cx, [bp+10] ;( -y_value + x_center,  -x_value + y_center)
 int 10h
 
condition1:
 cmp [bp+2],0
 jg condition2      
 mov cx, [bp+6]
 mov ax, 2
 imul cx ;2y
 add ax, 3 ;ax=2y+3
 mov bx, 2
 mul bx  ; ax=2(2y+3)
 add [bp+2], ax
 mov bx, [bp+6]
 mov dx, [bp+4]
 cmp bx, dx  
 inc [bp+6]
 jmp drawcircle

condition2:
 ;e>0
 mov cx, [bp+6] 
 mov ax,2
 mul cx  ;cx=2y
 mov bx,ax
 mov cx, [bp+4]
 mov ax, -2
 imul cx ;cx=-2x
 add bx,ax
 add bx,5;bx=5-2z+2y
 mov ax,2
 imul bx ;ax=2(5-2z+2y)       
 add [bp+2],ax
 mov bx, [bp+6]
 mov dx, [bp+4]
 cmp bx, dx
 ja donedrawing
 dec [bp+4]    
 inc [bp+6]
 jmp drawcircle

donedrawing:
popa
ret
endp circle


START:
Mov ax,@data
Mov ds,ax
Mov ax,0013h
Int 10h 
 

; body loop
Mov cx,155
Mov bx,10

Push cx
Mov bp,sp
Push bx
bodys:
Mov cx,[bp]
Mov al,0fh
Mov dl,66
Mov bx,66
Call body
Pop bx
Dec bx
Pop cx
Inc cx
Push cx
Push bx
Cmp bx,0
Jne bodys
pop bx
pop bx
;end body 

;START LEFTLEG
Mov cx,156
Mov bx,2

Push cx
Mov bp,sp
Push bx
leftleg:
Mov cx,[bp]
Mov al,0fh
Mov dl,132
Mov bx,32
Call body
Pop bx
Dec bx
Pop cx
Inc cx
Push cx
Push bx
Cmp bx,0
Jne leftleg
pop bx
pop bx
;end leftleg

;start rightleg
Mov cx,163
Mov bx,2

Push cx
Mov bp,sp
Push bx
rightleg:
Mov cx,[bp]
Mov al,0fh
Mov dl,132
Mov bx,32
Call body
Pop bx
Dec bx
Pop cx
Inc cx
Push cx
Push bx
Cmp bx,0
Jne rightleg
pop bx
pop bx
;end rightleg


; left hand loop
Mov cx,123
Mov bx,3

Push cx
Mov bp,sp
Push bx
Lefthand:
Mov cx,[bp]
Mov al,0fh
Mov dl,69
Mov bx,32
Call hand
Pop bx
Dec bx
Pop cx
Inc cx
Push cx
Push bx
Cmp bx,0
Jne Lefthand
pop bx
pop bx
;end hand


; right hand loop
Mov cx,165
Mov bx,3

Push cx
Mov bp,sp
Push bx
righthand:
Mov cx,[bp]
Mov al,0fh
Mov dl,69
Mov bx,32
Call hand
Pop bx
Dec bx
Pop cx
Inc cx
Push cx
Push bx
Cmp bx,0
Jne righthand
pop bx
pop bx
;end hand

 ;start  face
mov bx, 160
Push bx ;x center
mov bx, 60
Push bx ;y center
mov bx, 0
Push bx ;zero
mov bx, 8
Push bx ; radius
Push color ; color
Call circle
pop bx
pop bx
pop bx
pop bx
pop bx

;end face

; start eyeball left


mov bx, 00156
Push bx ;x center
mov bx, 00057
Push bx ;y center
mov bx, 00000
Push bx ;zero
mov bx, 00002
Push bx ; radius
Push color ; color
Call circle
pop bx
pop bx
pop bx
pop bx
pop bx

;end eyeball left

; start eyeball right  

mov bx, 00164
Push bx ;x center
mov bx, 00057
Push bx ;y center
mov bx, 00000
Push bx ;zero
mov bx, 00002
Push bx ; radius

Push color ; color
Call circle
pop bx
pop bx
pop bx
pop bx
pop bx

;end eyeball right

