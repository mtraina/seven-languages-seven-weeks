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
