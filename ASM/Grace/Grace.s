global main

; Comment "outside"
section .text

%macro noop 0
%endmacro
%macro chr 1
		pop rax
		push %1
		mov rsi, rsp
		mov rdx, 1
		jmp write_call
%endmacro
%macro entry 0
main:
	; Comment "inside"
	mov rdi, child
	mov rsi, 01102o
	mov rdx, 0644o
	mov rax, 2
	syscall
	test rax, rax
	js end_pgr
	mov rdi, rax

	mov r12, magic
	push 0

	loop:
		mov al, byte [r12]
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

		cmp al, 0x53
		jne end_sq
		chr 0x3b
		end_sq:

		mov rsi, r12
		mov rdx, 1

		write_call:
		mov rax, 1
		syscall

		inc r12
		jmp loop
	end_loop:
	pop rax
	xor rax, rax
	end_pgr:
	ret
%endmacro

entry

section .data
magic: db "global mainNN; Comment 'outside'Nsection .textNN%macro noop 0N%endmacroN%macro chr 1NTTpop raxNTTpush %1NTTmov rsi, rspNTTmov rdx, 1NTTjmp write_callN%endmacroN%macro entry 0Nmain:NT; Comment 'inside'NTmov rdi, childNTmov rsi, 01102oNTmov rdx, 0644oNTmov rax, 2NTsyscallNTtest rax, raxNTjs end_pgrNTmov rdi, raxNNTmov r12, magicNTpush 0NNTloop:NTTmov al, byte [r12]NTTtest al, alNTTjz end_loopNNTTcmp al, 0x3fNTTjne end_qmNTTmov rsi, magicNTTmov rdx, lenNTTjmp write_callNTTend_qm:NNTTcmp al, 0x27NTTjne end_quoteNTTchr 0x22NTTend_quote:NNTTcmp al, 0x4eNTTjne end_nlNTTchr 0x0aNTTend_nl:NNTTcmp al, 0x54NTTjne end_tabNTTchr 0x09NTTend_tab:NNTTcmp al, 0x53NTTjne end_sqNTTchr 0x3bNTTend_sq:NNTTmov rsi, r12NTTmov rdx, 1NNTTwrite_call:NTTmov rax, 1NTTsyscallNNTTinc r12NTTjmp loopNTend_loop:NTpop raxNTxor rax, raxNTend_pgr:NTretN%endmacroNNentryNNsection .dataNmagic: db '?', 0Nlen: equ $ - magic - 1Nchild: db 'Grace_kid.s', 0N", 0
len: equ $ - magic - 1
child: db "Grace_kid.s", 0
