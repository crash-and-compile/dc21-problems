<!-- RATING: MEDIUM -->
<!-- NAME: DNA TEST MEDIUM -->
##DNA Test

A string of DNA contains Adenine, Thymine, Guanine and Cytosine nucleotides. Guanine is always paired with Cytosine, and Adenine is always paired with Thymine.
Sets of nucleotides are used to ultimately build proteins and other building blocks for life, but sometimes things get messed up. The DNA strand can be damaged, and result in dangerous proteins being created.

We have identified a string of nucleotides that results in a condition called "Chronic Asshat Syndrome", and all other detection methods have failed. It is up to you to write a program to analyze DNA strands to determine if the sequence is present.

The identified sequece for CAS is "TAG". This means that if the Thymine,Adenine and Guanine nucleotides are detected in sequence in either side of the DNA helix, forwards or backwards, the person is an asshat. 


#INPUT
Each input will contain a double helix representation of a DNA strand. 
One side of the DNA will contain capital letters A,T,G, and C representing the nucleotides, while the other side will have lowercase letters. Nucleotide sequences will be connected with the - characters. Space characters are included for display, but can be ignored. 

The TAG sequence can be on either side of the helix, and can be read forwards or backwards. 

#The Output
Print out whether the DNA represents a CAS carrier by printing either:
THIS PERSON IS AN ASSHAT!
or
THIS PERSON IS NOT AN ASSHAT!


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
     c------G
     g------C
      c----G
       t--A
        aT
        At
       G--c
      G----c
     A------t
     T------a
      T----a
       C--g
        Gc
        tA
       g--C
      a----T
     c------G
     t------A
      c----G
       g--C
        aT
        Cg
       A--t
      C----g
     A------t
     T------a
      A----t
       T--a
        Gc
        gC
       t--A
      a----T
     a------T
     a------T
      t----A
       c--G
        gC
        Gc
       A--t
      G----c
     G------c
     C------g
      C----g
       G--c
        Ta
        cG
       g--C
      c----G
     g------C
     c------G
      g----C
       a--T
        cG
        Cg
       C--g
      A----t
     A------t
     T------a
      T----a
       T--a
        Cg
        tA
       g--C
      c----G
     g------C
     t------A
      c----G
       g--C
        tA
        Cg
       A--t
      C----g
     G------c
     A------t
      A----t
       A--t
        Ta
        tA
       g--C
      c----G
     a------T
     t------A
      t----A
       c--G
        cG


## Sample Output 1
	THIS PERSON IS AN ASSHAT!
