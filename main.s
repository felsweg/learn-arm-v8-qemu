.data

sequence:
    .word 1,2,3,4


.text
.global _start
_start:
    
    mov r0, #1
    ldr r1, =sequence   @ load address of array "sequence" into r1

loop:
    ldr r2, [r1], #4    @ immediate post-indexed address mode. the contents of r1
                        @ gets loaded into r2, after that the address of r1 will be
                        @ update by 4 (bytes).
    mov r0, #2

    # branch unconditionally to label: 'loop'
    b loop
