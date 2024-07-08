extern __errno_location
global ft_read
section .text
	ft_read:
		mov rax, 0	;setup rax with a zero so the we can call sys_read - https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
		syscall

		;check error
		jc _errno	;jump if carry. An error might have occured and we need to handle it.
		ret
	_errno:
		push rbp	;saves rbp value to the stack
		push rax	;saves rax value to the stack
		call __errno_location WRT ..plt ;returns the location of the errno variable. https://www.nasm.us/xdoc/2.10rc8/html/nasmdoc9.html#section-9.2.5
		pop rcx		;retrieves the value previously on rax from the stack and saves it on rcs
		mov byte [rax], cl	;moves the value from cl(lower 8 bits com rcx) to the address saved on rax
		pop rbp		;restores rbp value that was previously saved on the stack
		mov rax, -1	;moves -1 to rax to indicate that an error occoured
		ret

;Calling procedures outside your shared library has to be done by means of a procedure linkage table, or PLT.
;The PLT is placed at a known offset from where the library is loaded, so the library code can make calls to the PLT in a position-independent way.
;Within the PLT there is code to jump to offsets contained in the GOT, so function calls to other shared libraries or to routines in the main program
;can be transparently passed off to their real destinations.
;To call an external routine, you must use another special PIC relocation type, WRT ..plt.
;This is much easier than the GOT-based ones: you simply replace calls such as CALL printf with the PLT-relative version CALL printf WRT ..plt.