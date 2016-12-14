.data
.balign 4
array:
  .word 1
  .word 2
  .word 3
  .word 4
  .word 5
  .word 6

.balign 4
tlabel:
  .asciz "Value in slot %d: %d\n"

.text
.balign 4
.global main
main:
  push {r4-r5, lr}
  mov r4, #0
  mov r5, #4
.Ltraverse:
  ldr r0, =tlabel
  mov r1, r4
  ldr r2, =array
  mul r3, r4, r5 
  add r2, r2, r3
  ldr r2, [r2]
  bl  printf
  add r4, r4, #1
  cmp r4, #6
  bne .Ltraverse
  pop {r4-r5, pc}
