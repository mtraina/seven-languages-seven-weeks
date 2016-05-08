## Concurrency
### Coroutines
They provides a way to suspend an resume the execution of a process

```io
@   // returns a future
@@  // starts the message in its own thread
```

### Actors
An actor change its own state and accesses other actors only through controlled queues.
Threads can change each other's state without restrictions.

```io
slower := Object clone
faster := Object clone
slower start := method(wait(2); writeln("slowly"))
faster start := method(wait(1); writeln("quickly"))
slower start; faster start                          // runs the two operations in the same thread, sequencially

slower @@start; faster @@start; wait(3)             // run the two operation in two different threads and wait for the results
```

### Futures
A future is a result object that is immediately returned from an asyncronous message call.
The future become the result once the the result is available.
If you ask for the value of a future before it is available

```io
futureResult := URL with("http://google.com/") @fetch

writeln("Do something immediately while fetch goes on in background...")
// ...

writeln("This will block until the result is available.")
// this line will execute immediately

writeln("fetched ", futureResult size, " bytes")
// this will block until the computation is complete
// and Io prints the value
```
