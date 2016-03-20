<h3>Concurrency</h3>
Erlang makes a (generally) difficult thing like concurrency easier, due to its approach to light weight processes instead of threads with shared memory.

<h4>Basic receive loop</h4>
This example is related to a process that translates a couple of words from Spanish to English.<br>
Spawn let us start he process and receive its process identifier (PID).<br>
We can the send messages with <b>!</b> and receive them with <b>receive</b>.

```erlang
% compile
c(translate).

% spawn the process
Pid = spawn(fun translate:loop/0).

% send the messages
Pid ! "casa". % house "casa"
Pid ! "loco". % I don't understand. "loco"
```
