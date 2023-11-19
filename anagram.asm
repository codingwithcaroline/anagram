; Caroline Kirkconnell
; Date: 3/19/2021
; Project 4
; Description: This program determines if two
; strings are anagrams. If the two strings are
; anagrams, then EAX will have the value 1
; after the code has completed. If they are not
; anagrams, then EAX will have the value 0.
; Resources: I used programming.haven.home.blog
; to learn about assembly in Visual Studio.
; I used Wikipedia to learn about MASM and arrays.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	s1 byte "DANGER"
	s2 byte "GARDEN"
	c1 byte 26 dup(0)
	c2 byte 26 dup(0)

.code
	main proc
		mov eax, 0
		mov eax, 1
		mov ebx, 0
		mov ecx, 0
		mov ecx, sizeof s1
		CounterLoop:                           ; iterates length of s1
			movzx edi, s1[ecx - 1]             ; moves letter from s1 into edi
			inc c1[edi - 65]                   ; letter in ASCII terms
			movzx edi, s2[ecx - 1]             ; moves letter from s2 into edi
			inc c2[edi - 65]                   ; letter in ASCII terms
		loop CounterLoop

		mov ecx, sizeof c1

		VerifyLoop:                            ; checks that c1 and c2 are equal
			mov bl, c1[ecx - 1]                ; moves c1 into bl
			cmp bl, c2[ecx - 1]                ; compares bl and c2
			JNE NoAna                          ; if bl and c2 aren't equal, jump to NoAna
		loop VerifyLoop

		mov eax, 1                             ; sets eax to 1, only reaches if NoAna is not met

		NoAna:                                 ; met if two letter values are unequal in c1 and c2
			invoke ExitProcess, 0

	main endp
end main