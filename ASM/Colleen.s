extern	printf

SECTION .text
global	main

main:
	push	hello
	call	printf
	add		rsp, 8
	ret

SECTION .data
hello: db "Hello, world!", 10, 0 ;; 10 is newline, 0 is \0
