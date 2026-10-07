#include <stddef.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>

#define master (!strchr(__FILE__, 0x5f))

int main(void)
{
	char magic_string[] = "#include <stddef.h>N#include <unistd.h>N#include <sys/types.h>N#include <sys/stat.h>N#include <fcntl.h>N#include <stdlib.h>N#include <string.h>NN#define master (!strchr(__FILE__, 0x5f))NNint main(void)N{NTchar magic_string[] = '?';NTchar target[] = 'Sully_X.c';NTchar ctarget[] = './Sully_X';NTchar command[] = 'cc Sully_X.c -o Sully_X';NTchar c[1];NTsize_t idx;NTY;NTint fd;NNTif (!master)NTTi--;NTtarget[6] = 0x30 + i;NTctarget[8] = 0x30 + i;NTcommand[9] = 0x30 + i;NTcommand[22] = 0x30 + i;NTfd = open(target, 01102, 0644);NTidx = 0;NTwhile (magic_string[idx])NT{NTTswitch (magic_string[idx])NTT{NTTcase 0x3f:NTTTwrite(fd, magic_string, sizeof(magic_string) - 1);NTTTbreak;NTTcase 0x27:NTTTc[0] = 0x22;NTTTwrite(fd, c, 1);NTTTbreak;NTTcase 0x4e:NTTTc[0] = 0x0a;NTTTwrite(fd, c, 1);NTTTbreak;NTTcase 0x54:NTTTc[0] = 0x09;NTTTwrite(fd, c, 1);NTTTbreak;NTTcase 0x42:NTTTc[0] = 0x5c;NTTTwrite(fd, c, 1);NTTTbreak;NTTcase 0x59:NTTTwrite(fd, 'int i = ', 8);NTTTwrite(fd, target + 6, 1);NTTTbreak;NTTdefault:NTTTwrite(fd, magic_string + idx, 1);NTTTbreak;NTT}NTTidx++;NT}NTclose(fd);NTif (i >= 0)NT{NTTsystem(command);NTTif (i > 0)NTT{NTTTsystem(ctarget);NTT}NT}N}N";
	char target[] = "Sully_X.c";
	char ctarget[] = "./Sully_X";
	char command[] = "cc Sully_X.c -o Sully_X";
	char c[1];
	size_t idx;
	int i = 5;
	int fd;

	if (!master)
		i--;
	target[6] = 0x30 + i;
	ctarget[8] = 0x30 + i;
	command[9] = 0x30 + i;
	command[22] = 0x30 + i;
	fd = open(target, 01102, 0644);
	idx = 0;
	while (magic_string[idx])
	{
		switch (magic_string[idx])
		{
		case 0x3f:
			write(fd, magic_string, sizeof(magic_string) - 1);
			break;
		case 0x27:
			c[0] = 0x22;
			write(fd, c, 1);
			break;
		case 0x4e:
			c[0] = 0x0a;
			write(fd, c, 1);
			break;
		case 0x54:
			c[0] = 0x09;
			write(fd, c, 1);
			break;
		case 0x42:
			c[0] = 0x5c;
			write(fd, c, 1);
			break;
		case 0x59:
			write(fd, "int i = ", 8);
			write(fd, target + 6, 1);
			break;
		default:
			write(fd, magic_string + idx, 1);
			break;
		}
		idx++;
	}
	close(fd);
	if (i >= 0)
	{
		system(command);
		if (i > 0)
		{
			system(ctarget);
		}
	}
}
