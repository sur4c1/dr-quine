#include <iostream>
#include <fstream>

#define master (std::string(__FILE__).find(static_cast<char>(0x5f)) == std::string::npos)

int main(void)
{
	std::string magic_string = "#include <iostream>N#include <fstream>NN#define master (std::string(__FILE__).find(static_cast<char>(0x5f)) == std::string::npos)NNint main(void)N{NTstd::string magic_string = '?';NTstd::string target = 'Sully_X.cpp';NTstd::string ctarget = './Sully_X';NTstd::string command = 'c++ Sully_X.cpp -o Sully_X';NTstd::string c = ' ';NTY;NTstd::ofstream child;NNTif (!master)NTTi--;NTtarget[6] = 0x30 + i;NTctarget[8] = 0x30 + i;NTcommand[10] = 0x30 + i;NTcommand[25] = 0x30 + i;NTchild.open(target);NTfor (char chr : magic_string)NT{NTTswitch (static_cast<int>(chr))NTT{NTTcase 0x3f:NTTTchild << magic_string;NTTTbreak;NTTcase 0x27:NTTTc[0] = 0x22;NTTTchild << c;NTTTbreak;NTTcase 0x4e:NTTTc[0] = 0x0a;NTTTchild << c;NTTTbreak;NTTcase 0x54:NTTTc[0] = 0x09;NTTTchild << c;NTTTbreak;NTTcase 0x42:NTTTc[0] = 0x5c;NTTTchild << c;NTTTbreak;NTTcase 0x59:NTTTchild << 'int i = ' << i;NTTTbreak;NTTdefault:NTTTchild << chr;NTTTbreak;NTT}NT}NTchild.close();NTif (i >= 0)NT{NTTsystem(command.c_str());NTTif (i > 0)NTT{NTTTsystem(ctarget.c_str());NTT}NT}N}N";
	std::string target = "Sully_X.cpp";
	std::string ctarget = "./Sully_X";
	std::string command = "c++ Sully_X.cpp -o Sully_X";
	std::string c = " ";
	int i = 5;
	std::ofstream child;

	if (!master)
		i--;
	target[6] = 0x30 + i;
	ctarget[8] = 0x30 + i;
	command[10] = 0x30 + i;
	command[25] = 0x30 + i;
	child.open(target);
	for (char chr : magic_string)
	{
		switch (static_cast<int>(chr))
		{
		case 0x3f:
			child << magic_string;
			break;
		case 0x27:
			c[0] = 0x22;
			child << c;
			break;
		case 0x4e:
			c[0] = 0x0a;
			child << c;
			break;
		case 0x54:
			c[0] = 0x09;
			child << c;
			break;
		case 0x42:
			c[0] = 0x5c;
			child << c;
			break;
		case 0x59:
			child << "int i = " << i;
			break;
		default:
			child << chr;
			break;
		}
	}
	child.close();
	if (i >= 0)
	{
		system(command.c_str());
		if (i > 0)
		{
			system(ctarget.c_str());
		}
	}
}
