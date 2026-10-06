CC = cc
NASM = nasm
CFLAGS = -Wall -Werror -Wextra

%.s: %.s.base
	< $< sed "s|?|$$(< $< tr '"\n\t\\;' "'NTBS"| sed "s|mov r12b, [0-9]|Y|")|"  > $@

%.o: %.s
	$(NASM) -f elf64  $< -o $@

Colleen/Colleen: Colleen/Colleen.o
	$(CC) $(CFLAGS) -o $@ $<

Grace/Grace: Grace/Grace.o
	$(CC) $(CFLAGS) -o $@ $<

Sully/Sully: Sully/Sully.o
	$(CC) $(CFLAGS) -o $@ $<

Sully/test/Sully: Sully/Sully
	mkdir -p Sully/test/
	cp $< $@

all: Colleen/Colleen Grace/Grace Sully/test/Sully

clean:
	rm -rf Colleen/Colleen.o
	rm -rf Grace/Grace.o
	rm -rf Sully/Sully.o

fclean: clean
	rm -rf Sully/test/
	rm -rf Colleen/Colleen
	rm -rf Grace/Grace
	rm -rf Sully/Sully

sclean: fclean
	rm -rf Colleen/Colleen.s
	rm -rf Grace/Grace.s
	rm -rf Sully/Sully.s

re: fclean all

sre: sclean all

.DEFAULT_GOAL: all

.PHONY: clean fclean sclean re all

.PRECIOUS: %.s
