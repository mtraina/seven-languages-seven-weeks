<h3>Control structures</h3>
Let's introduce some basic control structures in Erlang.

<h4>Case</h4>
It is possible to use the pattern matching to check a value of a variable and execute code accordingly.
```erlang
Animal = "dog".

case Animal of
  "elephant" -> dumbo;
  _ -> something_else
end.
```
<h4>If</h4>
The if statement uses guards that are conditions that are to be satisfied for a match to succeed.
```erlang
if
  X > 0 -> positive;
  X < 0 -> negative;
  true -> zero
end.
```

<h3>Anonymous functions</h3>
Is is possible to assign functions to variables and pass them around. The keyword <b>fun</b> is used for defining the anonymous function that takes, in this case, one argument.
```erlang
Negate = fun(I) -> -I end.
Negate(1). % -1
```

<h4>Lists and high-order functions</h4>
The module [lists](http://erlang.org/doc/man/lists.html) exposes functions that are useful to manage their content: functions like <b>foreach</b> iterate them whilst other functions, e.g. <b>filter, map</b>, returns other lists starting from the content of the original one.

<h5>Foreach</h5>
Here an example of <b>foreach</b> used for printing a list of numbers.
```erlang
% create a list of numbers
Numbers = [1, 2, 3, 4].

% pass an anonymous function to foreach for printing.
lists:foreach(fun(Number) -> io:format("~p~n", [Number]) end, Numbers).

% same effect with a more readable approach
Print = fun(N) -> io:format("~p~n", [N]) end.
lists:foreach(Print, Numbers).
```

<h5>Map</h5>
The following example uses <b>map</b> for creating a new list starting from one and a function that has to be applied to all the elements of it.
```erlang
lists:map(fun(X) -> X + 1 end, Numbers).
% [2,3,4,5]
```

<h5>Filter</h5>
Filter can be used for eliminate elements from a list that do not satisfy a predicate.
```erlang
% define a predicate
Small = fun(X) -> X < 3 end.

% filter the list of numbers using the predicate
lists:filter(Small, Numbers).
% [1, 2]
```

<h5>Other functions using predicates</h5>
The following are functions that works using predicates to check the list.
```erlang
lists:all(Small, [0, 1, 2]).             % true
lists:any(Small, [0, 1, 2, 3]).          % true
lists:takewhile(Small, [1, 2, 1, 4, 1]). % [1,2,1]
lists:dropwhile(Small, [1, 2, 1, 4, 1]). % [4,1]
```

<h5>Foldl</h5>
Function useful to rolling up the results of a function across a list.
```erlang
Numbers.  % [1,2,3,4]
lists:foldl(fun(X, Sum) -> X + Sum end, 0, Numbers).
```

<h4>List construction</h4>
