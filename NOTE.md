# Sully interpretation ('cause the subject is so not clear)

````
../Sully.c
│ ```
│ int i = 5;
│ ```
└ Compiles into ./Sully                                                     [ 1]
  ├ Creates ./Sully_5.c                                                     [ 2]
  │ ```
  │ int i = 5;
  │ ```
  └ Compiles and execute ./Sully_5                                          [ 3]
	├ Creates ./Sully_4.c                                                   [ 4]
	│ ```
	│ int i = 4;
	│ ```
	└ Compiles and execute ./Sully_4                                        [ 5]
		├ Creates ./Sully_3.c                                               [ 6]
		│ ```
		│ int i = 3;
		│ ```
		└ Compiles and execute ./Sully_3                                    [ 7]
			├ Creates ./Sully_2.c                                           [ 8]
			│ ```
			│ int i = 2;
			│ ```
			└ Compiles and execute ./Sully_2                                [ 9]
				├ Creates ./Sully_1.c                                       [10]
				│ ```
				│ int i = 1;
				│ ```
				└ Compiles and execute ./Sully_1                            [11]
					├ Creates ./Sully_0.c                                   [12]
					│ ```
					│ int i = 0;
					│ ```
					└ Compiles ./Sully_0                                    [13]
````
