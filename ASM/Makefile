all:		colleen/Colleen grace/Grace sully/Sully

clean:
	rm -rf Colleen.o Grace.o Sully.o

fclean:		clean
	rm -rf colleen/ grace/ sully/

re:			fclean all

colleen/Colleen:	Colleen.s
	mkdir -p colleen
	nasm -f elf64 Colleen.s -o Colleen.o
	ld -m elf_x86_64 Colleen.o -o colleen/Colleen -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

grace/Grace:		Grace.s
	mkdir -p grace
	nasm -f elf64 Grace.s -o Grace.o
	ld -m elf_x86_64 Grace.o -o grace/Grace  -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

sully/Sully:		Sully.s
	mkdir -p sully
	nasm -f elf64 Sully.s -o Sully.o
	ld -m elf_x86_64 Sully.o -o sully/Sully  -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

.PHONY:		all clean fclean re
