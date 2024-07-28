extern	dprintf, perror, __errno_location

;; mandatory comment
%define osef1
%define osef2
%macro main 0
	_start:
		mov		rax,	2
		mov		rdi,	child
		mov		rsi,	65
		mov		rdx,	438
		syscall
		test	rax,	rax
		js		open_failed
		mov		r12,	rax

		mov		rbx,	magic

		loop_start:
			cmp		byte [rbx],	0
			je		loop_end


			cmp		byte [rbx], 63
			jne		question_mark_end
				mov		rdi,	r12
				mov		rsi,	fmt_str
				mov		rdx,	magic
				xor		rax, rax
				call	dprintf
				jmp		end_increment
			question_mark_end:

			cmp		byte [rbx],	78
			jne		upper_n_end
				mov		rdi,	r12
				mov		rsi,	fmt_chr
				mov		rdx,	10
				xor		rax, rax
				call	dprintf
				jmp		end_increment
			upper_n_end:

			cmp		byte [rbx],	39
			jne		single_quote_end
				mov		rdi,	r12
				mov		rsi,	fmt_chr
				mov		rdx,	34
				xor		rax, rax
				call	dprintf
				jmp		end_increment
			single_quote_end:

			mov		rdi,	r12
			mov		rsi,	fmt_chr
			mov		dl,	byte [rbx]
			xor		rax, rax
			call	dprintf

			end_increment:
				inc	rbx
				jmp	loop_start
		loop_end:

		mov		rax,	3
		syscall

		mov		rax,	60
		xor		rdi,	rdi
		syscall

	open_failed:
		neg		rax
		mov		rbx, rax
		call	__errno_location
		mov		[rax], rbx

		mov		rdi, error_msg
		call    perror

		mov		rdi,	1
		mov		rax,	60
		syscall
%endmacro

section	.text
main

section	.data
magic:		db	"extern	dprintf, perror, __errno_locationNN;; mandatory commentN%define osef1N%define osef2N%macro main 0N	_start:N		mov		rax,	2N		mov		rdi,	childN		mov		rsi,	65N		mov		rdx,	438N		syscallN		test	rax,	raxN		js		open_failedN		mov		r12,	raxNN		mov		rbx,	magicNN		loop_start:N			cmp		byte [rbx],	0N			je		loop_endNNN			cmp		byte [rbx], 63N			jne		question_mark_endN				mov		rdi,	r12N				mov		rsi,	fmt_strN				mov		rdx,	magicN				xor		rax, raxN				call	dprintfN				jmp		end_incrementN			question_mark_end:NN			cmp		byte [rbx],	78N			jne		upper_n_endN				mov		rdi,	r12N				mov		rsi,	fmt_chrN				mov		rdx,	10N				xor		rax, raxN				call	dprintfN				jmp		end_incrementN			upper_n_end:NN			cmp		byte [rbx],	39N			jne		single_quote_endN				mov		rdi,	r12N				mov		rsi,	fmt_chrN				mov		rdx,	34N				xor		rax, raxN				call	dprintfN				jmp		end_incrementN			single_quote_end:NN			mov		rdi,	r12N			mov		rsi,	fmt_chrN			mov		dl,	byte [rbx]N			xor		rax, raxN			call	dprintfNN			end_increment:N				inc	rbxN				jmp	loop_startN		loop_end:NN		mov		rax,	3N		syscallNN		mov		rax,	60N		xor		rdi,	rdiN		syscallNN	open_failed:N		neg		raxN		mov		rbx, raxN		call	__errno_locationN		mov		[rax], rbxNN		mov		rdi, error_msgN		call    perrorNN		mov		rdi,	1N		mov		rax,	60N		syscallN%endmacroNNsection	.textNmainNNsection	.dataNmagic:		db	'?',			0Nfmt_str:	db	'%s',			0Nfmt_chr:	db	'%c',			0Nchild:		db	'Grace_kid.s',	0Nerror_msg:  db 'Failed to open file', 0N",			0
fmt_str:	db	"%s",			0
fmt_chr:	db	"%c",			0
child:		db	"Grace_kid.s",	0
error_msg:  db "Failed to open file", 0
