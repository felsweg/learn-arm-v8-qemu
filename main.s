
.text
.global _start
_start:
    # destination, source, op1, 
    mov X0, #1
    mov X1, #4
    eor X2, X2, X2
    sub X1, X1, #1

    # loop
    b _start
