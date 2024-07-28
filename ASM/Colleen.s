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
magic:			db	"extern	printfRextern	stdoutRextern	fflushRRSECTION .textRglobal	_startRRnoop:R	retRR_start:R	mov		rbx,	magicRR	loop_start:R		cmp		byte [rbx],	0R		je		loop_endRR		cmp		byte [rbx], 63R		jne		question_mark_endR			mov		rdi,	fmt_strR			mov		rsi,	magicR			xor		rax, raxR			call	printfR			jmp		end_incrementR		question_mark_end:RR		cmp		byte [rbx],	82R		jne		upper_n_endR			mov		rdi,	fmt_chrR			mov		rsi,	10 ;; newlineR			xor		rax, raxR			call	printfR			jmp		end_incrementR		upper_n_end:RR		cmp		byte [rbx],	39R		jne		single_quote_endR			mov		rdi,	fmt_chrR			mov		rsi,	34 ;;double quotesR			xor		rax, raxR			call	printfR			jmp		end_incrementR		single_quote_end:RR		mov		rdi,	fmt_chrR		xor		rsi,	rsiR		mov		sil,	byte [rbx]R		xor		rax, raxR		call	printfRR		end_increment:R			inc	rbxR			jmp	loop_startR	loop_end:RR	call	noopRR	mov		rdi,	[stdout]R	call	fflushRR	;; exit(0)R	mov		rax, 60R	xor		rdi,	rdiR	syscallRRSECTION .dataRmagic:			db	'?',	0Rfmt_str:		db	'%s',	0Rfmt_chr:		db	'%c',	0RR",	0
fmt_str:		db	"%s",	0
fmt_chr:		db	"%c",	0

