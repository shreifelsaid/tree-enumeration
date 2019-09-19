This is an attempt to write a program that enumerates all binary trees of n nodes in multiple programming languages.



Directories : 

Inside the directory A1 there are 7 directories, each named with the name of a programming language we used to solve the problem.

Running instructions :
	before running the instructions for any language, please make sure you're in the directory of that language 
	
	c++ :

		compile : g++ -std=c++11 assign0.cpp -o assign0
		run : ./assign0
		please note that since the program uses some features exclusive to c++11 it has to be compiled using the above flags

	python :
		to run : python3 ./a1.py
		please note that since the program uses some features exclusive to python3 it has to be compiled with python3


	ada : 
		compile : gnatmake main.adb
		to run : ./main

	go : 
		compile : go build a1.go
		to run : ./a1

	Java :
		compile : javac TreeEnum.java
		to run : java TreeEnum

	Haskell :
		compile : ghc -o A1 A1.hs
		to run : ./A1

	Prolog :
		to interpret : swipl A1.pl
		to run type the following expression, replacing n with the number of nodes : treeVal(n,L).
 
		


