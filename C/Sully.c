#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

#define magic_string "#include <stdio.h>N#include <fcntl.h>N#include <stdlib.h>NN#define magic_string D?DNNenum e_escape {NTupper_d = 68,NTupper_s = 83,NTupper_b = 66,NTupper_n = 78,NTupper_t = 84,NTupper_q = 81,NTtild = 126,NTquestion_mark = 63,N};NNint main()N{NTintTTi = ~;NTcharTc;NTintTTidx = 0;NTcharTfilename[] = DSully_x.cD;NTcharTcompile[] = Dcc -Wall -Wextra -Werror Sully_x.c -o Sully_xD;NTchar Trun[] = D./Sully_xD;NTintTTfd;NNTif (__FILE__[5] == Q_Q)NTTi--;NTfilename[6] = i + Q0Q;NTcompile[44] = i + Q0Q;NTcompile[31] = i + Q0Q;NTrun[8] = i + Q0Q;NTfd = open(filename, 0100 | 01000 | 01, 0644);NTwhile (magic_string[idx])NT{NTTc = magic_string[idx++];NTTswitch (c)NTT{NTTcase upper_d:NTTTdprintf(fd, D%cD, QDQ);NTTTbreak;NTTcase upper_b:NTTTdprintf(fd, D%cD, QBBQ);NTTTbreak;NTTcase upper_n:NTTTdprintf(fd, D%cD, QBnQ);NTTTbreak;NTTcase upper_t:NTTTdprintf(fd, D%cD, QBtQ);NTTTbreak;NTTcase upper_q:NTTTdprintf(fd, D%cD, QBQQ);NTTTbreak;NTTcase question_mark:NTTTdprintf(fd, D%sD, magic_string);NTTTbreak;NTTcase tild:NTTTdprintf(fd, D%dD, i);NTTTbreak;NTTdefault:NTTTdprintf(fd, D%cD, c);NTTTbreak;NTT}NT}NTsystem(compile);NTif (i > 0)NTTsystem(run);NTreturn (0);N}N"

enum e_escape {
	upper_d = 68,
	upper_s = 83,
	upper_b = 66,
	upper_n = 78,
	upper_t = 84,
	upper_q = 81,
	tild = 126,
	question_mark = 63,
};

int main()
{
	int		i = 5;
	char	c;
	int		idx = 0;
	char	filename[] = "Sully_x.c";
	char	compile[] = "cc -Wall -Wextra -Werror Sully_x.c -o Sully_x";
	char 	run[] = "./Sully_x";
	int		fd;

	if (__FILE__[5] == '_')
		i--;
	filename[6] = i + '0';
	compile[44] = i + '0';
	compile[31] = i + '0';
	run[8] = i + '0';
	fd = open(filename, 0100 | 01000 | 01, 0644);
	while (magic_string[idx])
	{
		c = magic_string[idx++];
		switch (c)
		{
		case upper_d:
			dprintf(fd, "%c", '"');
			break;
		case upper_b:
			dprintf(fd, "%c", '\\');
			break;
		case upper_n:
			dprintf(fd, "%c", '\n');
			break;
		case upper_t:
			dprintf(fd, "%c", '\t');
			break;
		case upper_q:
			dprintf(fd, "%c", '\'');
			break;
		case question_mark:
			dprintf(fd, "%s", magic_string);
			break;
		case tild:
			dprintf(fd, "%d", i);
			break;
		default:
			dprintf(fd, "%c", c);
			break;
		}
	}
	system(compile);
	if (i > 0)
		system(run);
	return (0);
}
