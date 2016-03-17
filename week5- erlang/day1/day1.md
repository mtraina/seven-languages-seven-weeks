<h1>Erlang</h1>
Erlang has been made for extreme reliability and concurrency. It doesn't use a threading approach, it relies instead on lightweight process, so no shared resources are involved.

<h4>Reliability</h4>
Erlang has minimal error handling, using an approach of let crash the application, making easy to monitor, kill and restart processes.<br>
Another important feature is that the language allows hot-swap of the code, so replacing part of the application without restarting it.

<h3>Variables</h3>
Variables in Erlang are immutable. Their names must start with an uppercase or and underscore.
```erlang
Var = 1.
Var = 2.
** exception error: no match of right hand side value 2
```

<h3>Atoms, lists and tuples</h3>
Atoms are arbitrary names that can be used to represent real world things.
```erlang
red.
Pill = blue.
```
<h3>Lists and Tuples</h3>
Lists are heterogeneous and can have any length whilst Tuples have fixed length.
```erlang
% list
L = [1, 2, 3]

% tuple
T = {1, 2, 3}
```

<h3>Pattern matching</h3>
Pattern matching in Erlang works in a similar way of Scala, matching a single value and not all the combinations like in Prolog.
```erlang
Person = {person, {name, "Agent Smith"}, {profession, "Killing programs"}}.

% assign name to the variable Name and profession to the variable Profession
{person, {name, Name}, {profession, Profession}} = Person.

Name. % "Agent Smith"
```
<h4>List pattern matching</h4>
It is similar to Prolog.
```erlang
[Head | Tail] = [1, 2, 3].
Head. % 1
Tail. % [2, 3]
```
