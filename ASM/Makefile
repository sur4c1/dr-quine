NASM	=	nasm -f elf64 -g
LD		= 	ld -m elf_x86_64
LDFLAGS	=	-e _start -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc

all: Colleen Grace Sully

Colleen: Colleen.s
	$(NASM) Colleen.s
	$(LD) -o Colleen Colleen.o $(LDFLAGS)

Grace: Grace.s
	$(NASM) Grace.s

Sully: Sully.s
	$(NASM) Sully.s

clean:
	rm -f Colleen.o Grace.o Sully.o

fclean: clean
	rm -f Colleen Grace Sully Grace_kid.c Sully_*

re: fclean all

.PHONY: all clean fclean re
