; =====================================================================
; Topic 7: Procedures (Subroutines) & LIFO Stack Memory Management
; Demonstrates calling external functions and isolating register states safely.
; =====================================================================

.MODEL SMALL
.STACK 100H
.DATA
    VAL_ALPHA DW 1111H
    VAL_BETA  DW 2222H

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, VAL_ALPHA   ; AX = 1111H
    MOV BX, VAL_BETA    ; BX = 2222H

    ; --- Hardware Stack Memory Preservation ---
    PUSH AX             ; Save original AX register state to hardware stack (LIFO top)
    PUSH BX             ; Save original BX register state to hardware stack

    ; Mutate registers to show stack recovery mechanics
    MOV AX, 9999H
    MOV BX, 8888H

    ; Call independent function routine block
    CALL SWAP_ROUTINE

    ; Recover register records cleanly out of stack allocations
    POP BX              ; Restores BX back to its original value (2222H)
    POP AX              ; Restores AX back to its original value (1111H)

    ; Terminate execution
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; --- Custom Modular Subroutine ---
SWAP_ROUTINE PROC
    ; Basic arithmetic placeholder simulation inside isolated code function execution segment
    ADD AX, BX
    RET                 ; Return execution track back to original main procedure call point
SWAP_ROUTINE ENDP

END MAIN
