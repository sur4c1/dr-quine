/******************************************************************************
 *                                                                            *
 *  colleen.c                                                                 *
 *                                                                            *
 *  by: sur4c1                                                                *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>

enum e_escape {
	upper_d = 68,
	upper_s = 83,
	upper_b = 66,
	upper_n = 78,
	upper_t = 84,
	upper_q = 81,
	question_mark = 63,
};


void	evaluate(char c, char *magic_string)
{
	char chr_fmt[3];
	chr_fmt[0] = '%';
	chr_fmt[1] = 'c';
	chr_fmt[2] = '\0';
	char str_fmt[3];
	str_fmt[0] = '%';
	str_fmt[1] = 's';
	str_fmt[2] = '\0';
	switch (c)
	{
	case upper_d:
		printf(chr_fmt, '"');
		break;
	case upper_b:
		printf(chr_fmt, '\\');
		break;
	case upper_n:
		printf(chr_fmt, '\n');
		break;
	case upper_t:
		printf(chr_fmt, '\t');
		break;
	case upper_q:
		printf(chr_fmt, '\'');
		break;
	case question_mark:
		printf(str_fmt, magic_string);
		break;
	default:
		printf(chr_fmt, c);
		break;
	}
}

int main(void)
{
	/**
	 * the most important string in the universe
	 * find out why, in the readme
	 */
	char	*magic_string = "/******************************************************************************N *                                                                            *N *  colleen.c                                                                 *N *                                                                            *N *  by: sur4c1                                                                *N *                                                                            *N ******************************************************************************/NN#include <stdio.h>NNenum e_escape {NTupper_d = 68,NTupper_s = 83,NTupper_b = 66,NTupper_n = 78,NTupper_t = 84,NTupper_q = 81,NTquestion_mark = 63,N};NNNvoidTevaluate(char c, char *magic_string)N{NTchar chr_fmt[3];NTchr_fmt[0] = Q%Q;NTchr_fmt[1] = QcQ;NTchr_fmt[2] = QB0Q;NTchar str_fmt[3];NTstr_fmt[0] = Q%Q;NTstr_fmt[1] = QsQ;NTstr_fmt[2] = QB0Q;NTswitch (c)NT{NTcase upper_d:NTTprintf(chr_fmt, QDQ);NTTbreak;NTcase upper_b:NTTprintf(chr_fmt, QBBQ);NTTbreak;NTcase upper_n:NTTprintf(chr_fmt, QBnQ);NTTbreak;NTcase upper_t:NTTprintf(chr_fmt, QBtQ);NTTbreak;NTcase upper_q:NTTprintf(chr_fmt, QBQQ);NTTbreak;NTcase question_mark:NTTprintf(str_fmt, magic_string);NTTbreak;NTdefault:NTTprintf(chr_fmt, c);NTTbreak;NT}N}NNint main(void)N{NT/**NT * the most important string in the universeNT * find out why, in the readmeNT */NTcharT*magic_string = D?D;NTintTTidx = 0;NTwhile (magic_string[idx])NTTevaluate(magic_string[idx++], magic_string);N}N";
	int		idx = 0;
	while (magic_string[idx])
		evaluate(magic_string[idx++], magic_string);
}
