.data
@ Create the array.
.balign 4
array:
  .word 1
  .word 2
  .word 3
  .word 4
  .word 5
  .word 6

@ Create message to display.
.balign 4
tlabel:
  .asciz "Value in slot %d: %d\n"

.text
.balign 4
.global main
main:
  @ Save the registers so we don't trash them.
  push {r4-r5, lr}

  @ Set up variables to use to traverse array with.
  @ We will multiply these values together to figure
  @ out what the offset is of the spot in the array
  @ we want to access.
  mov r4, #0
  mov r5, #4
.Ltraverse:
  @ Load message pointer to display.
  ldr r0, =tlabel
  mov r1, r4

  @ Get array pointer.
  ldr r2, =array

  @ Get offset and add it to the pointer value.
  mul r3, r4, r5 
  add r2, r2, r3

  @ Dereference the pointer and display the value.
  ldr r2, [r2]
  bl  printf

  @ Increment our counter.
  add r4, r4, #1

  @ If we haven't hit the 6th element of the array yet,
  @ do the loop again.
  cmp r4, #6
  bne .Ltraverse

  @ Put the original values back into the registers.
  pop {r4-r5, pc}
