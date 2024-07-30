#!node

const fs = require("fs")
const exec = require("child_process").exec

var i = 5;
const magic_string = "#!nodeNNconst fs = require('fs')Nconst exec = require('child_process').execNNvar i = I;Nconst magic_string = '?'NNi--Nconst filename = 'Sully_' + i + '.js'Nfs.writeFileSync(filename, '')Nvar	idx = 0;Nwhile (magic_string[idx])N{N	if (magic_string.charCodeAt(idx) === 63)N		fs.appendFileSync(filename, magic_string);N	else if (magic_string.charCodeAt(idx) === 78)N		fs.appendFileSync(filename, String.fromCharCode(10));N	else if (magic_string.charCodeAt(idx) === 39)N		fs.appendFileSync(filename, String.fromCharCode(34));N	else if (magic_string.charCodeAt(idx) === 73)N		fs.appendFileSync(filename, i)N	elseN		fs.appendFileSync(filename, magic_string[idx])N	idx++N}NNif (i < 0)N		process.exit()NNexec('node ' + filename)N"

i--
const filename = "Sully_" + i + ".js"
fs.writeFileSync(filename, "")
var	idx = 0;
while (magic_string[idx])
{
	if (magic_string.charCodeAt(idx) === 63)
		fs.appendFileSync(filename, magic_string);
	else if (magic_string.charCodeAt(idx) === 78)
		fs.appendFileSync(filename, String.fromCharCode(10));
	else if (magic_string.charCodeAt(idx) === 39)
		fs.appendFileSync(filename, String.fromCharCode(34));
	else if (magic_string.charCodeAt(idx) === 73)
		fs.appendFileSync(filename, i)
	else
		fs.appendFileSync(filename, magic_string[idx])
	idx++
}

if (i < 0)
		process.exit()

exec("node " + filename)
