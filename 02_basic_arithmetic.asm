; =====================================================================
; Topic 2: 8-Bit and 16-Bit Arithmetic Operations
; Demonstrates basic mathematical execution loops and flag mutations.
; =====================================================================

.MODEL SMALL
.STACK 100H
.DATA
    NUM1 DW 1234H       ; Define a 16-bit (Word) variable
    NUM2 DW 4321H       ; Define another 16-bit variable
    SUM  DW ?           ; Allocate space for the 16-bit result

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Part A: 8-Bit Arithmetic ---
    MOV AL, 20H
    MOV BL, 30H
    ADD AL, BL          ; AL = AL + BL (Result: 50H)

    MOV CL, 10H
    SUB AL, CL          ; AL = AL - CL (Result: 40H)

    ; --- Part B: 16-Bit Arithmetic ---
    MOV AX, NUM1        ; Load 16-bit value into Accumulator (AX)
    ADD AX, NUM2        ; Add 16-bit value from NUM2 to AX
    MOV SUM, AX         ; Store the final combined 16-bit sum in memory

    ; Terminate execution
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
