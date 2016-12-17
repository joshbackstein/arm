@ addSixNumbers is defined in ../utilities.s
@ it is included in the .o file when linked.

.data
@ Messages for displaying the numbers and their sum.
.balign 4
displayNumber1: .asciz "Value being used for r0 is: "
.balign 4
displayNumber2: .asciz "Value being used for r1 is: "
.balign 4
displayNumber3: .asciz "Value being used for r2 is: "
.balign 4
displayNumber4: .asciz "Value being used for r3 is: "
.balign 4
displayNumber5: .asciz "Value being used for SP is: "
.balign 4
displayNumber6: .asciz "Value being used for SP+4 is: "
.balign 4
displaySum: .asciz "Sum of numbers is: "
.balign 4
endl: .asciz "\n"

@ Set values to add together
.set VALUE1, 1
.set VALUE2, 2
.set VALUE3, 3
.set VALUE4, 4
.set VALUE5, 5
.set VALUE6, 6

.text
.global _start
_start:

@ Display which values we will use and where we will use them.
displayNumbers:
  ldr r0, =displayNumber1
  bl printString
  mov r0, #VALUE1
  bl printUInt
  ldr r0, =endl
  bl printString
  ldr r0, =displayNumber2
  bl printString
  mov r0, #VALUE2
  bl printUInt
  ldr r0, =endl
  bl printString
  ldr r0, =displayNumber3
  bl printString
  mov r0, #VALUE3
  bl printUInt
  ldr r0, =endl
  bl printString
  ldr r0, =displayNumber4
  bl printString
  mov r0, #VALUE4
  bl printUInt
  ldr r0, =endl
  bl printString
  ldr r0, =displayNumber5
  bl printString
  mov r0, #VALUE5
  bl printUInt
  ldr r0, =endl
  bl printString
  ldr r0, =displayNumber6
  bl printString
  mov r0, #VALUE6
  bl printUInt
  ldr r0, =endl
  bl printString

@ Load registers and stack with our values.
loadNumbers:
  mov r0, #VALUE1
  mov r1, #VALUE2
  mov r2, #VALUE3
  mov r3, #VALUE4
  mov r4, #VALUE5
  mov r5, #VALUE6
  push {r4, r5}

@ Add the numbers together.
addNumbers:
  bl addSixNumbers

@ Clean up the stack.
cleanStack:
  pop {r4, r5}

@ Push the result to the stack so we don't lose it.
saveResult:
  push {r0}

@ Display the result.
displayResult:
  ldr r0, =displaySum
  bl printString
  @ We need to pop it from the stack so we can display it.
  pop {r0}
  bl printUInt
  ldr r0, =endl
  bl printString

@ Exit the program.
  mov r0, #0
  bl svcExit
