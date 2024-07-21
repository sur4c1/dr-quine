#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

int main()
{
	char *magic_string = "#include <stdio.h>N#include <unistd.h>N#include <fcntl.h>N#include <stdlib.h>NNint main()N{N	char *magic_string = '?';N	int idx = 0;N	int i = I;N	char name[20];N	if (i >= 0)N	{N		sprintf(name, 'Sully_%d.c', i);N		int fd = open(name, 0100 | 01, 0666);N		if (fd < 1)N			return 1;N		while (magic_string[idx])N		{N			if (magic_string[idx] == 63)N				dprintf(fd, '%s', magic_string);N			else if (magic_string[idx] == 78)N				dprintf(fd, '%c', 10);N			else if (magic_string[idx] == 39)N				dprintf(fd, '%c', 34);N			else if (magic_string[idx] == 73)N				dprintf(fd, '%d', i - 1);N			elseN				dprintf(fd, '%c', magic_string[idx]);N			idx++;N		}N		close(fd);N		char cmd[100];N		sprintf(cmd, 'gcc -Wall -Wextra -Werror -o Sully_%d %s', i, name);N		sprintf(name, './Sully_%d', i);N		system(cmd);N		system(name);N	}N}N";
	int idx = 0;
	int i = 5;
	char name[20];
	if (i >= 0)
	{
		sprintf(name, "Sully_%d.c", i);
		int fd = open(name, 0100 | 01, 0666);
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
				dprintf(fd, "%d", i - 1);
			else
				dprintf(fd, "%c", magic_string[idx]);
			idx++;
		}
		close(fd);
		char cmd[100];
		sprintf(cmd, "gcc -Wall -Wextra -Werror -o Sully_%d %s", i, name);
		sprintf(name, "./Sully_%d", i);
		system(cmd);
		system(name);
	}
}
