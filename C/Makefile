CC		=	clang
CFLAGS	=	-Wall -Wextra -Werror

all: Colleen Grace Sully

Colleen: Colleen.c
	$(CC) $(CFLAGS) Colleen.c -o Colleen

Grace:
	$(CC) $(CFLAGS) Grace.c -o Grace

Sully:
	$(CC) $(CFLAGS) Sully.c -o Sully

clean:

fclean: clean
	rm -f Colleen Grace Sully Grace_kid.c Sully_*

re: fclean all

.PHONY: all clean fclean re
