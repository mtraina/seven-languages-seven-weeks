<h1>Collections</h1>

<h3>Lists</h3>
Lists are an ordered collection.
```scala
// list construction
scala> List("alpha", "beta", "gamma")
res2: List[String] = List(alpha, beta, gamma)

// list equality
scala> List(1, 2, 3) == List(3, 2, 1)
res1: Boolean = false
```

Nil is an empty list.
```scala
scala> Nil
res0: scala.collection.immutable.Nil.type = List()
```

<h3>Sets</h3>
Sets are unordered collections that doesn't contain repeated elements.
```scala
// set construction
scala> val animals = Set("lions", "tigers", "bears")
animals: scala.collection.immutable.Set[String] = Set(lions, tigers, bears)

// sets equality
scala> Set(1, 2, 3) == Set(3, 2, 1)
res0: Boolean = true
```
<h4>Operations on sets</h4>
All the following operation are non destructive, so they'll everytime create a new set.
```scala
// addition
scala> animals + "armadillos"
res5: scala.collection.immutable.Set[String] = Set(lions, tigers, bears, armadillos)

// subtraction
scala> animals - "tigers"
res4: scala.collection.immutable.Set[String] = Set(lions, bears)

// sets concatenation
scala> animals ++ Set("armadillos", "raccoons")
res7: scala.collection.immutable.Set[String] = Set(bears, tigers, lions, armadillos, raccoons)

// sets subtraction
scala> animals -- Set("lions", "bears")
res8: scala.collection.immutable.Set[String] = Set(tigers)

// sets intersection
scala> animals & Set("armadillos", "raccoons", "lions", "tigers")
res1: scala.collection.immutable.Set[String] = Set(lions, tigers)
```

<h3>Maps</h3>
Maps are key-value pairs.
```scala
// map constrution
scala> val ordinals = Map(0 -> "zero", 1 -> "one", 2 -> "two")
ordinals: scala.collection.immutable.Map[Int,String] = Map(0 -> zero, 1 -> one, 2 -> two)
```
