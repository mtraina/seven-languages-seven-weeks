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

<h3>Language details</h3>
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
