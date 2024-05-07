.MODEL SMALL

.STACK 100H

.DATA

Type db 1

stateRightHand db 2
stateLeftHand db 2
stateRightLeg db 2
stateLeftLeg db 2


color dw 0fh


logo db "          _                  _                                     ", 13,10,        "         | |                (_)                                    ", 13,10,        "       __| | __ _ _ __   ___ _ _ __   __ _   _ __ ___   __ _ _ __  ", 13,10,        "      / _` |/ _` | '_ \ / __| | '_ \ / _` | | '_ ` _ \ / _` | '_ \ ", 13,10,        "     | (_| | (_| | | | | (__| | | | | (_| | | | | | | | (_| | | | |", 13,10,        "      \__,_|\__,_|_| |_|\___|_|_| |_|\__, | |_| |_| |_|\__,_|_| |_|", 13,10,        "                                      __/ |                        ", 13,10,        "                                     |___/                         ",13,10,13,10,"Created by Omer Zelcer $"






.CODE

jmp start

proc printrighthandproc

cmp stateRightHand,1

je printrighthandprocstate1

 

cmp stateRightHand,2

je printrighthandprocstate2

 

cmp stateRightHand,3

je printrighthandprocstate3

ret

printrighthandprocstate1: 

mov bx, 32

mov cx, 165

mov dx, 69

printrighthandprocstate1Loop:

Mov ah,0ch

Int 10h

Inc dx

inc cx

dec bx

cmp bx,0

jne printrighthandprocstate1Loop  

ret

 

printrighthandprocstate2:

mov bx, 32

mov cx, 165

mov dx, 69

printrighthandprocstate2Loop:

Mov ah,0ch

Int 10h

inc cx

dec bx

cmp bx,0

jne printrighthandprocstate2Loop  

 

ret

printrighthandprocstate3:

                mov bx, 32

mov cx, 165

mov dx, 69

printrighthandprocstate3Loop:

Mov ah,0ch

Int 10h

dec dx

inc cx

dec bx

cmp bx,0

jne printrighthandprocstate3Loop  

ret

endp printrighthandproc


;end move right hand


proc printlefthandproc

cmp stateleftHand,1

je printlefthandprocstate1

 

cmp stateleftHand,2

je printlefthandprocstate2

 

cmp stateleftHand,3

je printlefthandprocstate3

ret

printlefthandprocstate1: 

mov bx, 32

mov cx, 155

mov dx, 69

printlefthandprocstate1Loop:

Mov ah,0ch

Int 10h

Inc dx

dec cx

dec bx

cmp bx,0

jne printlefthandprocstate1Loop  

ret

 

printlefthandprocstate2:

mov bx, 32

mov cx, 155

mov dx, 69

printlefthandprocstate2Loop:

Mov ah,0ch

Int 10h

dec cx

dec bx

cmp bx,0

jne printlefthandprocstate2Loop  

 

ret

printlefthandprocstate3:

mov bx, 32

mov cx, 155

mov dx, 69

printlefthandprocstate3Loop:

Mov ah,0ch

Int 10h

dec dx

dec cx

dec bx

cmp bx,0

jne printlefthandprocstate3Loop  

ret

endp printlefthandpro

 
;end move left hand



proc printrightlegproc

cmp stateRightleg,1

je printrightlegprocstate1

 

cmp stateRightleg,2

je printrightlegprocstate2

 

cmp stateRightleg,3

je printrightlegprocstate3

ret

printrightlegprocstate1: 

mov bx, 32

mov cx, 163

mov dx, 132

printrightlegprocstate1Loop:

Mov ah,0ch

Int 10h

Inc dx

dec cx

dec bx

cmp bx,0

jne printrightlegprocstate1Loop  

ret

 

printrightlegprocstate2:

mov bx, 32

mov cx, 163

mov dx, 132

printrightlegprocstate2Loop:

Mov ah,0ch

Int 10h

inc dx

dec bx

cmp bx,0

jne printrightlegprocstate2Loop  

 

ret

printrightlegprocstate3:

mov bx, 32

mov cx, 163

mov dx, 132

printrightlegprocstate3Loop:

Mov ah,0ch

Int 10h

inc dx

inc cx

dec bx

cmp bx,0

jne printrightlegprocstate3Loop  

ret

endp printrightlegproc

;end move right leg


proc printleftlegproc

cmp stateleftleg,1

je printleftlegprocstate1

 

cmp stateleftleg,2

je printleftlegprocstate2

 

cmp stateleftleg,3

je printleftlegprocstate3

ret

printleftlegprocstate1: 

mov bx, 32

mov cx, 156

mov dx, 132

printleftlegprocstate1Loop:

Mov ah,0ch

Int 10h

Inc dx

dec cx

dec bx

cmp bx,0

jne printleftlegprocstate1Loop  

ret

 

printleftlegprocstate2:

mov bx, 32

mov cx, 156

mov dx, 132

