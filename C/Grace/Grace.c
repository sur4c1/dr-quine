#include <stddef.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

/*
	Comment 4 subject
*/
#define magic "#include <stddef.h>N#include <unistd.h>N#include <sys/types.h>N#include <sys/stat.h>N#include <fcntl.h>NN/*NTComment 4 subjectN*/N#define magic '?'N#define target_file 'Grace_kid.c'N#define entry                                                      BNTint main(void)                                                 BNT{                                                              BNTTchar magic_string[] = magic;                               BNTTchar c[1];                                                 BNTTsize_t i;                                                  BNTTint fd;                                                    BN                                                                   BNTTfd = open(target_file, 01102, 0644);                        BNTTi = 0;                                                     BNTTwhile (magic_string[i])                                    BNTT{                                                          BNTTTswitch (magic_string[i])                               BNTTT{                                                      BNTTTcase 0x3f:                                             BNTTTTwrite(fd, magic_string, sizeof(magic_string) - 1); BNTTTTbreak;                                             BNTTTcase 0x27:                                             BNTTTTc[0] = 0x22;                                       BNTTTTwrite(fd, c, 1);                                   BNTTTTbreak;                                             BNTTTcase 0x4e:                                             BNTTTTc[0] = 0x0a;                                       BNTTTTwrite(fd, c, 1);                                   BNTTTTbreak;                                             BNTTTcase 0x54:                                             BNTTTTc[0] = 0x09;                                       BNTTTTwrite(fd, c, 1);                                   BNTTTTbreak;                                             BNTTTcase 0x42:                                             BNTTTTc[0] = 0x5C;                                       BNTTTTwrite(fd, c, 1);                                   BNTTTTbreak;                                             BNTTTdefault:                                               BNTTTTwrite(fd, magic_string + i, 1);                    BNTTTTbreak;                                             BNTTT}                                                      BNTTTi++;                                                   BNTT}                                                          BNT}NNentryN"
#define target_file "Grace_kid.c"
#define entry                                                      \
	int main(void)                                                 \
	{                                                              \
		char magic_string[] = magic;                               \
		char c[1];                                                 \
		size_t i;                                                  \
		int fd;                                                    \
                                                                   \
		fd = open(target_file, 01102, 0644);                        \
		i = 0;                                                     \
		while (magic_string[i])                                    \
		{                                                          \
			switch (magic_string[i])                               \
			{                                                      \
			case 0x3f:                                             \
				write(fd, magic_string, sizeof(magic_string) - 1); \
				break;                                             \
			case 0x27:                                             \
				c[0] = 0x22;                                       \
				write(fd, c, 1);                                   \
				break;                                             \
			case 0x4e:                                             \
				c[0] = 0x0a;                                       \
				write(fd, c, 1);                                   \
				break;                                             \
			case 0x54:                                             \
				c[0] = 0x09;                                       \
				write(fd, c, 1);                                   \
				break;                                             \
			case 0x42:                                             \
				c[0] = 0x5C;                                       \
				write(fd, c, 1);                                   \
				break;                                             \
			default:                                               \
				write(fd, magic_string + i, 1);                    \
				break;                                             \
			}                                                      \
			i++;                                                   \
		}                                                          \
	}

entry
