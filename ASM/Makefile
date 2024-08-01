all:	Colleen Grace Sully

clean:
	rm -rf Colleen.o Grace.o Sully.o
	rm -rf Sully_* Grace_kid*

fclean:		clean
	rm -rf Colleen Grace Sully

re:			fclean all

Colleen:	Colleen.s
	nasm -f elf64 Colleen.s -o Colleen.o
	ld -m elf_x86_64 Colleen.o -o Colleen -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

Grace:		Grace.s
	nasm -f elf64 Grace.s -o Grace.o
	ld -m elf_x86_64 Grace.o -o Grace  -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

Sully:		Sully.s
	nasm -f elf64 Sully.s -o Sully.o
	ld -m elf_x86_64 Sully.o -o Sully  -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

.PHONY:		all clean fclean re
