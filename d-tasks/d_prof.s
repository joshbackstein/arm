.data
hello: .asciz "Hello\n"
prompt: .asciz "Enter number (0 to exit): "
math_p: .asciz "Enter number: "
plus: .asciz "\n%d + %d = %d\n"
subt: .asciz "%d - %d = %d\n"
mult: .asciz "%d * %d = %d\n"
div:  .asciz "%d / %d = %d\n"
response: .asciz "You entered %d\n"
scanpat: .asciz "%d"
num: .word 1

.text
.global main 

main:
push {r4-r6, lr}
ldr  r0, =hello
bl   printf
sub  sp, sp, #4

interact:
@ Display prompt
ldr  r0, =prompt
bl   printf

@ Setup scanf to get number from user
ldr  r0, =scanpat
mov  r1, sp 
bl   scanf

@ Display result from scanf
ldr  r1, [sp]
ldr  r0, =response
bl   printf

@ Check if user entered 0
ldr  r1, [sp]
cmp  r1, #0
bne  interact
beq  math      @proceed to simple math if 0

@ Math test
math:
sub  sp, sp, #4  @ allocate stack space

@ Display prompt for math
ldr  r0, =math_p
bl   printf

@ Setup scanf
ldr  r0, =scanpat
mov  r1, sp 
bl   scanf

sub  sp, sp, #4
@ Display prompt for math
ldr  r0, =math_p
bl   printf

@ Setup scanf
ldr  r0, =scanpat
mov  r1, sp 
bl   scanf

@ Load from stack
ldr  r1, [sp, #4]
ldr  r2, [sp]

@ Do math
add  r3, r1, r2
sub  r4, r1, r2     @ these values are in r4-r6 to
mul  r5, r1, r2     @ save them from printf
sdiv r6, r1, r2

@print math results
ldr  r0, =plus
bl   printf

ldr  r1, [sp, #4]
ldr  r2, [sp]
mov  r3, r4
ldr  r0, =subt
bl   printf

ldr  r1, [sp, #4]
ldr  r2, [sp]
mov  r3, r5
ldr  r0, =mult
bl   printf

ldr  r1, [sp, #4]
ldr  r2, [sp]
mov  r3, r6
ldr  r0, =div
bl   printf

@ Close out program
add  sp, sp, #+12
mov  r0, #1
pop  {r4-r6, pc}    @ put everything back

