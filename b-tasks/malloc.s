.include "../syscalls.asmh"
.data
.balign 4
mPtr: .word 0
.balign 4
string: .asciz "This is in the heap!\n"
.set strLen, . -string

.text
.global main
main:
push {lr}
mov r0, #strLen
bl malloc
ldr r2, =mPtr
str r0, [r2]
mov r1, r0
ldr r0, =string
mov r2, #0
bl LoadString
ldr r0, =mPtr
bl printf
ldr r0, =mPtr
pop {pc}

LoadString: @args: r0 = data to load, r1 = location to load to
ldrb r3, [r0, r2]
strb r3, [r1, r2]
cmp r3, #0
moveq r2, #0
bxeq lr @return
add r2, r2, #1
b LoadString
