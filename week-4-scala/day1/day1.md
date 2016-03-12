<h1>Scala</h1>
Scala is a language that unifies the object oriented paradigm and the functional one. It is between Java and a functional language like Haskell. It runs on the JVM and it has several similarities with Java.

<h3>Differences with Java</h3>
The main difference with Java are the following:
* Type inference
* Functional concepts
* Immutable variables
* Advanced programming constructs (actors, collections with higher-order functions, first-class XML processing)

<h3>Functional languages</h3>
Characteristics of a functional language are:
* functional programs are made by functions
* a function always returns a value
* a function will return <u>always</u> the same output, given the same input
* functional programs avoid changing state or mutating data

<h3>Types</h3>
Nil is an empty list.
```scala
scala> Nil
res0: scala.collection.immutable.Nil.type = List()
```

<h3>Strong, weak, static and dynamic typing</h3>
* A language is <b>strong typed</b> when it can detect when two types are compatible (e.g. Java, Ruby).
```ruby
x = "1"
y = 2 + x # error!
```
* It is <b>weak typed</b> when the compiler doesn't necessarily care about the type of the data in a memory location (i.e. integer, string). Examples of this kind of languages are Assembly or C.
* A language is <b>static typed</b> when you (have to) define it's explicitly, e.g. in Java.
```java
int x = 1;
x = "2"; // error!
```
* It is <b>dynamically typed</b> when you can change the type of the variable, like in Ruby.
```ruby
x = 1
x = "2" # no error
```

<h3>Loops</h3>
The while loop is similar to the Java one.  
The for loop can follow either a Java style (with small changes) or a Ruby one, passing a lambda to the foreach method.
```scala
// Java style iteration
def forLoop {
    for(i <- 0 until args.length) {
        println(args(i))
    }
}
// Ruby style iteration
def forLoop {
    args.foreach { arg =>
      println(arg)
    }
}
```
<h3>Ranges</h3>
Scala supports first-class ranges
```scala
scala> val range = 0 until 10
range: scala.collection.immutable.Range = Range(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
```

<h3>Tuples</h3>
A tuple is a fixed-length set of objects where those object can be of different type.
```scala
scala> val person = ("Elvis", "Presley")
person: (String, String) = (Elvis,Presley)

scala> person._1
res0: String = Elvis
```

<h3>Classes</h3>
<b>Compass.scala</b> is an example of simple class with default constructor and few methods, just run it with the following command
```bash
scala compass.scala
```
