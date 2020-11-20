global _start
section .text

_start:
	call _clear
	mov rax, 1 		; system call for write
	mov rdi, 1 		; file handle 1 is stdout
	mov rsi, message 	; address of string to output
	mov rdx, 13		; number of bytes
	syscall			; invoke operating system to do the write
	mov rax, 60		; system call for exit
	xor rdi, rdi		; exit code 0
	syscall			; invoke os to exit

_clear:
	mov rax, 1		; print
	mov rdi, 1 		; to stdout
	mov rsi, clearTerm	; esc all chars in terminal
	mov rdx, clearTermLen
	syscall
	ret

section .data
message: 	db "Hello, World", 10	; note the lf at the end
clearTerm:	db 27,"[H",27,"[2J"
clearTermLen:	equ $-clearTerm
