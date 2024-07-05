section .text
	global ft_strcpy
ft_strcpy:
	xor rax, rax                    ;zeros rax register. It will act as the interator of the loop
	loop:
		mov cl, byte [rsi + rax]    ;cl is the lower 8 bits of the rcx register while rsi holds the pointer to the second parameter. ie: src*
		mov byte [rdi + rax], cl    ;rdi hold the pointer to the first parameter. ie: dst*
		cmp cl, 0                   ;checks if the end of the string was reached. That is, if we reached the null character
		je	end_loop                ;case null terminating character was found, jump to end_loop
		inc rax                     ;increases rax interator. ie: i++
		jmp loop
	end_loop:
		mov rax, rdi                ;copies the pointer to the destination address to the rax pointer. rax, by convention, holds the return parameter from functions
		ret