jmp CODE
nop
db 'example!'
dw 512
db 1
dw 1
db 2
dw 224
dw 2880
db 0xf0
dw 9
dw 18
dw 2
dd 0
dd 0
db 0
db 0
db 0x29
dd 0
db 'ExampleDiskFAT12   '

CODE:
xor    ax,ax
mov    ss,ax
mov    sp,0x7c00
push   0x7c0
pop    ds
mov    si,STRING

LOADSTRING:
lods  byte[ds:si]
or     al,al
je     FINISH
mov    ah,0x0e
mov    bx,0x07
int    0x10
jmp    LOADSTRING

FINISH:
jmp $
STRING:
db 'Hello World',0
times 510-($-$$) db 0
db 0x55
db 0xaa
