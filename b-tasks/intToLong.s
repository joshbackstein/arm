.data
.balign 4
label:  .asciz "Long multiply result: %ld\n"

.text
.global main
main:
push {lr}
@ r0 and r1 contain ints.
mov r0, #32
neg r0, r0
mov r1, #123

@ cast r1 to long
mov r2, r1
cmp r2, #0
movpl r3, #0
movmi r3, #1
negmi r3, r3

@ cast r0 to long
cmp r0, #0
movpl r1, #0
movmi r1, #1
negmi r1, r1

@ Do math to test
smull r4, r5, r0, r2
ldr r0, =label
mov r1, r4
mov r2, r5
bl printf
pop {pc}
