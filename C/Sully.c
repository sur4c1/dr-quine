#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

int main()
{
	char *magic_string = "#include <stdio.h>N#include <unistd.h>N#include <fcntl.h>N#include <stdlib.h>NNint main()N{N	char *magic_string = '?';N	int idx = 0;N	int i = I;N	int next_i = i;N	#ifdef childrenN	next_i--;N	#endifN	if (next_i >= 0)N	{N		char name[20];N		sprintf(name, 'Sully_%d.c', next_i);N		int fd = open(name, 0101, 0666);N		if (fd < 1)N			return 1;N		while (magic_string[idx])N		{N			if (magic_string[idx] == 63)N				dprintf(fd, '%s', magic_string);N			else if (magic_string[idx] == 78)N				dprintf(fd, '%c', 10);N			else if (magic_string[idx] == 39)N				dprintf(fd, '%c', 34);N			else if (magic_string[idx] == 73)N				dprintf(fd, '%d', next_i);N			elseN				dprintf(fd, '%c', magic_string[idx]);N			idx++;N		}N		close(fd);N		char cmd[100];N		sprintf(cmd, 'gcc -Wall -Wextra -Werror -Dchildren -o Sully_%d %s', next_i, name);N		system(cmd);N		sprintf(name, './Sully_%d', next_i);N		system(name);N	}N}N";
	int idx = 0;
	int i = 5;
	int next_i = i;
	#ifdef children
	next_i--;
	#endif
	if (next_i >= 0)
	{
		char name[20];
		sprintf(name, "Sully_%d.c", next_i);
		int fd = open(name, 0101, 0666);
		if (fd < 1)
			return 1;
		while (magic_string[idx])
		{
			if (magic_string[idx] == 63)
				dprintf(fd, "%s", magic_string);
			else if (magic_string[idx] == 78)
				dprintf(fd, "%c", 10);
			else if (magic_string[idx] == 39)
				dprintf(fd, "%c", 34);
			else if (magic_string[idx] == 73)
				dprintf(fd, "%d", next_i);
			else
				dprintf(fd, "%c", magic_string[idx]);
			idx++;
		}
		close(fd);
		char cmd[100];
		sprintf(cmd, "gcc -Wall -Wextra -Werror -Dchildren -o Sully_%d %s", next_i, name);
		system(cmd);
		sprintf(name, "./Sully_%d", next_i);
		system(name);
	}
}
