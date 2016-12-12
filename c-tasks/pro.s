.include "syscalls.asmh"
.data
.balign 4
struct: .skip 36
@ C equivalent:
@ struct ident {
@   char[16] first;
@   char[16] last;
@   int age; }

.balign 4
myName: .asciz "Joshua"

.balign 4
lastName: .asciz "Backstein"

.balign 4
outFormat: .asciz "%s %s: %d\n"

.balign 4
agePrompt: .asciz "What is your age? "
.balign 4
agePromptPattern: .asciz "%d"

.balign 4
ageRange1: .asciz "You are but a wee lad.\n"
.balign 4
ageRange2: .asciz "You are an adult.\n"
.balign 4
ageRange3: .asciz "You are old.\n"

@ C-style aliases for offsets in struct
.set first, 0
.set last, 16
.set age, 32

.text
.global main
main:
push {lr}
b loadstruct
mov r1, #20
mov r0, #0
b while

while: @ While loop (While R0 < R1)
add r0, r0, #2
cmp r0, r1
blt while   @ if R0 < R1, b while
b   quit_gcc    @ else, b quit

for: @ For loop
mov r0, #1
neg r0, r0
b quit_gcc

loadstruct:
ldr r0, =myName
ldr r1, =struct
mov r2, #0
bl LoadString
ldr r0, =lastName
add r1, #last
bl LoadString
@mov r0, #23
@ldr r1, =struct
@str r0, [r1, #age]
bl PromptAge
mov r1, r0
ldr r0, =struct
bl StoreAgeInStruct
bl printS
@ Check the age range.
ldr r0, =struct
ldr r0, [r0, #age]
cmp r0, #18
blt Minor
cmp r0, #50
blt Adult
b Old
.LageDone:
bl printf
bl quit_gcc

Minor:
ldr r0, =ageRange1
bl .LageDone
Adult:
ldr r0, =ageRange2
bl .LageDone
Old:
ldr r0, =ageRange3
bl .LageDone

LoadString: @args: r0 = data to load, r1 = location to load to
ldrb r3, [r0, r2]
strb r3, [r1, r2]
cmp r3, #0
moveq r2, #0
bxeq lr @return
add r2, r2, #1
b LoadString

PromptAge: @returns input to r0.
push {lr}
ldr r0, =agePrompt
bl printf
ldr r0, =agePromptPattern
sub sp, sp, #8
mov r1, sp
bl scanf
ldr r0, [sp]
add sp, sp, #8
pop {pc}

StoreAgeInStruct: @args: r0 = struct pointer, r1 = age to save in struct
push {lr}
str r1, [r0, #age]
pop {pc}

printS:
push {lr}
ldr r0, =outFormat
ldr r1, =struct
ldr r2, =struct
add r2, r2, #last
ldr r3, =struct
add r3, r3, #age
ldr r3, [r3]
bl printf
pop {pc}

quit:
mov r7, #EXIT
svc #0

quit_gcc:
pop {pc}
