; =====================================================================
; Topic 6: Array Processing & Block Data Traversal
; Demonstrates using pointer indices to scan and aggregate sequential memory fields.
; =====================================================================

.MODEL SMALL
.STACK 100H
.DATA
    DATA_ARRAY DB 10H, 20H, 30H, 40H, 50H ; A continuous sequence of 5 bytes
    ARRAY_SUM  DW 0000H

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 05H         ; Set tracking loop size limit to match array size
    MOV SI, OFFSET DATA_ARRAY ; Load source base index pointer address
    MOV AX, 0000H       ; Reset data collector register

ARRAY_SCAN:
    MOV BL, [SI]        ; Indirectly load the byte value at pointer SI into BL
    MOV BH, 00H         ; Clear high byte to allow clean 16-bit extension calculation
    ADD AX, BX          ; Accumulate the value into AX
    
    INC SI              ; Increment Source Index pointer by 1 to target the next byte
    LOOP ARRAY_SCAN     ; Decrement CX and iterate loop if data bounds remain open

    MOV ARRAY_SUM, AX   ; Store final aggregated structural array tally

    ; Terminate execution
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
