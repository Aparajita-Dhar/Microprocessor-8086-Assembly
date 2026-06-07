; =====================================================================
; Topic 4: Bitwise Logical Operations and Bit Shifting
; Demonstrates masking bits, clearing registers, and rapid bit multiplication.
; =====================================================================

.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    ; --- Part A: Logic Masking Operations ---
    MOV AL, 0FH         ; Binary: 0000 1111
    MOV BL, 55H         ; Binary: 0101 0101
    
    AND AL, BL          ; Bitwise AND masking (AL becomes 0000 0101)
    
    MOV CL, 0F0H        ; Binary: 1111 0000
    OR  AL, CL          ; Bitwise OR masking  (AL becomes 1111 0101)
    
    XOR BL, BL          ; Efficient trick: XORing a register with itself clears it to 0

    ; --- Part B: Bit Shifting ---
    MOV DL, 03H         ; Binary: 0000 0011 (Decimal 3)
    SHL DL, 1           ; Shift Left by 1 bit (DL becomes 0000 0110 / Decimal 6)
                        ; Note: Shifting left by 1 multiplies the value by 2.

    SHR DL, 1           ; Shift Right by 1 bit (DL steps back to 0000 0011 / Decimal 3)
                        ; Note: Shifting right by 1 divides the value by 2.

    ; Terminate execution
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
