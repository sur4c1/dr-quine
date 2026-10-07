#include <iostream>

/*
	Useless function per subject recommendations
*/
static void noop(void) {}

int main(void)
{
	std::string magic_string = "#include <iostream>NN/*NTUseless function per subject recommendationsN*/Nstatic void noop(void) {}NNint main(void)N{NTstd::string magic_string = '?';NTstd::string c = ' ';NNTfor (auto chr : magic_string)NT{NTTswitch (static_cast<int>(chr))NTT{NTTcase 0x3f:NTTTstd::cout << magic_string;NTTTbreak;NTTcase 0x27:NTTTc[0] = static_cast<char>(0x22);NTTTstd::cout << c;NTTTbreak;NTTcase 0x4e:NTTTstd::cout << std::endl;NTTTbreak;NTTcase 0x54:NTTTc[0] = static_cast<char>(0x09);NTTTstd::cout << c;NTTTbreak;NTTdefault:NTTTstd::cout << chr;NTTTbreak;NTT}NT}NNT/*NTTUseless function call per subject recommendationNT*/NTnoop();N}N";
	std::string c = " ";

	for (auto chr : magic_string)
	{
		switch (static_cast<int>(chr))
		{
		case 0x3f:
			std::cout << magic_string;
			break;
		case 0x27:
			c[0] = static_cast<char>(0x22);
			std::cout << c;
			break;
		case 0x4e:
			std::cout << std::endl;
			break;
		case 0x54:
			c[0] = static_cast<char>(0x09);
			std::cout << c;
			break;
		default:
			std::cout << chr;
			break;
		}
	}

	/*
		Useless function call per subject recommendation
	*/
	noop();
}
