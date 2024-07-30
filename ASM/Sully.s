extern	dprintf, perror, sprintf, __errno_location, system

;; mandatory comment
%define osef1
%define i	5

section	.text
	_start:
		mov		r14,	i
		dec		r14

		xor		rax,	rax
		mov 	rdi,	buffer
		mov		rsi,	fmt_filename
		mov		rdx,	r14
		call	sprintf

		mov		rax,	2
		mov		rdi,	buffer
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

			cmp		byte [rbx], 73
			jne		upper_i_end
				mov		rdi,	r12
				mov		rsi,	fmt_int
				mov		rdx,	r14
				xor		rax, rax
				call	dprintf
				jmp		end_increment
			upper_i_end:

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

		cmp	r14,	0
		jl	endprog

		;; system nasm
		xor		rax,	rax
		mov		rdi,	buffer
		mov		rsi,	fmt_nasm
		mov		rdx,	r14
		mov		rcx,	r14
		call	sprintf

		mov		rdi,	buffer
		call	system

		;; system ld
		xor		rax,	rax
		mov		rdi,	buffer
		mov		rsi,	fmt_ld
		mov		rdx,	r14
		mov		rcx,	r14
		call	sprintf

		mov		rdi,	buffer
		call	system

		;; system rm
		xor		rax,	rax
		mov		rdi,	buffer
		mov		rsi,	fmt_rm
		mov		rdx,	r14
		call	sprintf

		mov		rdi,	buffer
		call	system

		;; system Sully_i
		xor		rax,	rax
		mov		rdi,	buffer
		mov		rsi,	fmt_exec
		mov		rdx,	r14
		call	sprintf

		mov		rdi,	buffer
		call	system


		endprog:
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


section	.data
	magic:			db	"extern	dprintf, perror, sprintf, __errno_location, systemNN;; mandatory commentN%define osef1N%define i	INNsection	.textN	_start:N		mov		r14,	iN		dec		r14NN		xor		rax,	raxN		mov 	rdi,	bufferN		mov		rsi,	fmt_filenameN		mov		rdx,	r14N		call	sprintfNN		mov		rax,	2N		mov		rdi,	bufferN		mov		rsi,	65N		mov		rdx,	438N		syscallN		test	rax,	raxN		js		open_failedN		mov		r12,	raxNN		mov		rbx,	magicNN		loop_start:N			cmp		byte [rbx],	0N			je		loop_endNN			cmp		byte [rbx], 63N			jne		question_mark_endN				mov		rdi,	r12N				mov		rsi,	fmt_strN				mov		rdx,	magicN				xor		rax, raxN				call	dprintfN				jmp		end_incrementN			question_mark_end:NN			cmp		byte [rbx],	78N			jne		upper_n_endN				mov		rdi,	r12N				mov		rsi,	fmt_chrN				mov		rdx,	10N				xor		rax, raxN				call	dprintfN				jmp		end_incrementN			upper_n_end:NN			cmp		byte [rbx],	39N			jne		single_quote_endN				mov		rdi,	r12N				mov		rsi,	fmt_chrN				mov		rdx,	34N				xor		rax, raxN				call	dprintfN				jmp		end_incrementN			single_quote_end:NN			cmp		byte [rbx], 73N			jne		upper_i_endN				mov		rdi,	r12N				mov		rsi,	fmt_intN				mov		rdx,	r14N				xor		rax, raxN				call	dprintfN				jmp		end_incrementN			upper_i_end:NN			mov		rdi,	r12N			mov		rsi,	fmt_chrN			mov		dl,	byte [rbx]N			xor		rax, raxN			call	dprintfNN			end_increment:N				inc	rbxN				jmp	loop_startN		loop_end:NN		mov		rax,	3N		syscallNN		cmp	r14,	0N		jl	endprogNN		;; system nasmN		xor		rax,	raxN		mov		rdi,	bufferN		mov		rsi,	fmt_nasmN		mov		rdx,	r14N		mov		rcx,	r14N		call	sprintfNN		mov		rdi,	bufferN		call	systemNN		;; system ldN		xor		rax,	raxN		mov		rdi,	bufferN		mov		rsi,	fmt_ldN		mov		rdx,	r14N		mov		rcx,	r14N		call	sprintfNN		mov		rdi,	bufferN		call	systemNN		;; system rmN		xor		rax,	raxN		mov		rdi,	bufferN		mov		rsi,	fmt_rmN		mov		rdx,	r14N		call	sprintfNN		mov		rdi,	bufferN		call	systemNN		;; system Sully_iN		xor		rax,	raxN		mov		rdi,	bufferN		mov		rsi,	fmt_execN		mov		rdx,	r14N		call	sprintfNN		mov		rdi,	bufferN		call	systemNNN		endprog:N		mov		rax,	60N		xor		rdi,	rdiN		syscallNN	open_failed:NN		neg		raxN		mov		rbx, raxN		call	__errno_locationN		mov		[rax], rbxNN		mov		rdi, error_msgN		call    perrorNN		mov		rdi,	1N		mov		rax,	60N		syscallNNNsection	.dataN	magic:			db	'?',																									0N	fmt_str:		db	'%s',																									0N	fmt_chr:		db	'%c',																									0N	fmt_int:		db	'%d',																									0N	fmt_filename:	db	'Sully_%d.s',																							0N	fmt_nasm:		db	'nasm -f elf64 Sully_%d.s -o Sully_%d.o',																0N	fmt_ld:			db	'ld -m elf_x86_64 Sully_%d.o -o Sully_%d -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc',	0N	fmt_rm:			db	'rm -f Sully_%d.o',																						0N	fmt_exec:		db	'./Sully_%d',																							0N	error_msg:		db 'Failed to open file',																					0NNsection .bssN	buffer:	resb	100N",																									0
	fmt_str:		db	"%s",																									0
	fmt_chr:		db	"%c",																									0
	fmt_int:		db	"%d",																									0
	fmt_filename:	db	"Sully_%d.s",																							0
	fmt_nasm:		db	"nasm -f elf64 Sully_%d.s -o Sully_%d.o",																0
	fmt_ld:			db	"ld -m elf_x86_64 Sully_%d.o -o Sully_%d -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc",	0
	fmt_rm:			db	"rm -f Sully_%d.o",																						0
	fmt_exec:		db	"./Sully_%d",																							0
	error_msg:		db "Failed to open file",																					0

section .bss
	buffer:	resb	100
