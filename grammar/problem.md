<!-- RATING: HARD -->
<!-- NAME: Grammar -->
##Grammar

A Context-free Grammar, for this exercise consists of left rules and right rules.
Rather than having multiple instances of the left rules, we concatenate all the
possible right rules for a given left rule with a "|" character.  Terminal characters
are lowercase, and cannot have rules applied to them. Basically, you can replace a
string identified in the left rule with one of the right rules. This is best
illustrated by example.

For example, given the CFG below:

	S -> aB|bB
	B -> bC
	C -> c

and an input string S, we can do the following:

1. Left rule [S -> aB|bB] can be applied to the input string S, and we have two possible right rules aB or bB.
2. We randomly pick which rule to apply, let's say S -> aB. Our string is now aB.
3. Left rule [B -> bC] can be applied to our new string aB, and there is only one possible right rule, bC.
4. We apply B -> bC to our string aB and get the string abC as a result. 
5. Left rule [C -> c] can be applied to our new string abC, and there is only one possible right rule, c.
6. We apply C -> c to our string aB and get the string abc as a result.
7. Our string now contains all terminal characters, so no more rules can be applied.

We can say that our CFG generates the string abc, and abc is in our language.
Please note, this CFG generates two possible strings: abc and bbc.

So, let's do an exercise. Given the following CFG, you must determine whether a string
is in the language generated by the grammar:

	S -> aBa|bBb|cBc|g
	B -> bCb|cCc|dDd|f
	C -> a|b|c
	D -> d|a|e|E
	E -> hacker

## INPUT

Each input file will contain a list of strings made up of lowercase characters. You must
output YES if the CFG can generated that string, otherwise output NO.

## The Output

Print out either YES or NO

## Sample Input:

	abcde
	abcba
	ababa
	adcda

## Sample Output:

	NO
	YES
	YES
	NO
