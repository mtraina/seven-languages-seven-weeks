## Loops
```io
loop("getting hungry..." println)             // infinite loop

i =: 1
while(i <= 11, i println; i = i + 1); "This goes up until 11" println
for(i, 1, 11, i println); "This one goes up to 11" println
for(i, 1, 11, 2, i println); "This one goes up to 11" println
```

### Conditionals
```io
if(true, "It is true.", "It is false.")
if(false) then("It is true." println) else("It is false." println)
```

### Operators
```io
OperatorTable                                     // prints all the operators
OperatorTable addOperator("xor", 11)              // add the operator "xor" to the table
true xor := method(bool, if(bool, false, true))   // implementation of the true condition of xor
false xor := method(bool, if(bool, true, false))  // implementation of the false condition of xor
true xor true                                     // test of the conditions
true xor false
```

### Messages
A message has three components: the sender, the target and the arguments:
the target executes the message sent from the sender

The call method gives you access to the meta information about any message

```io
postOffice := Object clone                        // creates the target
postOffice packageSender := method(call sender)
mailer := Object clone                            // creates the sender
mailer deliver := method(postOffice packageSender)

unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2)))
)
unless(1 == 2, write("One is not two\n"), write("one is two\n"))
```