printleftlegprocstate2Loop:

Mov ah,0ch

Int 10h

inc dx

dec bx

cmp bx,0

jne printleftlegprocstate2Loop  

 

ret

printleftlegprocstate3:

mov bx, 32

mov cx, 156

mov dx, 132

printleftlegprocstate3Loop:

Mov ah,0ch

Int 10h

inc dx

inc cx

dec bx

cmp bx,0

jne printleftlegprocstate3Loop  

ret

endp printleftlegproc

;end move left leg
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

Proc redraw

redrawloop:

Mov ah,0ch

Int 10h

Inc cx

dec bx

cmp bx,0

jne redrawloop

ret

endp redraw

 

 

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



lea dx, logo
mov ah,09h
int 21h

mov ah,001h
int 21h




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

Mov bx,1

 

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

Mov bx,1

 

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

Mov bx,1

 

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

 

Onclick:

  mov ah,00h

  int 16h

cmp al,31h

je righthandtype

cmp al,32h

je lefthandtype

cmp al,33h

je rightlegtype

cmp al,34h

je leftlegtype

cmp ah,48h  ;uparrow

je nextstate

cmp ah,50h  ;downarrow
je backstate

jmp Onclick

 

 

 

righthandtype:

mov type,1

jmp Onclick

 

lefthandtype:

mov type,2

jmp Onclick

 

rightlegtype:

mov type,3

jmp Onclick

 

leftlegtype:

mov type,4

jmp Onclick

 

nextstate:

cmp type,1

je printrighthand

 

cmp type,2

je printlefthand

 

cmp type,3

je printrightleg

 

cmp type,4

je printleftleg

mov type,1

printrighthand:

cmp stateRightHand,3
je setstaterighthand1

mov al,0

call printrighthandproc

inc stateRightHand

mov al,0fh

call printrighthandproc

jmp Onclick
   
   
setstaterighthand1:
mov al,0
call printrighthandproc
mov stateRightHand,1
mov al,0fh
call printrighthandproc
jmp Onclick
;endrighthand


printlefthand:
cmp stateleftHand,3
je setstatelefthand1

mov al,0

call printlefthandproc

inc stateleftHand

mov al,0fh

call printlefthandproc

jmp Onclick
   
   
setstatelefthand1:
mov al,0
call printlefthandproc
mov stateleftHand,1
mov al,0fh
call printlefthandproc
jmp Onclick
;end left hand


printrightleg:

cmp stateRightleg,3
je setstaterightleg1

mov al,0

call printrightlegproc

inc stateRightleg

mov al,0fh

call printrightlegproc

jmp Onclick
   
   
setstaterightleg1:
mov al,0
call printrightlegproc
mov stateRightleg,1
mov al,0fh
call printrightlegproc
jmp Onclick

;end right leg     
      

printleftleg:
cmp stateleftleg,3
je setstateleftleg1

mov al,0

call printleftlegproc

inc stateleftleg

mov al,0fh

call printleftlegproc

jmp Onclick
   
   
setstateleftleg1:
mov al,0
call printleftlegproc
mov stateleftleg,1
mov al,0fh
call printleftlegproc
jmp Onclick



backstate:

cmp type,1

je printrighthandB

 

cmp type,2

je printlefthandb

 

cmp type,3

je printrightlegb

 

cmp type,4

je printleftlegb      



printrighthandB:

cmp stateRightHand,1
je setstaterighthand1B

mov al,0

call printrighthandproc

dec stateRightHand

mov al,0fh

call printrighthandproc

jmp Onclick
   
   
setstaterighthand1B:
mov al,0
call printrighthandproc
mov stateRightHand,3
mov al,0fh
call printrighthandproc
jmp Onclick







jmp Onclick
;end right hand


printlefthandB:

cmp stateleftHand,1
je setstatelefthand1B

mov al,0

call printlefthandproc

dec stateleftHand

mov al,0fh

call printlefthandproc

jmp Onclick
   
   
setstatelefthand1B:
mov al,0
call printlefthandproc
mov stateleftHand,3
mov al,0fh
call printlefthandproc
jmp Onclick
;end left hand


printrightlegB:

cmp stateRightleg,1
je setstaterightleg1B

mov al,0

call printrightlegproc

dec stateRightleg

mov al,0fh

call printrightlegproc

jmp Onclick
   
   
setstaterightleg1B:
mov al,0
call printrightlegproc
mov stateRightleg,3
mov al,0fh
call printrightlegproc
jmp Onclick
;end right leg


printleftlegB:

cmp stateleftleg,1
je setstateleftleg1B

mov al,0

call printleftlegproc

dec stateleftleg

mov al,0fh

call printleftlegproc

jmp Onclick
   
   
setstateleftleg1B:
mov al,0
call printleftlegproc
mov stateleftleg,3
mov al,0fh
call printleftlegproc
jmp Onclick
;end left leg



jmp Onclick
