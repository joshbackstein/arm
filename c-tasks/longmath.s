.data
longstring:
	.asciz "%llu\n"

.text
.global main
main:
  @ Stack needs to be 8-byte aligned for printf to print 64-bit numbers.
	push {r3-r9, lr}

	adr r8, longints        @ Get address of longints struct
	ldrd r4, [r8]           @ Load 1st long into r5&r4
	ldrd r6, [r8, #8]       @ Load 2nd long into r7&r6
	adds r2, r4, r6         @ Add low words from longs into r2, update status reg
	adc r3, r5, r7          @ Add high words from longs into r3, carry if needed
	ldr r0, longstring_a    @ Load printf string
	bl printf


@		xy
@		zw
@	------
@ (w, x) (w, y)
@ (z, y)
@ ------
@	(dx + dy + dw)							y is being treated as lower register of w * y
                          @ Variables in comments refer to above diagram
	ldrd r4, [r8]						@ r4=y, r5=x  Load long value into r5&r4
	ldrd r6, [r8, #8]				@	r6=w, r7=z  Load long value into r7&r6
	umull r0, r1, r4, r6		@	y * w				Long multiply y and w into r1&r0
                            
	umull r2, r3, r5, r6		@ x * w				Long multiply x and w into r3&r2
  umull r8, r9, r4, r7		@ z * y       Long multiply z and y into r9&r8
                          @ skip z * x, since we only have 2 places
	add r1, r1, r0					@ y + w       Add all results together to finish long multiplication
	add r1, r1, r5					@ (y + w) + x

	mov r2, r0              @ move result into even-aligned registers for printf
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
