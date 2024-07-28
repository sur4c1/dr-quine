extern	printf
extern	stdout
extern	fflush

section .text
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

		cmp		byte [rbx],	78
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

section .data
magic:			db	"extern	printfNextern	stdoutNextern	fflushNNsection .textNglobal	_startNNnoop:N	retNN_start:N	mov		rbx,	magicNN	loop_start:N		cmp		byte [rbx],	0N		je		loop_endNN		cmp		byte [rbx], 63N		jne		question_mark_endN			mov		rdi,	fmt_strN			mov		rsi,	magicN			xor		rax, raxN			call	printfN			jmp		end_incrementN		question_mark_end:NN		cmp		byte [rbx],	78N		jne		upper_n_endN			mov		rdi,	fmt_chrN			mov		rsi,	10 ;; newlineN			xor		rax, raxN			call	printfN			jmp		end_incrementN		upper_n_end:NN		cmp		byte [rbx],	39N		jne		single_quote_endN			mov		rdi,	fmt_chrN			mov		rsi,	34 ;;double quotesN			xor		rax, raxN			call	printfN			jmp		end_incrementN		single_quote_end:NN		mov		rdi,	fmt_chrN		xor		rsi,	rsiN		mov		sil,	byte [rbx]N		xor		rax, raxN		call	printfNN		end_increment:N			inc	rbxN			jmp	loop_startN	loop_end:NN	call	noopNN	mov		rdi,	[stdout]N	call	fflushNN	;; exit(0)N	mov		rax, 60N	xor		rdi,	rdiN	syscallNNsection .dataNmagic:			db	'?',	0Nfmt_str:		db	'%s',	0Nfmt_chr:		db	'%c',	0NN",	0
fmt_str:		db	"%s",	0
fmt_chr:		db	"%c",	0

