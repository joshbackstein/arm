.data
longstring:
	.asciz "%llu\n"

.text
.global main
main:
  @ Stack needs to be 8-byte aligned for printf to print 64-bit numbers.
	push {r3-r9, lr}

	adr r8, longints
	ldrd r4, [r8]
	ldrd r6, [r8, #8]
	adds r2, r4, r6
	adc r3, r5, r7
	ldr r0, longstring_a
	bl printf


@		xy
@		zw
@	------
@ (w, x) (w, y)
@ (z, y)
@ ------
@	(x + y + w)							y is being treated as lower register of w * y

	ldrd r4, [r8]						@ r4=y, r5=x
	ldrd r6, [r8, #8]				@	r6=w, r7=z
	umull r0, r1, r4, r6		@	y * w					r0=y, r6=w
	umull r2, r3, r5, r6		@ x * w					r5=x, r6=w
	umull r8, r9, r4, r7		@ z * y
	add r1, r1, r0					@ y + w
	add r1, r1, r5					@ (y + w) + x

	mov r2, r0
	mov r3, r1
	ldr r0, longstring_a
	bl printf


  @ Pop everything off the stack.
	pop {r3-r9, pc}

longints:
.balign 8
	.word 0xcb417800
	.word 0x2
	.word 0xa43b7400
	.word 0xb

longstring_a:
	.word longstring
