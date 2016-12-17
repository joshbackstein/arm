.include "syscalls.asmh"

.data
.balign 4
heap: .word 0

.balign 4
heap_end: .word 0

.text
.global addSixNumbers
.global brk
.global getHeap
.global powerOfTwo
.global printString
.global printUInt
.global svcExit
.global umod
.global unbrk

@ If one and only one bit is set and it is not the least
@ significant bit, it is a power of 2.
@ params:  r0 = int to check
@ returns:  0 if it is not a power of 2
@           1 if it is a power of 2
powerOfTwo:
  mov r1, #1
  ror r1, r1, #1
  clz r2, r0
  lsl r0, r2
  cmp r0, r1
  moveq r0, #1
  movne r0, #0
  bx lr

svcExit:
  mov r7, #EXIT
  svc #0

@ Prints a null-terminated string using WRITE syscall
@ params:  r0 = pointer to string
printString:
  push {lr}
  mov r1, r0  @ put pointer in right register for WRITE
  mov r2, #0
  .LoopString:
  ldrb r0, [r1, r2]
  cmp r0, #0
  addgt r2, #1
  bgt .LoopString
  mov r0, #1
  mov r7, #WRITE
  svc #0
  pop {pc}

@ Prints an integer using WRITE syscall
@ params:  r0 = int
printUInt:
  @ save number in r4; we're going to destroy it to find the length
  push {r4-r7, lr}
  mov r4, r0
  mov r5, #0 @ length

  @ get number length
  .LoopLength:
  mov r1, #10
  udiv r0, r0, r1
  add r5, #1
  cmp r0, #0
  bne .LoopLength

  mov r0, r4
  mov r7, #0
  @ Convert each digit to ascii, 
  .LoopStringInt:
  mov r1, #10
  bl umod
  add r0, r0, #0x30
  push {r0}
  sub r0, r0, #0x30
  add r7, #1
  sub r0, r4, r0
  mov r2, #10
  udiv r0, r0, r2
  udiv r4, r4, r2
  cmp r7, r5
  bne .LoopStringInt
  @ allocate that space on the heap
  mov r0, r5
  add r0, #1
  bl brk
  @ get our heap location
  bl getHeap
  mov r6, r0

  mov r2, #0
  .LoopStack:
  pop {r0}
  strb r0, [r6, r2]
  add r2, #1
  cmp r2, r5
  blo .LoopStack
  add r2, #1
  mov r0, #0
  strb r0, [r6, r2]

  @ Print the value
  mov r0, r6
  bl printString

  @ Undo our memory allocation
  neg r0, r5
  bl brk

  pop {r4-r7, pc}

@ mod function, since we don't have an instruction
@ params:  r0 = number
@          r1 = mod base
@ e.g.  1234%10: r0 = 1234, r1 = 10
@ return:  r0 = answer
umod:
  mov r2, r0
  udiv r0, r0, r1
  mul r3, r0, r1
  mov r0, r3
  sub r0, r2, r0
  bx lr

@ Allocate memory from heap
@ params:  r0 = amount to allocate
brk:
  push {r4, lr}
  mov r4, r0
  @ start by getting current break location
  mov r7, #BRK
  mov r0, #0
  svc #0

  @ Store heap & heap_end
  ldr r1, =heap
  ldr r1, [r1]
  cmp r1, #0 @ Only store heap if it hasn't been set
  ldreq r1, =heap
  streq r0, [r1]
  ldr r1, =heap_end
  str r0, [r1]

  @ Move break by requested amount
  add r0, r0, r4
  mov r7, #BRK
  svc #0

  @ Store new heap_end
  ldr r1, =heap_end
  str r0, [r1]

  @ Return
  pop {r4, pc}

@ Returns heap start
getHeap:
  ldr r0, =heap
  ldr r0, [r0]
  bx lr

@ Resets heap allocation
unbrk:
  ldr r0, =heap
  ldr r0, [r0]
  mov r7, #BRK
  svc #0
  bx lr

@ Add six numbers together and store the result in r0.
addSixNumbers:
  @ r0-r3 should be filled with four values, so we need to
  @ pop the other two from the stack into their respective
  @ registers. We'll immediately push them back so we don't
  @ change the stack pointer.
  pop {r4-r5}
  push {r4-r5}

  @ Add them all together.
  add r0, r1
  add r0, r2
  add r0, r3
  add r0, r4
  add r0, r5

  @ Return from the function.
  bx lr
