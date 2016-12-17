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
  @ Save link register.
  push {lr}

  @ Grab the length of the string so we can use malloc to allocate the
  @ correct amount of memory.
  mov r0, #strLen
  bl malloc

  @ Store the pointer returned by malloc to mPtr.
  ldr r2, =mPtr
  str r0, [r2]

  @ To load the string, we need to put the pointer to the string into r0
  @ and the address to store the first character at into r1.
  mov r1, r0
  ldr r0, =string
  mov r2, #0
  bl LoadString

  @ Display the string.
  ldr r0, =mPtr
  ldr r0, [r0]
  bl printf

  @ Free the memory allocated by malloc.
  ldr r0, =mPtr
  ldr r0, [r0]
  bl free

  @ Put a 0 in r0 to indicate everything worked the way we wanted it to.
  mov r0, #0

  @ Go back to where we were before we called this function.
  pop {pc}

@ Load string into address byte by byte.
@   Arguments:
@     r0 = byte to store
@     r1 = address to store to
@     r2 = offset to add to r1 so we know where to put the character
LoadString:
  ldrb r3, [r0, r2]
  strb r3, [r1, r2]
  cmp r3, #0
  moveq r2, #0
  bxeq lr @return
  add r2, r2, #1
  b LoadString
