.data

@ Bytes
.balign 4
byte1: .byte 4
.balign 4
byte2: .byte 5

@ Shorts
.balign 4
short1: .short 4
.balign 4
short2: .short 5

@ Strings for printf
.balign 4
byteString: .asciz "Byte addition: %d\n"
.balign 4
shortString: .asciz "Short addition: %d\n"

.text
.global main
main:
push {r0-r9, lr}

ByteMath:
ldr r2, =byte2
ldr r2, [r2]
ldr r1, =byte1
ldr r1, [r1]
sadd8 r1, r1, r2
ldr r0, =byteString
bl printf

ShortMath:
ldr r2, =short2
ldr r2, [r2]
ldr r1, =short1
ldr r1, [r1]
sadd16 r1, r1, r2
ldr r0, =shortString
bl printf

CastByteToShort:
ldr r2, =byte1
ldr r2, [r2]
sxtb16 r0, r2
ldr r2, =byte2
ldr r2, [r2]
sxtb16 r1, r2

CastShortToInt:
ldr r2, =short1
ldr r2, [r2]
sxth r0, r2
ldr r2, =short2
ldr r2, [r2]
sxth r1, r2

exit:
pop {r0-r9, pc}
