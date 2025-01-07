#include <stdio.h>
#include <fcntl.h>

// the defines
#define magic_string "#include <stdio.h>N#include <fcntl.h>NN// the definesN#define magic_string D?DN#define f m##a##i##nN#define uwu() int f(void) { evaluate(); return 0; }NNenum e_escape {NTupper_d = 68,NTupper_s = 83,NTupper_b = 66,NTupper_n = 78,NTupper_t = 84,NTupper_q = 81,NTquestion_mark = 63,N};NNNvoidTevaluate(void)N{NTintTTidx = 0;NTcharTc;NTcharTchr_fmt[3];NTcharTstr_fmt[3];NTintTTfd;NNTchr_fmt[0] = Q%Q;NTchr_fmt[1] = QcQ;NTchr_fmt[2] = QB0Q;NTstr_fmt[0] = Q%Q;NTstr_fmt[1] = QsQ;NTstr_fmt[2] = QB0Q;NTfd = open(DGrace_kid.cD, 0100 | 01000 | 01, 0644);NTwhile (magic_string[idx])NT{NTTc = magic_string[idx++];NTTswitch (c)NTT{NTTcase upper_d:NTTTdprintf(fd, chr_fmt, QDQ);NTTTbreak;NTTcase upper_b:NTTTdprintf(fd, chr_fmt, QBBQ);NTTTbreak;NTTcase upper_n:NTTTdprintf(fd, chr_fmt, QBnQ);NTTTbreak;NTTcase upper_t:NTTTdprintf(fd, chr_fmt, QBtQ);NTTTbreak;NTTcase upper_q:NTTTdprintf(fd, chr_fmt, QBQQ);NTTTbreak;NTTcase question_mark:NTTTdprintf(fd, str_fmt, magic_string);NTTTbreak;NTTdefault:NTTTdprintf(fd, chr_fmt, c);NTTTbreak;NTT}NT}N}NNuwu()N"
#define f m##a##i##n
#define uwu() int f(void) { evaluate(); return 0; }

enum e_escape {
	upper_d = 68,
	upper_s = 83,
	upper_b = 66,
	upper_n = 78,
	upper_t = 84,
	upper_q = 81,
	question_mark = 63,
};


void	evaluate(void)
{
	int		idx = 0;
	char	c;
	char	chr_fmt[3];
	char	str_fmt[3];
	int		fd;

	chr_fmt[0] = '%';
	chr_fmt[1] = 'c';
	chr_fmt[2] = '\0';
	str_fmt[0] = '%';
	str_fmt[1] = 's';
	str_fmt[2] = '\0';
	fd = open("Grace_kid.c", 0100 | 01000 | 01, 0644);
	while (magic_string[idx])
	{
		c = magic_string[idx++];
		switch (c)
		{
		case upper_d:
			dprintf(fd, chr_fmt, '"');
			break;
		case upper_b:
			dprintf(fd, chr_fmt, '\\');
			break;
		case upper_n:
			dprintf(fd, chr_fmt, '\n');
			break;
		case upper_t:
			dprintf(fd, chr_fmt, '\t');
			break;
		case upper_q:
			dprintf(fd, chr_fmt, '\'');
			break;
		case question_mark:
			dprintf(fd, str_fmt, magic_string);
			break;
		default:
			dprintf(fd, chr_fmt, c);
			break;
		}
	}
}

uwu()
