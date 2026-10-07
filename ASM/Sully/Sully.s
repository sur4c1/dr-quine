global main

extern system

section .text

%macro chr 1
		pop rax
		push %1
		mov rsi, rsp
		mov rdx, 1
		jmp write_call
%endmacro
main:
	push rbp
	mov r12b, 5
	add r12b, 0x30

	cmp byte [file + file_len - 3], 0x79
	je end_if
	dec r12b
	end_if:

	mov byte [child + 6], r12b
	mov byte [ctarget + 8], r12b
	mov byte [command + 20], r12b
	mov byte [command + 33], r12b
	mov byte [command + 48], r12b
	mov byte [command + 61], r12b
	mov byte [command + 78], r12b

	mov rdi, child
	mov rsi, 01102o
	mov rdx, 0644o
	mov rax, 2
	syscall
	test rax, rax
	js end_pgr
	mov rdi, rax

	mov  r13, magic
	push 0

	loop:
		mov al, byte [r13]
		test al, al
		jz end_loop

		cmp al, 0x3f
		jne end_qm
		mov rsi, magic
		mov rdx, len
		jmp write_call
		end_qm:

		cmp al, 0x27
		jne end_quote
		chr 0x22
		end_quote:

		cmp al, 0x4e
		jne end_nl
		chr 0x0a
		end_nl:

		cmp al, 0x54
		jne end_tab
		chr 0x09
		end_tab:

		cmp al, 0x59
		jne end_x
		mov rsi, x_str
		mov rdx, x_len
		mov rax, 1
		syscall
		chr r12
		end_x:

		mov rsi, r13
		mov rdx, 1

		write_call:
		mov rax, 1
		syscall

		inc r13
		jmp loop
	end_loop:
	pop rax
	mov rax, 3
	syscall

	cmp r12b, 0x30
	jl alldone
	mov rdi, command
	call system
	cmp r12b, 0x30
	jle alldone
	mov rdi, ctarget
	call system

	alldone:
	xor rax, rax
	end_pgr:
	pop rbp
	ret

section .data
magic: db "global mainNNextern systemNNsection .textNN%macro chr 1NTTpop raxNTTpush %1NTTmov rsi, rspNTTmov rdx, 1NTTjmp write_callN%endmacroNmain:NTpush rbpNTYNTadd r12b, 0x30NNTcmp byte [file + file_len - 3], 0x79NTje end_ifNTdec r12bNTend_if:NNTmov byte [child + 6], r12bNTmov byte [ctarget + 8], r12bNTmov byte [command + 20], r12bNTmov byte [command + 33], r12bNTmov byte [command + 48], r12bNTmov byte [command + 61], r12bNTmov byte [command + 78], r12bNNTmov rdi, childNTmov rsi, 01102oNTmov rdx, 0644oNTmov rax, 2NTsyscallNTtest rax, raxNTjs end_pgrNTmov rdi, raxNNTmov  r13, magicNTpush 0NNTloop:NTTmov al, byte [r13]NTTtest al, alNTTjz end_loopNNTTcmp al, 0x3fNTTjne end_qmNTTmov rsi, magicNTTmov rdx, lenNTTjmp write_callNTTend_qm:NNTTcmp al, 0x27NTTjne end_quoteNTTchr 0x22NTTend_quote:NNTTcmp al, 0x4eNTTjne end_nlNTTchr 0x0aNTTend_nl:NNTTcmp al, 0x54NTTjne end_tabNTTchr 0x09NTTend_tab:NNTTcmp al, 0x59NTTjne end_xNTTmov rsi, x_strNTTmov rdx, x_lenNTTmov rax, 1NTTsyscallNTTchr r12NTTend_x:NNTTmov rsi, r13NTTmov rdx, 1NNTTwrite_call:NTTmov rax, 1NTTsyscallNNTTinc r13NTTjmp loopNTend_loop:NTpop raxNTmov rax, 3NTsyscallNNTcmp r12b, 0x30NTjl alldoneNTmov rdi, commandNTcall systemNTcmp r12b, 0x30NTjle alldoneNTmov rdi, ctargetNTcall systemNNTalldone:NTxor rax, raxNTend_pgr:NTpop rbpNTretNNsection .dataNmagic: db '?', 0Nlen: equ $ - magic - 1Nchild: db 'Sully_X.s', 0Nctarget: db './Sully_X', 0Ncommand: db 'nasm -f elf64 Sully_X.s -o Sully_X.o ', 0x3b , ' cc Sully_X.o -o Sully_X ', 0x3b,' rm -rf Sully_X.o', 0Nfile: db __FILE__, 0Nfile_len: equ $ - file - 1Nx_str: db 'mov r12b, ', 0Nx_len: equ $ - x_str - 1N", 0
len: equ $ - magic - 1
child: db "Sully_X.s", 0
ctarget: db "./Sully_X", 0
command: db "nasm -f elf64 Sully_X.s -o Sully_X.o ", 0x3b , " cc Sully_X.o -o Sully_X ", 0x3b," rm -rf Sully_X.o", 0
file: db __FILE__, 0
file_len: equ $ - file - 1
x_str: db "mov r12b, ", 0
x_len: equ $ - x_str - 1
