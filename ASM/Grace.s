extern	dprintf

%macro main 0
	_start:
		mov		rbx,	magic

	loop_start:
			cmp		byte [rbx],	0
			je		loop_end

			mov		rax,	2
			mov		rdi,	child
			mov		rsi,	0110
			mov		rdx,	0666

			cmp		rax, 0
			jge		end_exit_error
				mov		rax,	80
				mov		rdi,	1
				syscall
			end_exit_error:

			mov		rdi,	rax

			cmp		byte [rbx], 63
			jne		question_mark_end
				mov		rsi,	fmt_str
				mov		rdx,	magic
				xor		rax, rax
				call	dprintf
				jmp		end_increment
			question_mark_end:

			cmp		byte [rbx],	82
			jne		upper_n_end
				mov		rsi,	fmt_chr
				mov		rdx,	10
				xor		rax, rax
				call	dprintf
				jmp		end_increment
			upper_n_end:

			cmp		byte [rbx],	39
			jne		single_quote_end
				mov		rsi,	fmt_chr
				mov		rdx,	34
				xor		rax, rax
				call	dprintf
				jmp		end_increment
			single_quote_end:

			mov		rsi,	fmt_chr
			mov		dl,	byte [rbx]
			xor		rax, rax
			call	dprintf

			end_increment:
				inc	rbx
				jmp	loop_start
		loop_end:

		;; close(fd)
		mov		rax,	3
		syscall
		;; exit(0)
		mov		rax,	60
		xor		rdi,	rdi
		syscall
%endmacro

SECTION	.text
main

SECTION	.data
magic:		db	"tst",			0
fmt_str:	db	"%s",			0
fmt_chr:	db	"%c",			0
child:		db	"Grace_kid.s",	0
