; CIS-261 Lab exercise M01
; ABC.asm
; Empty program that reserves 3 bytes of memory
; in the data segment.

.386                ; Tells MASM to use Intel 80386 instruction set.
.MODEL FLAT         ; Flat memory model
option casemap:none ; Treat labels as case-sensitive

.CONST          ; Constant data segment
.STACK 100h     ; (default is 1-kilobyte stack)

.DATA           ; Begin initialised data segment
        BYTE  'A'
        BYTE  'B'
        BYTE  'C'

.CODE           ; Begin code segment
_main PROC      ; Main entry point into program
    BYTE 16 DUP (90h) ; char array[16] = { 0x90, 0x90..., 0x90};
    ret
_main ENDP
END _main       ; Marks the end of the module and sets the program entry point label

;volume 2 list of instructions
;http://www.c-jump.com/CIS77/reference/Intel/CIS77_24319102/index.html
;opcode format documentation
;http://www.c-jump.com/CIS77/reference/Intel/CIS77_24319102/pg_0042.htm
;Encoding Real x86 Instructions
;http://c-jump.com/bcc/c261c/CPU/x86/lecture.html
;
;http://www.c-jump.com/CIS77/reference/Intel/CIS77_24319102/pg_0496.htm
;774B1001   74 0C            JE SHORT ntdll.774B100F
;00DA1005 >/$ E9 06000000    JMP M07.00DA1010


