global _start
section .text

_start:
	mov rdi, 1 		; file handle 1 is stdout
	call _clear
	mov rax, 1 		; system call for write
	mov rsi, message 	; address of string to output
	mov rdx, 13		; number of bytes
	syscall			; invoke operating system to do the write
	mov rax, 60		; system call for exit
	xor rdi, rdi		; exit code 0
	syscall			; invoke os to exit

_clear: ; run \033[H\033[2J tror jeg?
	mov rax, 1
	mov rsi, clearTerm
	mov rdx, clearTermLen
	syscall
	ret

section .data
message: 	db "Hello, World", 10	; note the lf at the end
clearTerm:	db 27,"[H",27,"[2J"
clearTermLen:	equ $-clearTerm
