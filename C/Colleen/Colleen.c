#include <stddef.h>
#include <unistd.h>

/*
	Useless function per subject recommendations
*/
static void noop(void) {}

int main(void)
{
	char magic_string[] = "#include <stddef.h>N#include <unistd.h>NN/*NTUseless function per subject recommendationsN*/Nstatic void noop(void) {}NNint main(void)N{NTchar magic_string[] = '?';NTchar c[1];NTsize_t i;NNTi = 0;NTwhile (magic_string[i])NT{NTTswitch (magic_string[i])NTT{NTTcase 0x3f:NTTTwrite(1, magic_string, sizeof(magic_string) - 1);NTTTbreak;NTTcase 0x27:NTTTc[0] = 0x22;NTTTwrite(1, c, 1);NTTTbreak;NTTcase 0x4e:NTTTc[0] = 0x0a;NTTTwrite(1, c, 1);NTTTbreak;NTTcase 0x54:NTTTc[0] = 0x09;NTTTwrite(1, c, 1);NTTTbreak;NTTdefault:NTTTwrite(1, magic_string + i, 1);NTTTbreak;NTT}NTTi++;NT}NNT/*NTTUseless function call per subject recommendationNT*/NTnoop();N}N";
	char c[1];
	size_t i;

	i = 0;
	while (magic_string[i])
	{
		switch (magic_string[i])
		{
		case 0x3f:
			write(1, magic_string, sizeof(magic_string) - 1);
			break;
		case 0x27:
			c[0] = 0x22;
			write(1, c, 1);
			break;
		case 0x4e:
			c[0] = 0x0a;
			write(1, c, 1);
			break;
		case 0x54:
			c[0] = 0x09;
			write(1, c, 1);
			break;
		default:
			write(1, magic_string + i, 1);
			break;
		}
		i++;
	}

	/*
		Useless function call per subject recommendation
	*/
	noop();
}
