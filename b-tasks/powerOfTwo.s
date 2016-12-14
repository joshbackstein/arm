.include "../utilities.s"
.data
.balign 4
testOne: .asciz "Is 368 a power of two: "
.balign 4
testTwo: .asciz "Is 1024 a power of two: "
.balign 4
endl: .asciz "\n"

.text
.global _start
_start:
ldr r0, =testOne
bl printString
mov r1, #8
mov r2, #46
mul r0, r2, r1
bl powerOfTwo
bl printUInt
ldr r0, =endl
bl printString
ldr r0, =testTwo
bl printString
mov r1, #16
mov r2, #64
mul r0, r2, r1
bl powerOfTwo
bl printUInt
ldr r0, =endl
bl printString
bl svcExit
