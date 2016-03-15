<h3>XML</h3>
XML is a first-class programming construct in Scala, in this way is possible to access the elements of the document directly.
```scala
scala> val movies =
  | <movies>
  |     <movie genre="action">Pirates of the Caribbean</movie>
  |     <movie genre="fairytale">Edward Scissorhands</movie>
  | </movies>

movies: scala.xml.Elem =
  <movies>
       <movie genre="action">Pirates of the Caribbean</movie>
       <movie genre="fairytale">Edward Scissorhands</movie>
  </movies>
```

<h4>Pattern matching</h4>
It lets you execute code based on some piece of data.
```scala
def doChore(chore: String): String = chore match {
  case "clean dishes" => "scrub, dry"
  case "cook dinner" => "chop, sizzle"
  case _ => "whine, complain"
}
```

<h5>Guards</h5>
You can add conditions to the pattern matching.
```scala
def factorial(n: Int): Int = n match {
  case 0 => 1
  case x if x > 0 => factorial(n - 1) * n
}
```

<h5>Regular expressions</h5>
Scala has first-class regular expressions.
```scala
val reg = """^(F|f)\w*""".r

println(reg.findFirstIn("Fantastic"))
// Some(Fantastic)

println(reg.findFirstIn("not Fantastic"))
// None
```

<h4>XML with matching</h4>
XML and pattern matching are a powerful combination in Scala because they allow you to go through an XML file and execute code based on the XML elements.

```scala
val movies = <movies>
  <movie>The Incredibles</movie>
  <movie>WALL E</movie>
  <short>Jack Jack Attack</short>
  <short>Geri's Game</short>
</movies>

(movies \ "_").foreach { movie => movie match {
  case <movie>{movieName}</movie> => println(movieName)
  case <short>{shortName}</short> => println(shortName + " (short)") }
}
```

<h3>Concurrency</h3>
The primary constructs for handling concurrency in Scala are actors and message passing.

<h4>Actors</h4>
Actors have pool of threads and queues. When you send a message to an actor, you place an object on its queue. The actor reads the message and take action.

In the file <b>kids.scala</b> we define two singletons (object in Scala) that act as messages.  
The Kid class is an actor so it runs from a pool of threads and get messages in a queue: it will process the each message sequentially.
