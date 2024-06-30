section .text
	global ft_strlen

ft_strlen:
	xor	rax, rax ; bitwise xor operation to zero the rax register
	loop:
		cmp	byte [rdi + rax], 0 ; compares each byte with 0. rdi is the reference pointer to the string, rax the counter which increments to check every character
		je	end_loop            ; if the above comparison is true, jump to end_loop label
		inc	rax                 ; increases the rax register which is acting as the loop counter
		jmp	loop                ; restart the loop
	end_loop:
		ret