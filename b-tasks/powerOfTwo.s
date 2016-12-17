@ powerOfTwo function is defined in ../utilities.s
@ it is included in the .o file when linked.
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
@ Check if 368 is a power of two.
ldr r0, =testOne
bl printString
mov r1, #8
mov r2, #46
mul r0, r2, r1
bl powerOfTwo

@ Print the result.
bl printUInt
ldr r0, =endl
bl printString

@ Check if 1024 is a power of two.
ldr r0, =testTwo
bl printString
mov r1, #16
mov r2, #64
mul r0, r2, r1
bl powerOfTwo

@ Print the result.
bl printUInt
ldr r0, =endl
bl printString

@ Exit the program.
bl svcExit
