<h3>Concurrency</h3>
Erlang makes a (generally) difficult thing like concurrency easier, due to its approach to light weight processes instead of threads with shared memory.

<h4>Asynchronous receive loop</h4>
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

<h4>Synchronous receive loop</h4>
This version of the translation service is synchronous, so it is now returning a value to the sender that is waiting for an answer. To do so we need to receive either the PID of the sender and the message.
```erlang
% compile
c(translate_service).

% start the translator service
Translator = spawn(fun translate_service:loop/0).

% send the message
translate_service:translate(Translator, "blanca").
```

<h4>Linking processes for reliability</h4>
Erlang provides a way to enforce reliability linking processes together: when one of the processes dies, it sends a signal to its twin that will react accordingly.

<h5>Spawning a linked process</h5>
The following application is a kind of Russian roulette: if the number passed id 3, the process dies.
```erlang
% compile
c(roulette).

% start the process
Gun = spawn(fun roulette:loop/0).

% send messages
Gun ! 1.  % click
Gun ! 3.  % bang
Gun ! 4.  % nothing, the process is dead
```

We can check if the process is alive with this command:
```erlang
erlang:is_process_alive(Gun).
```

<h6>Monitor a process</h6>
We now create a monitor to check if a process died. The file <b>coroner.erl</b> contains the code for it.

```erlang
% compile
c(roulette).
c(coroner).

% start roulette and coroner
Roulette = spawn(fun roulette:loop/0).
Coroner = spawn(fun coroner:loop/0).
```
Now we send a message to the coroner, saying which process PID to monitor. The word monitor is in the case of the parameter just an atom.
```erlang
% send a message to the coroner
Coroner ! {monitor, Roulette}.
```
It's time to send the messages to roulette and after its death, the coroner will react and print a log related to it.
```erlang
Roulette ! 1. % click
Roulette ! 3. % bang
% The shooter <0.45.0> died with reason {roulette,die,at,{14,7,51}}. Start another one.
```
