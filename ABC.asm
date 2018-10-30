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

						   imm8 = 'X'
00DC1010     C6 05 0040DC00 58      >MOV BYTE PTR DS:[DC4000],58
			  |  |				      Mod  Reg  R/M
			  |  |_Mod R/M byte:      00   000  101  == 32-Bit Displacement-Only Mode
			  |_opcode

00DC1017     C605 0140DC00 59 >MOV BYTE PTR DS:[DC4001],59
00DC101E  |. 90               NOP
00DC101F  |. 90               NOP
;00DC1020  \. C3               RETN

C6 /0 MOV r/m8, imm8 Move imm8 to r/m8

INSTRUCTION SET REFERENCE MANUAL

010F1010     BF 00400F01    MOV EDI,M07.010F4000                     ;  ASCII "ABC"
			 Opcode = B8
			  + rd = register code(7), from 0 through 7 = EDI
 				MOV r32, imm32

010F1015     B0 58          MOV AL,58
			 Opcode = B0 
						+ rb register code(0), from 0 through 7 = AL
						MOV r8, imm8

010F1017     8807           MOV BYTE PTR DS:[EDI],AL
		     Opcode = 88 /r = Indicaes Mod R/M byte contains both reg and reg / mem
											Mod Reg R/M
							Mod R/M  = 07h = 00 000 111
											 	AL	[edi]
							MOV r/m8, r8

010F1019     47             INC EDI
			 opcode = 40
					+ rd = 7 = register code 0 through 7 = EDI
						   INC r32 Increment doublword register

010F101A     FEC0           INC AL
			 opcode = FE 
					  /0 = Mod R/M byte of the instruction uses only the r/m(register or memory) operand
							 Mod Reg R/M
						     0C0h = 11 000 000 = AL
							 INC r/m8

010F101C     3C 5A          CMP AL,5A
			 opcode = 3C ib
							CMP AL, imm8 = 5a ('X')

010F101E    ^7E F7          JLE SHORT M07.010F1017
			
010F1020	 C3			    RETN






