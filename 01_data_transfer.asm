; =====================================================================
; Topic 1: Basic Data Transfer Operations & Addressing Modes
; Demonstrates moving immediate values, register-to-register copies, 
; and direct memory pointer routing.
; =====================================================================

.MODEL SMALL
.STACK 100H
.DATA
    ; Allocating a single byte variable in memory
    MEM_VAR DB 25H 

.CODE
MAIN PROC
    ; Initialize the Data Segment (Crucial structure for 8086 memory)
    MOV AX, @DATA
    MOV DS, AX

    ; 1. Immediate Addressing Mode (Loading values directly into registers)
    MOV AL, 50H         ; Load hexadecimal 50 into 8-bit Accumulator Low (AL)
    MOV BL, 10H         ; Load hexadecimal 10 into 8-bit Base Low (BL)

    ; 2. Register Addressing Mode (Copying data between CPU registers)
    MOV CL, AL          ; Copy contents of AL into Count Low (CL register)

    ; 3. Direct Memory Addressing Mode
    MOV DL, MEM_VAR     ; Read data byte directly out of the memory address label

    ; 4. Register Indirect Addressing Mode using a pointer register
    MOV SI, OFFSET MEM_VAR ; Load the 16-bit memory offset address into Source Index
    MOV AH, [SI]        ; Read the contents at the address pointed to by SI into AH

    ; Exit program cleanly back to the operating system
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
