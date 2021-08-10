; void Basic_BORDER (unsigned char color)

psect text
global _Basic_BORDER
_Basic_BORDER:

            POP  HL
            POP  BC
            PUSH BC
            LD   A,C
            CALL 229BH
            JP   (HL)

; Basic_BORDER

;/*-------------------------------- Cut here ---------------------------------*/

; void Basic_COLOR (unsigned char atr)

psect text
global _Basic_COLOR
_Basic_COLOR:

ATTR_P$     EQU  5C8DH
ATTR_T$     EQU  5C8FH

            POP  HL
            POP  BC
            PUSH BC
            LD   A,C
            LD   (ATTR_P$), A
            LD   (ATTR_T$), A
            JP   (HL)
            
; Basic_COLOR

;/*-------------------------------- Cut here ---------------------------------*/

; void Basic_PRSTR_C_ROM_stdcall (unsigned char *str)

psect text
global _Basic_PRSTR_C_ROM_stdcall
_Basic_PRSTR_C_ROM_stdcall:

            LD   IY, 5C3AH
            POP  HL
            POP  BC
            PUSH BC
            PUSH HL
PRSTRstd$:  LD   A, (BC)
            OR   A
            RET  Z
            RST  16
            INC  BC
            JR   PRSTRstd$

; Basic_PRSTR_C_ROM_stdcall
