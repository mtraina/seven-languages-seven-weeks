<h1>Recursion</h1>

```prolog
['family.pl'].                        % Load family.pl.
ancestor(john_boy_sr, john_boy_jr).     
ancestor(zeb, john_boy_jr).             
```
The first rule says that X is ancestor of Y if it's his father.  
The second rule says that X is ancestor of Y if Z is father of X and Y is ancestor of Z.

<h3>Lists and tuples</h3>
* Lists are containers of variable length, i.e. [1, 2, 3].
* Tuples are container of fixed length, i.e. (1, 2, 3).

<h4>Unification</h4>
```prolog
[1, 2, 3] = [X, Y, Z]. % Prolog can unify the variables name and the values
[2, 2, 3] = [X, X, Z].
[1, 2, 3] = [X, X, Z]. % not in this case
```

With lists (not tuples) is possible to unify as head-tail where head is the first element of the list and tail is the rest.
```prolog
[a, b, c] = [Head|Tail].                % Head = a Tail = [b,c]
[a, b, c, d, e] = [_, _|[Head|_]].      % Head = c
```

<h4>Lists and math</h4>
In <b>list_math.pl</b> we define two rules for sum:
```prolog
sum(0, []).
sum(Total, [Head|Tail]) :- sum(Sum, Tail), Total is Head + Sum.
```
* The first rule is saying that the sum is 0 for an empty list.
* The second rule is saying if the

For count(What, [1]).
