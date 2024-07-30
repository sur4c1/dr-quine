#!node

const fs = require("fs")

const magic_string = "#!nodeNNconst fs = require('fs')NNconst magic_string = '?';Nvar i = 0;Nfs.writeFileSync('Grace_kid.js', '')Nwhile (magic_string[i])N{N	if (magic_string.charCodeAt(i) === 63)N		fs.appendFileSync('Grace_kid.js', magic_string);N	else if (magic_string.charCodeAt(i) === 78)N		fs.appendFileSync('Grace_kid.js', String.fromCharCode(10));N	else if (magic_string.charCodeAt(i) === 39)N		fs.appendFileSync('Grace_kid.js', String.fromCharCode(34));N	elseN		fs.appendFileSync('Grace_kid.js', magic_string[i]);N	i++;N}NN";
var i = 0;
fs.writeFileSync("Grace_kid.js", "")
while (magic_string[i])
{
	if (magic_string.charCodeAt(i) === 63)
		fs.appendFileSync("Grace_kid.js", magic_string);
	else if (magic_string.charCodeAt(i) === 78)
		fs.appendFileSync("Grace_kid.js", String.fromCharCode(10));
	else if (magic_string.charCodeAt(i) === 39)
		fs.appendFileSync("Grace_kid.js", String.fromCharCode(34));
	else
		fs.appendFileSync("Grace_kid.js", magic_string[i]);
	i++;
}

