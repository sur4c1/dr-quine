extern	dprintf, perror, sprintf, __errno_location, system

;; mandatory comment
%define osef1
%define i	5
%macro main 0
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
		jl	end

		;; system nasm
		;; system ld
		;; system rm
		;; system Sully_i

		end:
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
	magic:			db	"?",																									0
	fmt_str:		db	"%s",																									0
	fmt_chr:		db	"%c",																									0
	fmt_int:		db	"%d"																									0
	fmt_filename:	db	"Sully_%d.s",																							0
	fmt_asm:		db	"nasm -f elf64 Sully_%d.s -o Sully_%d.o"																0
	fmt_ld:			db	"ld -m elf_x86_64 Sully_%d.o -o Sully_%d -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc",	0
	fmt_rm:			db	"rm -f Sully_%d.o",																						0
	fmt_exec:		db	"./Sully_%d",																							0
	error_msg:		db "Failed to open file",																					0

section .bss
	buffer:	resb	100
