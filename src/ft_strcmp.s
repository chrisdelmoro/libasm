section .text
	global ft_strcmp
ft_strcmp:
	xor	rax, rax                ;zeros the rax register. It will act as the loop iterator
	loop:
		mov	cl, [rdi + rax]     ;cl are the lower 8 bits of the rcx register while rdi holds the pointer to the first parameter. ie: s1*
		mov	ch, [rsi + rax]     ;ch are the higher 8 bits of the rcx register while rsi holds the pointer to the second parameter. ie: s2*
		cmp	cl, 0               ;compares cl to zero
		jz	end_loop            ;conditional jump if previous comparison resulted in a zero
		cmp	ch, 0               ;compares ch to zero
		jz	end_loop            ;conditional jump if previous comparison resulted in a zero
		cmp	cl, ch              ;compare cl to ch
		jne	end_loop            ;conditional jump if previous comparion resulted in cl and ch being DIFFERENT. jne = jump not equal
		inc rax                 ;increments the iterator
		jmp loop
	end_loop:
		xor rax, rax            ;zeros the rax register. It will holds the return parameter as by convention
		sub cl, ch              ;subtracts ch from cl and stores the result in cl
		movsx eax, cl           ;mov cl value to eax while extending it to 32 bits. eax are the lower 32 bits of the rax register. movsx stands for move with sign extension.
		ret
		