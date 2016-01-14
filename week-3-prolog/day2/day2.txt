/* Recursion */

['family.pl'].                          // load family.pl
ancestor(john_boy_sr, john_boy_jr).     // first rule says that X is ancestor of Y if it's his father
ancestor(zeb, john_boy_jr).             // second rule says that X is ancestor of Y if Z is father of X and Y is ancestor of Z

/* Lists and tuples */
Lists are containers of variable length, i.e. [1, 2, 3].
Tuples are container of fixed length, i.e. (1, 2, 3).

Unification
[1, 2, 3] = [X, Y, Z].                  // Prolog can unify the variables name and the values
[2, 2, 3] = [X, X, Z].
[1, 2, 3] = [X, X, Z].                  // not in this case

With lists (not tuples) is possible to unify as head-tail where head is the first element of the list
and tail is the rest.

[a, b, c] = [Head|Tail].                -> Head = a Tail = [b,c]
[a, b, c, d, e] = [_, _|[Head|_]].      -> Head = c

/* Lists and math */
