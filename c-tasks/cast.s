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

@ String for printf
.balign 4
displayString: .asciz "%d\n"

.text
.global main
main:
push {r0-r9, lr}

CastByteToShort:
ldr r2, =byte1
ldr r2, [r2]
sxtb16 r0, r2
ldr r2, =byte2
ldr r2, [r2]
sxtb16 r1, r2

CastShortToInt:
ldr r2, =short1:
ldr r2, [r2]
sxth r0, r2
ldr r2, =short2:
ldr r2, [r2]
sxth r1, r2

exit:
pop {r0-r9, pc}
