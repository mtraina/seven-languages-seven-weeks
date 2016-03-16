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

<h4>Atoms, lists and tuples</h4>
Atoms are arbitrary names that can be used to represent real world things.
```erlang
red.
Pill = blue.
```
<h4>Lists and Tuples</h4>
Lists are heterogeneous and can have any length whilst Tuples have fixed length.
```erlang
% list
l = [1, 2, 3]

% tuple
