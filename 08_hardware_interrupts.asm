; =====================================================================
; Topic 8: System I/O Management via Hardware Interrupts
; Demonstrates interacting with keyboard interfaces and terminal consoles via INT 21H.
; =====================================================================

.MODEL SMALL
.STACK 100H
.DATA
    PROMPT_MSG DB '8086 Pipeline Active: Enter single character: $'
    REPLY_MSG  DB 0DH, 0AH, 'Character Echo Output: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- 1. Output String Matrix to Terminal (Service Code AH = 09H) ---
    MOV DX, OFFSET PROMPT_MSG ; DX must hold string memory starting address location
    MOV AH, 09H               ; Trigger string write service vector
    INT 21H                   ; Invoke DOS core interrupt handler

    ; --- 2. Read Single Character Input from Keyboard (Service Code AH = 01H) ---
    MOV AH, 01H               ; Trigger input read service vector
    INT 21H                   ; System execution stops until input received. Value stored in AL.
    MOV BL, AL                ; Backup captured input character to BL register safely

    ; --- 3. Output String Matrix for Reply Message ---
    MOV DX, OFFSET REPLY_MSG
    MOV AH, 09H
    INT 21H

    ; --- 4. Echo Back Single Input Character to Screen (Service Code AH = 02H) ---
    MOV DL, BL                ; Target parameter character must be loaded into DL register
    MOV AH, 02H               ; Trigger single char write service vector
    INT 21H                   ; Print character onto monitor

    ; Terminate execution cleanly
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
