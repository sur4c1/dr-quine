# Understanding the subject

## Colleen

Colleen is a simple program that prints its own source code. It is a simple quine.

-   `Colleen.c`
    -   Compile into `Colleen`
        -   Prints the source code of `Colleen.c`

## Grace

Grace is a step harder : it must create a file named Grace_kid.c which is a copy of the source code of the file.

-   `Grace.c`
    -   Compile into `Grace`
        -   Creates `Grace_kid.c`
            -   has the same content as `Grace.c`

## Sully

Sully is another step harder : it create a file with the source code, like Grace, but slightly modified to decrease a variable, and then compile this new source code and run the resulting program, which will create another file, and so on.

-   `Sully.c` - Compile into `Sully` - Creates `Sully_5.c` - Compile `Sully_5.c` into `Sully_5` - Run `Sully_5` - Creates `Sully_4.c` - Compile `Sully_4.c` into `Sully_4` - Run `Sully_4` - ...
    When running `Sully` in a otherwise empty directory, it should result in 13 files:
-   `Sully`
-   `Sully_X.c` for `X` in `[0, 5]`
-   `Sully_X` for `X` in `[0, 5]`

# My approach on the matter

For each of the three programs, I will use the same approach: I will create a string that contains the source code "banalized" (special characters replaced by a custom escape) and the string itself represented by a '?'.
The I will iterate over the string and replace the escape by the corresponding character in the source code.
Finally, I will print the string or write it to a file. For `Sully`, I will also compile and run the resulting file.

## Escape characters

-   'Q' represents the single quote character (')
-   'D' represents the double quote character (")
-   'S' represents the slash character (/)
-   'B' represents the backslash character (\\)
-   'N' represents the newline character (\n)
-   'T' represents the tab character (\t)
-   '?' represents the whole string
