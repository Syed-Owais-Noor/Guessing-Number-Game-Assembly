include Irvine32.inc

.data

	msg byte "				( You have only 3 lifes to guess the number )",0
	mainMsg byte "Enter a number b/w 0 and 10: ",0
	lessMsg byte "Oh! The number is less then your guess",0
	equalMsg byte "WOW! Your guess is correct the number is: ",0
	greaterMsg byte "Oh! The number is greater then your guess",0

	random dword ?
	life dword 0

.code
main proc
	call Randomize

	mov eax, 10

	call RandomRange
	mov random, eax

	call writedec

	call crlf

	mov edx, offset msg
	call writestring

	call crlf
	call crlf

	L1:
		inc life

		mov edx, offset mainMsg
		call writestring

		call readdec
		call crlf

		cmp eax, random
		jl less
		je equal
		jg greater

	Loop L1

	less:
		mov edx, offset greaterMsg
		call writestring

		call crlf
		call crlf
		call crlf

		mov eax, life

		cmp eax, 3
		je quit
		jl L1

	equal:
		mov edx, offset equalMsg
		call writestring

		mov edx, random
		call writedec

		call crlf
		call crlf

		jmp quit

	greater:
		mov edx, offset lessMsg
		call writestring

		call crlf
		call crlf
		call crlf

		mov eax, life

		cmp eax, 3
		je quit
		jl L1

	quit:
		
	
exit
main endp
end main