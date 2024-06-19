<!-- RATING: Medium -->
<!-- NAME: Urinal Selection Algorithm (not done) -->
The Urinal Selection Algorithm
~~~~~~~~~~~~

When a Guy enters a public restroom, he is presented with some number of
urinals (between 1 and 255 inclusive) all in a row.  Some of them may be
occupied.  There is a strict, universally agreed upon but never spoken
of algorithm that every Guy uses to select a urinal to conduct his
business.

Write a program that takes as input:
- First line: The number of urinals: u
- Next u lines: Either "occupied" or "available" for the n'th urinal.

And produced as output:
- If a urinal is available, print the urinal number (starting at 1) to use.
- If no urinal is available, print "wait"
- If the urinal selection rules are broken by the current occupants,
  prepend "awkward, " to your output.

Rules:
Guys: We know you already know this, but for the women competing, we'll
document the selection criteria.

- Never use an occupied urinal.
- If possible not to, do not select a urinal immediately adjacent to
  another occupant.
- Choose lower numbered urinals (closer to the door) first.
- [Mark's note: It's late, and I'm having a hard time thinking of other
  rules to put here.  Funny ones are good, arbitrary rules that sound
  ridiculous but are true are even better.]

This is the kind of problem that could pretty easily be expanded to make
more difficult.  For example, add whether a urinal is particularly dirty
or not as input, and add a selection criteria based on avoiding them.

Historically, we've written two or three versions of a given problem, of
different complexities, by doing this sort of thing, so that we could
gauge how the groups are doing and present harder or easier problems as
appropriate.  I think this could be a good problem for that.

-Mark


need something from here:
http://blog.xkcd.com/2009/09/02/urinal-protocol-vulnerability/
- krux
