#include <iostream>
#include <fstream>

/*
	Comment 4 subject
*/
#define magic "#include <iostream>N#include <fstream>NN/*NTComment 4 subjectN*/N#define magic '?'N#define target_file 'Grace_kid.cpp'N#define entry                              BNTint main(void)                         BNT{                                      BNTTstd::string magic_string = magic;  BNTTstd::string c = ' ';               BNTTstd::ofstream child;               BN                                           BNTTchild.open(target_file);           BNTTfor (char chr : magic_string)      BNTT{                                  BNTTTswitch (static_cast<int>(chr)) BNTTT{                              BNTTTcase 0x3f:                     BNTTTTchild << magic_string;     BNTTTTbreak;                     BNTTTcase 0x27:                     BNTTTTc[0] = 0x22;               BNTTTTchild << c;                BNTTTTbreak;                     BNTTTcase 0x4e:                     BNTTTTc[0] = 0x0a;               BNTTTTchild << c;                BNTTTTbreak;                     BNTTTcase 0x54:                     BNTTTTc[0] = 0x09;               BNTTTTchild << c;                BNTTTTbreak;                     BNTTTcase 0x42:                     BNTTTTc[0] = 0x5C;               BNTTTTchild << c;                BNTTTTbreak;                     BNTTTdefault:                       BNTTTTchild << chr;              BNTTTTbreak;                     BNTTT}                              BNTT}                                  BNT}NNentryN"
#define target_file "Grace_kid.cpp"
#define entry                              \
	int main(void)                         \
	{                                      \
		std::string magic_string = magic;  \
		std::string c = " ";               \
		std::ofstream child;               \
                                           \
		child.open(target_file);           \
		for (char chr : magic_string)      \
		{                                  \
			switch (static_cast<int>(chr)) \
			{                              \
			case 0x3f:                     \
				child << magic_string;     \
				break;                     \
			case 0x27:                     \
				c[0] = 0x22;               \
				child << c;                \
				break;                     \
			case 0x4e:                     \
				c[0] = 0x0a;               \
				child << c;                \
				break;                     \
			case 0x54:                     \
				c[0] = 0x09;               \
				child << c;                \
				break;                     \
			case 0x42:                     \
				c[0] = 0x5C;               \
				child << c;                \
				break;                     \
			default:                       \
				child << chr;              \
				break;                     \
			}                              \
		}                                  \
	}

entry
