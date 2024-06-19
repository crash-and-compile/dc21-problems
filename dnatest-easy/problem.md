<!-- RATING: EASY -->
<!-- NAME: DNA TEST EASY -->
##DNA Test

A string of DNA contains Adenine, Thymine, Guanine and Cytosine nucleotides. Guanine is always paired with Cytosine, and Adenine is always paired with Thymine.

GC
AT

#INPUT
Each input will contain a double helix representation of a DNA strand. 
One side of the DNA will contain capital letters A,T,G, and C representing the nucleotides, while the other side will have lowercase letters. Nucleotide sequences will be connected with the - characters. Space characters are included for display, but can be ignored. 

Given a DNA strand, you must determine whether it contains any pairs that should not be together. For example, T--g should not exist.

#The Output
Print OK if everything matches up.
Pring NOT OK if there are any mismatches.


## Sample Input 1


     t------A
      g----C
       t--A
        gC
        Gc
       G--c
      C----g
     G------c
     C------g
      T----a
       A--t
        Gc
        tA
       t--A
      t----A


## Sample Output 1
	OK

## Sample Input 2


     t------A
      g----C
       t--A
        gC
        Gc
       G--g
      C----g
     G------c
     C------g
      T----a
       A--t
        Gc
        tA
       t--G
      t----A


## Sample Output 2
	NOT OK
