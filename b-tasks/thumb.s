.text
.syntax unified
.global _start 
.thumb_func
_start:
  @ Initialize variable to 0.
  mov r0, #0
Loop:
  @ Add one, compare it to 10, and keep looping if it is less than 10.
  add r0, #1
	cmp r0, #10
	blt Loop

  @ Double r0 three times. This should put it at 80.
  add r0, r0
  add r0, r0
  add r0, r0

  @ Compare it to 50.
  cmp r0, #50

  @ If it's less than 50, return an error code of 1, otherwise return an
  @ error code of 2.
  ITE lo 
  movlo r0, #1
  movhs r0, #2
	mov r7, #1
	svc #0
