CC = cc
CFLAGS = -Wall -Werror -Wextra

%.c: %.c.base
	< $< sed "s|?|$$(< $< tr '"\n\t' "'NT")|" > $@

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

Colleen/Colleen: Colleen/Colleen.o
	$(CC) $(CFLAGS) -o $@ $<

all: Colleen/Colleen

clean:
	rm -rf Colleen/Colleen.c Colleen/Colleen.o

fclean: clean
	rm -rf Colleen/Colleen

re: fclean all

.DEFAULT_GOAL: all

.PHONY: clean fclean

.PRECIOUS: %.c
