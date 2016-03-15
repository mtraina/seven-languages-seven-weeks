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
