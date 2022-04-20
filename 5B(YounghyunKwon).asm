TITLE Displaying a single character (5B(YounghyunKwon).asm)
;display a single character at in all possible combinations of foreground and background colors

; Younghyun Kwon
INCLUDE Irvine32.inc

.DATA

	str1 BYTE "Enter The character: ",0
	char BYTE ?

.CODE
main	PROC

	mov edx, OFFSET str1
	call writeString
	call ReadChar			;read a user input
	mov char, al			;save the user input into char
	call Clrscr

    mov eax, 0
    mov ecx, 16
    L1:

        push ecx					;push the count for loop 1
		push eax					;push the value for background
        mov ecx, 16					;move a new count for loop2 to ecx
        L2:
			push eax				;push the value for foreground
            call SetTextColor		;change the color

            mov al,char
            call WriteChar			;display the charactor
			pop eax					;pop the stack for foreground
            inc eax					;increase eax
        LOOP L2

		call crlf					;next line
		pop eax						;pop the stack for background and move to eax
		add eax, 16					;add 16
        pop ecx						;pop the stack for loop1 iteration and move to ecx
    LOOP L1
	mov eax, white + (black * 16)	;set the text color back to default
	call SetTextColor
    call WaitMsg

		exit
main	ENDP
		END		main
