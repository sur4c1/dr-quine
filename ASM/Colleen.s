extern	printf
extern	stdout
extern	fflush

SECTION .text
global	_start

noop:
	ret

_start:
	mov		rbx,	magic

	loop_start:
		cmp		byte [rbx],	0
		je		loop_end

		cmp		byte [rbx], 63
		jne		question_mark_end
			mov		rdi,	fmt_str
			mov		rsi,	magic
			xor		rax, rax
			call	printf
			jmp		end_increment
		question_mark_end:

		cmp		byte [rbx],	82
		jne		upper_n_end
			mov		rdi,	fmt_chr
			mov		rsi,	10 ;; newline
			xor		rax, rax
			call	printf
			jmp		end_increment
		upper_n_end:

		cmp		byte [rbx],	39
		jne		single_quote_end
			mov		rdi,	fmt_chr
			mov		rsi,	34 ;;double quotes
			xor		rax, rax
			call	printf
			jmp		end_increment
		single_quote_end:

		mov		rdi,	fmt_chr
		xor		rsi,	rsi
		mov		sil,	byte [rbx]
		xor		rax, rax
		call	printf

		end_increment:
			inc	rbx
			jmp	loop_start
	loop_end:

	call	noop

	mov		rdi,	[stdout]
	call	fflush

	;; exit(0)
	mov		rax, 60
	xor		rdi,	rdi
	syscall

SECTION .data
magic			db, "?",	0
fmt_str:		db	"%s",	0
fmt_chr:		db	"%c",	0

