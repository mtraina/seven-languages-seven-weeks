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
In <b>list_math.pl</b> we define two rules for count:
```prolog
count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.
```
If we execute
```prolog
count(What, [1]).
```
The unification happens for the second rule binding What to Count, 1 to Head and [] to Tail.<br>After unification execute
```prolog
count(TailCount, [])
```
And we bind it to the first rule, so we have 0.<br/>
As last thing we evaluate Count is TailCount + 1 = 0 + 1 = 1
