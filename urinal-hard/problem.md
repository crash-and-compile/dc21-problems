<!-- RATING: HARD -->
<!-- NAME: URINAL HARD -->
The Urinal Selection Algorithm

When a Guy enters a public restroom, he is presented with some number of
urinals (between 1 and 255 inclusive) all in a row.  Some of them may be
occupied.  There is a strict, universally agreed upon but never spoken
of algorithm that every Guy uses to select a urinal to conduct his
business.

Write a program that takes as input:
A list of urinals and stalls numbered 1 to n or a letter for stalls , indicated as either OCCUPIED or OPEN

And produces as output:
The number of the urinal or the letter of the stall  to use, or the word WAIT.

Rules:
Guys: We know you already know this, but for the women competing, we'll
document the selection criteria (IN ORDER OF IMPORTANCE).

- Never use an occupied urinal.
- Urinals are preferred over stalls. Those things can be nasty.
- Never select a urinal immediately adjacent to another occupant.
- It's better to have a free urinal on one side than to have neighbors on BOTH sides.
- Choose lower numbered urinals (closer to the door) first.
- The first or last stall is always preferred, because there is a wall.
- The lowest letter stall is always preferred if there is a choice.
- Stalls are only used if chosing a urinal would violate the rules. 
- A free stall is preferred to an awkward urinal.
- Absolutely NO talking


#SAMPLE INPUT
1 OCCUPIED
2 OPEN
3 OCCUPIED
4 OPEN
5 OCCUPIED
A OPEN
B OPEN
C OCCUPIED

#SAMPLE OUTPUT
A
