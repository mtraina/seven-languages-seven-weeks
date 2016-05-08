# Io
Io is an imperative prototyped language.

## Basic commands
### Print
```io
"Hi ho, Io" print         // receivers on the left and messages on the right
```
### Objects
```io
Vehicle := Object clone   // vehicle is not a class, it's an object based on the object prototype
Vehicle description := "Something to take you places" // creates a slot called description
Vehicle nonExistingSlot = "This won't work"           // = is an assignment
Vehicle slotNames         // print the name of the slots
Vehicle type
Object type               // they are actually two different types
```

### Inheritance
```io
Car := Vehicle
Car slotNames
Car description

ferrari := Car clone      // types begins in uppercase in Io
ferrari slotNames         // clones of a type starting with lowercase will invoke their parents' type slot
ferrari type              // ferrari and Car are both objects and are actually identical
```

### Methods
```io
method("So, you've come for an argument." println)
Car drive := method("Vroom" println)
ferrari drive             // if a slot has a method, invoking the slot invokes the method


ferrari getSlot("drive")  // you can retrieve the content of the slot
ferrari getSlot("type")   // you get the content of the parent slot if not existing in the child
ferrari proto             // get the prototype of an object
Car proto

Lobby                     // master namespace that returns all the objects
```

## Prototype programming notes
The prototype programming paradigm seems clear enough. These are the basic ground rules:
- Every thing is an object.
- Every interaction with an object is a message.
- You don’t instantiate classes; you clone other objects called proto- types.
- Objects remember their prototypes.
- Objects have slots.
- Slots contain objects, including method objects.
- A message returns the value in a slot or invokes the method in a slot.
- If an object can’t respond to a message, it sends that message to its prototype.

### Lists
```io
toDos := list("alpha", "beta")  // creates the list
toDos size
list(1,2,3,4)                   // shortcut for creating a list
list(1,2,3,4) average
list(1,2,3,4) sum
list(1,2,3,4) at(1)
list(1,2,3,4) append(5)
list(1,2,3,4) pop
list(1,2,3,4) prepend(0)
list() isEmpty
```

### Maps
```io
elvis := Map clone
elvis atPut("home", "Graceland")
elvis at("home")
elvis atPut("style", "rock and roll")
elvis asObject
elvis asList
elvis keys
elvis size
```

### True, false, nil, and singletons
Conditions are like other languages but 0 is true, not false.

```io
true clone        // those values are singletons: cloning them returns the singleton value
false clone
nil clone

Highlander := Object clone        // in this way we define our custom singleton
Highlander clone := Highlander
fred := Highlander clone          // will returns all the time the same object
mike := Highlander clone
fred == mike
```
