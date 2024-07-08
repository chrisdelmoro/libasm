extern malloc
extern __errno_location
extern ft_strlen
extern ft_strcpy
global ft_strdup

section .text
	ft_strdup:
		push rbp				;puches rbp value to the stack. frame pointer
		push rdi				;pushes rdi value to the stack. pointer to the string passed to the funcion as the first parameter				
		call ft_strlen			;call strlen to find the len of the str in order to allocate memory por it.
		mov rdi, rax			;moves the value of rax(the return of strlen) to rdi(first parameter to malloc)
		call malloc wrt ..plt	;calls malloc and passes the return of strlen as first parameter on rdi
		jc err_hand				;jumps conditionaly to err_hand if carry flag is set
		mov rdi, rax			;moves the pointer returned by malloc to rdi
		pop rsi					;retrieves the pointer to the original string and passes it to rsi
		call ft_strcpy			;calls strcpy passing the dst pointer returned by malloc and stored in rdi. Also passes the original string as second param throgh rsi
		pop rbp					;retrieves stack frame pointer. Good practice
		ret
	err_hand:
		push rax				;saves rax value to the stack
		call __errno_location wrt ..plt	;get address of errno
		pop rdi					;retrieves the error code from the stack that was previously on rax
		mov [rax], rdi			;stores the error code on the address pointed by rax. thais is errno
		mov rax, 0				;stores zero on rax, só that the return value points that an error has occoured
		pop rbp					;retrieves stack frame pointer. Good practice
		ret
