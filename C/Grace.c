#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#define	magic_string "#include <stdio.h>N#include <unistd.h>N#include <fcntl.h>N#define	magic_string '?'N#define ft() int main(){int i = 0;int fd = open('Grace_kid.c', 0100 | 01, 0666);if (fd < 1) return 1;while (magic_string[i]){if (magic_string[i] == 63)dprintf(fd, '%s', magic_string);else if (magic_string[i] == 78)dprintf(fd, '%c', 10);else if (magic_string[i] == 39)dprintf(fd, '%c', 34);else dprintf(fd, '%c', magic_string[i]);i++;}close(fd);return 0;}NN/*N	Grace:N		the not so ez oneN*/Nft()N"
#define ft() int main(){int i = 0;int fd = open("Grace_kid.c", 0100 | 01, 0666);if (fd < 1) return 1;while (magic_string[i]){if (magic_string[i] == 63)dprintf(fd, "%s", magic_string);else if (magic_string[i] == 78)dprintf(fd, "%c", 10);else if (magic_string[i] == 39)dprintf(fd, "%c", 34);else dprintf(fd, "%c", magic_string[i]);i++;}close(fd);return 0;}

/*
	Grace:
		the not so ez one
*/
ft()
