extern printf

section .text
global _start

_start:
;; Using r9 as a counter
	mov r9, magic_str
	begin_loop:
		mov al, BYTE [r9]
		cmp al, 0
		je end_loop
		call evaluate
		inc r9
		jmp begin_loop
	end_loop:
	; exit 0
	mov rax, 60
	mov rdi, 0
	syscall

;; arg	al: character to evaluate
evaluate:
	mov rdi, char_format
	; cmp al, 68 ; uppercase d
	; jne not_d
	; 	mov rsi, 34 ; double quote
	; 	call printf
	; 	ret
	; not_d:
	; cmp al, 66 ; uppercase b
	; jne not_b
	; 	mov al, 92 ; backslash
	; 	call printf
	; 	ret
	; not_b:
	; cmp al, 78 ; uppercase n
	; jne not_n
	; 	mov al, 10 ; newline
	; 	call printf
	; 	ret
	; not_n:
	; cmp al, 84 ; uppercase t
	; jne not_t
	; 	mov al, 9 ; tab
	; 	call printf
	; 	ret
	; not_t:
	; cmp al, 81 ; uppercase q
	; jne not_q
	; 	mov al, 39 ; single quote
	; 	call printf
	; 	ret
	; not_q:
	; cmp al, 63 ; question mark
	; jne not_question
	; 	mov rdi, string_format
	; 	mov rsi, magic_str
	; 	call printf
	; 	ret
	; not_question:
	xor rsi, rsi
	mov sil, al
	xor rax, rax
	call printf
	ret

section .data
magic_str: 		db "prout", 0
char_format:	db "%c", 0
string_format:	db "%s", 0
