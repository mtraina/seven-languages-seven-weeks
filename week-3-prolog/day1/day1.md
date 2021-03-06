# Prolog
Prolog is a declarative logical language.

Like SQL, Prolog has two parts: one to express the data and one to query the data.
In Prolog, the data is in the form of logical rules.
These are the building blocks:
- Facts. A fact is a basic assertion about some world. (Babe is a pig; pigs like mud.)
- Rules. A rule is an inference about the facts in that world. (An animal likes mud if it is a pig.)
- Query. A query is a question about that world. (Does Babe like mud?)

### Friend rule
```prolog
friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

:-            // subgoal
\+            // logical negation
\+(X = Y)     // X and Y must be different
likes(X, Z)   // the first subject likes something
likes(Y, Z)   // the second subject likes the same thing

So the rule says that two subjects are friends if are not the same subject and
they have an interest in common
```

### Food rule
```prolog
food_type(What, meat).    // we are asking Prolog to give us the values that satisfy the assertion
```

### Map rule
We have 5 states of the USA that are in the same geographic area.
We have three colors (red, green, blue) and we want to color the state that are neighbors with different colors.

We set the different colors Prolog should use and tell it which state neighbor the other.

Prolog is not about writing algorithms to solve logical problems.
Prolog is about describing your world as it is and presenting logical problems that your computer can try to solve.

## Unification
The meaning of unification is to find the values that make both sides match.

```prolog
cat(lion).                                            // fact: a lion is a cat
cat(tiger).                                           // fact: a tiger is a cat

dorothy(X, Y, Z) :- X = lion, Y = tiger, Z = bear.    // rule: bind X, Y, Z to lion, tiger and bear respectively
twin_cats(X, Y) :- cat(X), cat(Y).                    // rule: twin cats are both cats

twin_cats(X, Z).                                      // Prolog tries to match the value that make the rule true
                                                      // i.e.: X = lion, Y = lion; X = lion, Z = tiger
```
