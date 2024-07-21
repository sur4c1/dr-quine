all:		colleen/Colleen grace/Grace sully/Sully

clean:

fclean:		clean
	rm -rf colleen/ grace/ sully/

re:			fclean all

colleen/Colleen:	Colleen.c
	mkdir -p colleen
	gcc -Wall -Wextra -Werror Colleen.c -o colleen/Colleen

grace/Grace:		Grace.c
	mkdir -p grace
	gcc -Wall -Wextra -Werror Grace.c -o grace/Grace

sully/Sully:		Sully.c
	mkdir -p sully
	gcc -Wall -Wextra -Werror Sully.c -o sully/Sully

.PHONY:		all clean fclean re
