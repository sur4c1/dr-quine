global main

; Comment "outside"
section .text
noop:
	ret

main:
	; Comment "inside"
	call noop
	mov r12, magic
	push 0
	loop:
		mov al, byte [r12]
		test al, al
		jz end_loop

		mov rdi, 1

		cmp al, 0x3f
		jne end_qm
		mov rsi, magic
		mov rdx, len
		jmp write_call
		end_qm:

		cmp al, 0x27
		jne end_quote
		pop rax
		push 0x22
		mov rsi, rsp
		mov rdx, 1
		jmp write_call
		end_quote:

		cmp al, 0x4e
		jne end_nl
		pop rax
		push 0x0a
		mov rsi, rsp
		mov rdx, 1
		jmp write_call
		end_nl:

		cmp al, 0x54
		jne end_tab
		pop rax
		push 0x09
		mov rsi, rsp
		mov rdx, 1
		jmp write_call
		end_tab:

		cmp al, 0x53
		jne end_sq
		pop rax
		push 0x3b
		mov rsi, rsp
		mov rdx, 1
		jmp write_call
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
	ret
section .data
magic: db "global mainNNS Comment 'outside'Nsection .textNnoop:NTretNNmain:NTS Comment 'inside'NTcall noopNTmov r12, magicNTpush 0NTloop:NTTmov al, byte [r12]NTTtest al, alNTTjz end_loopNNTTmov rdi, 1NNTTcmp al, 0x3fNTTjne end_qmNTTmov rsi, magicNTTmov rdx, lenNTTjmp write_callNTTend_qm:NNTTcmp al, 0x27NTTjne end_quoteNTTpop raxNTTpush 0x22NTTmov rsi, rspNTTmov rdx, 1NTTjmp write_callNTTend_quote:NNTTcmp al, 0x4eNTTjne end_nlNTTpop raxNTTpush 0x0aNTTmov rsi, rspNTTmov rdx, 1NTTjmp write_callNTTend_nl:NNTTcmp al, 0x54NTTjne end_tabNTTpop raxNTTpush 0x09NTTmov rsi, rspNTTmov rdx, 1NTTjmp write_callNTTend_tab:NNTTcmp al, 0x53NTTjne end_sqNTTpop raxNTTpush 0x3bNTTmov rsi, rspNTTmov rdx, 1NTTjmp write_callNTTend_sq:NNTTmov rsi, r12NTTmov rdx, 1NNTTwrite_call:NTTmov rax, 1NTTsyscallNNTTinc r12NTTjmp loopNTend_loop:NTpop raxNTxor rax, raxNTretNsection .dataNmagic: db '?', 0Nlen: equ $ - magic - 1N", 0
len: equ $ - magic - 1
