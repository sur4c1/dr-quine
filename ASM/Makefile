all:		colleen/Colleen grace/Grace sully/Sully

clean:
	rm -rf colleen/Colleen.o grace/Grace.o sully/Sully.o

fclean:		clean
	rm -rf colleen/ grace/ sully/

re:			fclean all

colleen/Colleen:	Colleen.s
	mkdir -p colleen
	nasm -f elf64 Colleen.s -o colleen/Colleen.o
	cc colleen/Colleen.o -o colleen/Colleen

grace/Grace:		Grace.s
	mkdir -p grace
	nasm -f elf64 Grace.s -o grace/Grace.o
	cc grace/Grace.o -o grace/Grace

sully/Sully:		Sully.s
	mkdir -p sully
	nasm -f elf64 Sully.s -o sully/Sully.o
	cc sully/Sully.o -o sully/Sully

.PHONY:		all clean fclean re

#
#	Sully (i = 5) (is a special boy and doesnt decrement i)
#		└─ Sully_5.c
#		└─ Sully_5 (i = 5 >= 0 ---> execute next program)
#			└─ Sully_4.c
#			└─ Sully_4 (i = 4 >= 0 ---> execute next program)
#				└─ Sully_3.c
#				└─ Sully_3 (i = 3 >= 0 ---> execute next program)
#					└─ Sully_2.c
#					└─ Sully_2 (i = 2 >= 0 ---> execute next program)
#						└─ Sully_1.c
#						└─ Sully_1 (i = 1 >= 0 ---> execute next program)
#							└─ Sully_0.c
#							└─ Sully_0 (i = 0 >= 0 ---> execute next program)
#								└─ Sully_-1.c
#								└─ Sully_-1 (i = -1 < 0 ---> stop here (/mb create Sully_-2.c and Sully_-2 but does not execute it))
#
