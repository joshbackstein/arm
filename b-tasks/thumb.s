.text
.syntax unified
.global _start 
.thumb_func
_start:
  mov r0, #0
Loop:
  add r0, #1
	cmp r0, #10
	blt Loop
  add r0, r0
  add r0, r0
  add r0, r0

  cmp r0, #50
  ITE lo 
  movlo r0, #1
  movhs r0, #2
	mov r7, #1
	svc #0
