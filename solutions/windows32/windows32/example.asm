; Explain what this program does
; Author:  Your name
; Date:    put the date

.586
.MODEL FLAT

INCLUDE io.h                                                                    ; header file for input/output

.STACK 4096

.DATA
lengthRec               DWORD   ?                                               ; variable to store number length   
widthRec                DWORD   ?                                               ; variable to store number width    
prompt1                 BYTE    "Enter the length of the rectangle", 0          ; prompt for length
prompt2                 BYTE    "Enter the width of the rectangle", 0           ; prompt for width
string                  BYTE    40 DUP (?)                                      ; buffer to store ASCII values
perimeterLbl            BYTE    "The perimeter is", 0                           ; label for the result display
perimeter               DWORD    11 DUP (?), 0                                  ; result in ASCII

.CODE
_MainProc PROC
        input   prompt1, string, 40                                             ; read ASCII characters from prompt1
        atod    string                                                          ; convert to integer
        mov     lengthRec, eax                                                  ; store length in register

        input   prompt2, string, 40                                             ; read ASCII characters from prompt2
        atod    string                                                          ; convert to integer
        mov     widthRec, eax                                                   ; store width in register

        mov     eax, lengthRec                                                  ; result =  length
        add     eax, eax                                                        ; result =  2*length
        mov     ebx, widthRec                                                   ; temp   =  (2*length)
        add     ebx, ebx                                                        ; result =  2*z
        add     eax, ebx                                                        ; result =  (2*length + 2*width)
        mov     perimeter, eax                                                  ; move result from eax to perimeter

        dtoa    perimeter, eax                                                  ; convert result to ASCII
        output  perimeterLbl, perimeter                                         ; output label and result

        mov     eax, 0                                                          ; exit with return code 0
        ret

_MainProc ENDP
END                                                                             ; end of source code

