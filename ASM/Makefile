all:		colleen/Colleen grace/Grace sully/Sully

clean:
	rm -rf colleen/Colleen.o grace/Grace.o sully/Sully.o

fclean:		clean
	rm -rf colleen/ grace/ sully/

re:			fclean all

colleen/Colleen:	Colleen.s
	mkdir -p colleen
	nasm -f elf64 Colleen.s -o colleen/Colleen.o
	ld -m elf_x86_64 colleen/Colleen.o -o colleen/Colleen -e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

grace/Grace:		Grace.s
	mkdir -p grace
	nasm -f elf64 Grace.s -o grace/Grace.o
	ld -melf_x86_64 grace/Grace.o -e grace/Grace -dynamic-linker /lib/ld-linux.so.2

sully/Sully:		Sully.s
	mkdir -p sully
	nasm -f elf64 Sully.s -o sully/Sully.o
	ld -melf_x86_64 sully/Sully.o -e sully/Sully -dynamic-linker /lib/ld-linux.so.2

.PHONY:		all clean fclean re
