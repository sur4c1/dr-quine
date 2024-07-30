#!node

/*
	Colleen:
		the eazy one
 */

function noop()
{}

function main()
{
	/*this string is very important*/
	const magic_string = "#!nodeNN/*N	Colleen:N		the eazy oneN */NNfunction noop()N{}NNfunction main()N{N	/*this string is very important*/N	const magic_string = '?';N	var i = 0;N	while (magic_string[i])N	{N		if (magic_string.charCodeAt(i) === 63) /* question mark */N			process.stdout.write(magic_string);N		else if (magic_string.charCodeAt(i) === 78) /* uppercase n */N			console.log(); // newlineN		else if (magic_string.charCodeAt(i) === 39) /* singlequote */N			process.stdout.write(String.fromCharCode(34)); // doublequoteN		elseN			process.stdout.write(magic_string[i])N		i++;N	}N	noop();N}NNmain()N";
	var i = 0;
	while (magic_string[i])
	{
		if (magic_string.charCodeAt(i) === 63) /* question mark */
			process.stdout.write(magic_string);
		else if (magic_string.charCodeAt(i) === 78) /* uppercase n */
			console.log(); // newline
		else if (magic_string.charCodeAt(i) === 39) /* singlequote */
			process.stdout.write(String.fromCharCode(34)); // doublequote
		else
			process.stdout.write(magic_string[i])
		i++;
	}
	noop();
}

main()
