# FOCS Day 11 In Class

## I. Truth Tables

### 1. AND

Fill in the truth table for _a AND b_

_a_ | _b_ | _a_ AND _b_
----|-----|---
 F  |  F  | F
 F  |  T  | F
 T  |  F  | F
 T  |  T  | T

This truth table is written with the rows in *canonical order*.  Do you know why this order is canonical (i.e. standard)?  [Hint:  If you represent `false` as 0 and `true` as 1, in what order are these rows?]

binary counting up



### 2. Lots of NOTs

Now complete the truth table for _NOT ((NOT a) AND (NOT b))_

_a_ | _b_ | _NOT a_ | _NOT b_ | _(NOT a) AND (NOT b)_ | _NOT ((NOT a) AND (NOT b))_
----|-----|------|------|------|----
 F  |  F  |  T   |  T   |  T   | F    
 F  |  T  |  T   |  F   |  F   | T    
 T  |  F  |  F   |  T   |  F   | T    
 T  |  T  |  T   |  F   |  F   | T    

Do you recognize this function by another name?

OR



### 3. Not here or there

Build the truth table for _(NOT a) OR b_.  [_OR_ is true if *at least*` one of its arguments is true.]

_a_ | _b_ | _NOT a_ | _(NOT a) OR b_ 
----|-----|-----|---
 F  |  F  |  T  | T 
 F  |  T  |  T  | T 
 T  |  F  |  F  | F 
 T  |  T  |  T  | T 



### 4. Six of one, half a dozen of the other

Finally, build a truth table for _(a AND (NOT b)) OR (b AND (NOT a))_

_a_ | _b_ | _NOT a_ | _NOT b_ | _a AND (NOT b)_ | _b AND (NOT a)_ | _(a AND (NOT b)) OR (b AND (NOT a))_
----|-----|-----|-----|-----|-----|---
 F  |  F  |  T  |  T  |  F  |  F  | F   
 F  |  T  |  T  |  F  |  F  |  T  | T   
 T  |  F  |  F  |  T  |  T  |  F  | T   
 T  |  T  |  F  |  F  |  F  |  F  | F   

Can you write another expression with the same truth values as _(a AND (NOT b)) OR (b AND (NOT a))_?  (Can you write more than one?)

XOR


## II. Knights and Knaves 

Knights always tell the truth; knaves always lie.  Everyone on a particular island is either a knight or a knave.

These problems are adapted from that most Normal of Sorcerers, Raymond Smullyan, *What is the Name of this Book?*, Chapter 3.

### 1. An old problem

A stranger on the island encounters three inhabitants -- A, B, and C -- and asks A, "Are you a knight or a knave?"  A's answer is not intelligible.  The stranger asks B, "What did A say?"  B answers, "A said that he is a knave."  C interrupts, saying "Don't believe B; he is lying."

What are B and C?

If A was a knave, he would not say that he is a knave. If A is a knight, he would not say that he is a knave. Thus B is a knave and C is a knight because he correctly said that B was a lier.

### 2. Smullyan's improvement

In the previous problem, Smullyan notes that C is irrelevant.  His proposed revision:
A's answer is still intelligible.  B says "A says there is one knight among us."  C interrupts, saying "Don't believe B; he is lying."

Now what are B and C?

If B is a knight, then A must also be a knight for saying there is one knight among them but then there would be 2 knights and thus contradiction.

If B is a knave, then C is a knight, and A could have said anything really. There is no contradiction here thus B ust be a knave and C must be a knight.

### 3. At least one...

Suppose there are two inhabitants, A and B.  A says "At least one of us is a knave."  What are A and B?  

If A is a knave, then they must both be knights but this is a cocntradiction with the statement of A.
If A is a knight, then B must be a knave.

A must be a knight and B must be a knave.

### 4. Or else...

Suppose A says instead, "Either I am a knave or B is a knight."  Now what are A and B?

If A is a knight, then B must also be a knight.

If A is a knave, then he must not be a knave and thus contradiction occurs.

A and B must be knights. 

### 5. Knight after knight

Three inhabitants are present.  A says, "All of us are knights."  B says, "Exactly one of us is a knight."  What are A, B, and C?

If A is a knight, then that would make B a liar, so A must be a knave.
If B is a knight, then C must also be a liar.
Thus A is a knave, B is a knight, and C is a knave.

### 6. Knight's end

Suppose instead, A says, "All of us are knaves" and B says, "Exactly one of us is a knight."  Can you tell what B is?  What C is?

B is a knight, A and C are knaves.

### 7. Not me!

If A says, "I am a knave, but B isn't", what are A and B?

A and B are knaves.

### 8. Same as another

A says, "B is a knave."  B says, "A and C are of the same type."  What is C?

C is a knave.

### 9. Mind reading

A says, "B and C are of the same type."  If someone asks C, "Are A and B of the same type?" what does C answer?

1 = knight
0 = knave
4 possibilities
100
111
010
001

Yes.

### 10. Smullyan's adventure

Once when Smullyan was on the island, he encountered two inhabitants.  He asked one, "Is either of you a knight?"  When the inhabitant responded, Smullyan knew the answer to his question.  What is each of the two inhabitants?  Smullyan promises there's plenty of information here to solve the problem.

If he asks a knight, the knight will tell him.
If he asks a knave, the knave will tell him a lie.

10 -> yes
11 -> yes
01 -> no 
00 -> yes

If the inhabitant says "no", then he is a knave and his companion is a knight. If the inhabitant says "yes" then who knows.


## III. Proofs

### 1. Use truth tables to prove De Morgan's Laws

!(A || B) = !A && !B

 a | b | !(A || B) | !A && !B
---|---|-----------|---------
 F | F | T         | T
 F | T | F         | F
 T | F | F         | F
 T | T | F         | F

since the truth tables are the same, they are equivalent

!(A && B) = !A || !B

 a | b | !(A && B) | !A || !B
---|---|-----------|---------
 F | F | T         | T
 F | T | T         | T
 T | F | T         | T
 T | T | F         | F

since the truth tables are the same, they are equivalent

### 2. Use rules of inference to prove the following:

Assume:  
!p -> q && r
p -> s
!s

Prove: q

1. Modus Tollens
   p -> s 
   !s
   !p

2. Specialization
   !p -> q && r
   q && r
   q

### 3. Use rules of inference to prove the following:

Assume:  
p && q
p -> !(q && r)
s -> r

Prove: !s

1.  Specialization
	p && q
	q
	p

2.  Contradiction Rule
	!(q && r)
	!r

3.  Modus Tollens
	s -> r
	!r
	!s

### 4. Use rules of inference to prove the following:

Assume:  
(!(p || q)) -> r
!p
!r

Prove:  q

1.  Elimination
	!(p || q) -> r
	!p
	!q -> r

2.  Modus Tollens
	!q -> r
	!r
	q

### 5. Replicate any of the proofs in 2, 3, or 4 using truth tables.
