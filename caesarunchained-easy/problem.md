<!-- RATING: EASY -->
<!-- NAME: CAESAR UNCHAINED EASY -->
##Caesar Unchained

A Caesar Cipher is a subset of Rot-X ciphers, where every character is replaced with 3 characters up in the alphabet, wrapping around if necessary.
For example, A would be replace with D, B would be replaced with E, Y would be replaced with B, and Z would be replaced with C.
We assign each letter in the alphabet a number as follows:

	A -> 1
	B -> 2
	.
	.
	.
	Y -> 25
	Z -> 26 


Example: We encrypt the word TEST.

	Step 1:  T -> W 
	Step 2:  E -> H
	Step 3:  S -> V
	Step 4:  T -> W


##INPUT
Each file will contain 1 or more input lines containing a string of uppercase letters, spaces, and punctuation representing a ciphertext generated by the Chained Caesar Cipher algorithm.
ONLY letters are affected by the encryption, you should skip punctuation and spaces and print them out as is.  

	A -> 1, Z-> 26

Assume that the string starts in column 1 and will not exceed column 40,

##The Output
Print out the decrypted message

## Sample Input

	TEST. TEST.
	TEST.

## Sample Output

	WHVW. WHVW.
	WHVW.
