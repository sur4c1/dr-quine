/*
	Colleen:
		the eazy one
 */

#include <stdio.h>

void noop()
{}

int main()
{
	/*this string is very important*/
	char *magic_string = "/*N	Colleen:N		the eazy oneN */NN#include <stdio.h>NNvoid noop()N{}NNint main()N{N	/*this string is very important*/N	char *magic_string = '?';N	int i = 0;N	while (magic_string[i])N	{N		if (magic_string[i] == 63) /* question mark */N			printf('%s', magic_string);N		else if (magic_string[i] == 78) /* uppercase n */N			printf('%c', 10); // newlineN		else if (magic_string[i] == 39) /* singlequote */N			printf('%c', 34); // doublequoteN		elseN			printf('%c', magic_string[i]);N		i++;N	}N	noop();N}N";
	int i = 0;
	while (magic_string[i])
	{
		if (magic_string[i] == 63) /* question mark */
			printf("%s", magic_string);
		else if (magic_string[i] == 78) /* uppercase n */
			printf("%c", 10); // newline
		else if (magic_string[i] == 39) /* singlequote */
			printf("%c", 34); // doublequote
		else
			printf("%c", magic_string[i]);
		i++;
	}
	noop();
}
