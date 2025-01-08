CC		=	clang
CFLAGS	=	-Wall -Wextra -Werror

all: Colleen Grace Sully

Colleen: Colleen.s
	$(CC) $(CFLAGS) Colleen.s -o Colleen

Grace: Grace.s
	$(CC) $(CFLAGS) Grace.s -o Grace

Sully: Sully.s
	$(CC) $(CFLAGS) Sully.s -o Sully

clean:

fclean: clean
	rm -f Colleen Grace Sully Grace_kid.c Sully_*

re: fclean all

.PHONY: all clean fclean re
