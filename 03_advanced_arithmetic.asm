; =====================================================================
; Topic 3: Unsigned Multiplication and Division Architecture
; Demonstrates handling register dependencies (AX/DX register pairs) 
; required for larger multi-byte multiplication and division.
; =====================================================================

.MODEL SMALL
.STACK 100H
.DATA
    FACTOR_A DB 05H
    FACTOR_B DB 06H
    PROD_OUT DW ?
    
    DIVIDEND DW 0019H   ; Decimal 25 in hexadecimal representation
    DIVISOR  DB 04H
    QUOTIENT DB ?
    REMAINDER DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Unsigned Multiplication (8-bit) ---
    MOV AL, FACTOR_A    ; Multiplicand must always be loaded into AL/AX
    MUL FACTOR_B        ; AX = AL * FACTOR_B (05H * 06H = 1EH / 30 Decimal)
    MOV PROD_OUT, AX    ; Store 16-bit product result

    ; --- Unsigned Division (16-bit by 8-bit) ---
    MOV AX, DIVIDEND    ; Dividend must be pre-loaded into the AX register
    DIV DIVISOR         ; AL = Quotient (6), AH = Remainder (1)
    
    MOV QUOTIENT, AL    ; Save extracted operational results
    MOV REMAINDER, AH

    ; Terminate execution
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
