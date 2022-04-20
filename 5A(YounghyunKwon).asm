TITLE Displaying a single character (5A(YounghyunKwon).asm)
;display a single character at 100 random screen locations

; Younghyun Kwon
INCLUDE Irvine32.inc

.DATA
		rows WORD ?
		cols WORD ?
		str1 BYTE "Enter The character: ",0
		char BYTE ?

.CODE
main	PROC
		mov edx, OFFSET str1
		call writeString
		call ReadChar			;read a user input
		mov char, al			;save the user input into char

		call Clrscr
        mov ecx, 100
        L1:
            call GetMaxXY		;return a size of console window buffer
            mov rows, ax
            mov cols, dx

            movzx eax, rows
            call RandomRange	;generate a random integer for a row
            mov dh, al

            movzx eax, cols
            call RandomRange	;generate a random integer for a colume
            mov dl, al

            call Gotoxy			;locate a current cursor

            mov al,char
            call WriteChar		;display the user charactor

            mov eax,100
            call Delay			;delay the program for 100 milliseconds

        Loop L1					;iterate 100 times

        call WaitMsg

		exit
main	ENDP
		END		main
