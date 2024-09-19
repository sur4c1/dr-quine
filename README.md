# Dr\_Quine
A 42 project about `quine`, a classical programing exercice about self-reproducing programs.
The requiered langages are C and x86-64 Assembly. And for the bonuses, I chose to make it in NodeJS as well.

## Project outline 
### Colleen
It is the easier one. A simple quine with some restrictions.

### Grace
This one is a twist on the quine idea : instead of outputing the content of the file, I must create a new file, with the same content.

### Sully
This one is the last exercice. I am asked to create a program that create a near-copy of it's source code, compile it, and exectute it. This process goes on until the variable that we change in each iterations reaches 0.

## My approach on the matter
### Pseudo Langage
My first thought, inspired via the meme `printf(s, s);`, was to create an interpreter for a langage that included a quine in itself.

#### The langage commands
- `'`: Print a `"`
- `?`: Print the source code of the langage
- \*: Print the current character

#### Example

`abc?'123'` would print `abcabc?'123'"123"`.
