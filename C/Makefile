CC = cc
CFLAGS = -Wall -Werror -Wextra

%.c: %.c.base
	< $< sed "s|?|$$(< $< tr '"\n\t\\' "'NTB"| sed "s|int i = [0-9]|Y|")|"  > $@

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

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
	rm -rf Colleen/Colleen.c
	rm -rf Grace/Grace.c
	rm -rf Sully/Sully.c

re: fclean all

sre: sclean all

.DEFAULT_GOAL := all

.PHONY: clean fclean sclean re all

.PRECIOUS: %.c
