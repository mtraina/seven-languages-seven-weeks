## Classes and types
The Haskell's typesystem is one of its strongest features, allowing type inference.

### User defined types
The use of the word **data** let us define our own types. For example we can represent a deck of cards defining the suit and the rank with all their possible values. ***Suit*** and ***Rank*** define few values and we describe a ***Card*** as a tuple of ***Rank*** and ***Suit*** and a ***Hand*** as a list of ***Cards***.  
We then create a function that convert the ***Rank*** to a value and we define those values ourselves, e.g, assigning the value 1 to the card ***Ten***.  
The last function is going to translate a ***Card*** to its value.

```haskell
-- define the functions to represent a deck of cards (backwards.hs)
module Main where
  data Suit = Spades | Hearts deriving (Show)
  data Rank = Ten | Jack | Queen | King | Ace deriving (Show)

  type Card = (Rank, Suit)
  type Hand = [Card]

  value :: Rank -> Integer
  value Ten = 1
  value Jack = 2
  value Queen = 3
  value King = 4
  value Ace = 5

  cardValue :: Card -> Integer
  cardValue (rank, suit) = value rank

-- print hearts
Hearts -- Hearts

-- get the value of the card
cardValue(Jack, Hearts) -- 2  
```

Is worth noting that we need to derive the function **show** for printing the data types, otherwise we'll get an error.

```haskell
-- print hearts
Hearts

-- error
<interactive>:163:1:
    No instance for (Show Suit) arising from a use of ‘print’
    In a stmt of an interactive GHCi command: print it
```

### Functions and polymorphism
We can create a function that is polymorphic, meaning that can take any types. In the next snippet we show how to create a function that reverse a list and that can accept any kind of lists, as parameter.

```haskell
-- define the function to reverse a list (backwards.hs)
module Main where
  backwards :: [a] -> [a]
  backwards [] = []
  backwards (h:t) = backwards t ++ [h]

-- executions
backwards [1,2,3] -- [3,2,1]
backwards ["a", "b", "c", "d"] -- ["d","c","b","a"]
```

### Recursive types
We can have types that are recursive, for example the representation of a **tree**. A tree has its values on the leafs: a tree is then made by leafs and list of trees. Let's implement the tree and create few example with it.

```haskell
-- define a type Tree (tree.hs)
module Main where
  data Tree a = Children [Tree a] | Leaf a deriving (Show)

  depth (Leaf _) = 1
  depth (Children c) = 1 + maximum (map depth c)

-- create a tree with one leaf
let leaf = Leaf 1
leaf -- Leaf 1

-- get the value via pattern matching
let (Leaf value) = leaf
leaf -- 1

-- create a tree made by few lists of tree
let tree = Children[Leaf 2, Children[Leaf 3, Leaf 4]]
tree -- Children [Leaf 2,Children [Leaf 3,Leaf 4]]

-- match tree as a children
let (Children ch) = tree

-- match a children as a list with head and tail
let (fst:tail) = ch

-- print the head
fst -- Leaf 2

-- print the tail
tail -- [Children[Leaf 3, Leaf 4]]
```

The function **depth** is useful for calculating the depth of the tree. The first definition is trivial: a tree with only a leaf has depth equals to one. The second definition is less obvious, the computation will be one plus the maximum depth of all the lists contained in the children.

```haskell
-- depth of leaf
depth leaf -- 1

-- depth of tree
depth tree -- 3

-- definition of a tall tree and depth of it
let tallTree = Children[Leaf 2, Children[Leaf 3, Leaf 4, Children[Leaf 5], Leaf 6]]
depth tallTree -- 4
```

### Classes
Classes in Haskell have a different meaning than in an Object-Oriented language. In this case they serve the purpose of defining which operation can work with which input, i.e. you can sum integers but not booleans. A **class** provides some functions signatures and a **type** is an instance of a class if it supports all of them. Classes do support inheritance.  
As an example, a type is an instance of the class **Eq** if it supports the functions that **Eq** provides. Here a definition of the class **Eq**.

```haskell
class Eq a where
  (==), (/=) :: a -> a -> Bool

    -- Minimal complete definition
    -- (==) or (/=)
  x /= y    = not(x == y)
  x == y    = not(x /= y)
```

## Monads
Monads lets us compose functions in ways that they have specific properties.

### The drunken pirate example
A pirate is drunk and is making a treasure map. To get to the treasure he is moving with a series of staggers and crawls. We can describe this situation in an imperative and in a functional language and compare the two solutions.

#### Imperative solution
With an imperative language we can model the solution as a sequence of statements. Quite readable but the drawback is that we are mutating the variable **v**.

```ruby
def trasure_map(v)
  v = stagger(v)
  v = stagger(v)
  v = crawl(v)
  return v
end
```

#### Functional solution
We can code the solution in a functional way as shown below: the state of the variable stay immutable but it's hard to read because the sequence of the commands is inverted. We can then use **let** to chain the functions in the expected order, but it is still not nice to read.

```haskell
-- functional approach (drunken_pirate.hs)
module Main where
    stagger :: (Num t) => t -> t
    stagger d = d + 2
    crawl d = d + 1

    -- function executions: inverted order!
    treasureMap d =
        crawl (
        stagger (
        stagger d))

    -- using let we can specify the functions in the right order
    letTreasureMap (v, d) = let d1 = stagger d
                                d2 = stagger d1
                                d3 = crawl d2
                            in d3
```

We are applying three functions in sequence that basically have the same inputs and outputs, so it would be good to chain the functions together in a nice way like the following.

```haskell
stagger(crawl(x)) into stagger(x) · crawl(x)
```

### Components of a monad
A monad has three basic things:
* A type constructor that is based on some type of container, e.g. a variable, a list, anything that can hold a value. We use the container to hold a function.
* A function named **return** that wraps the function and puts it into the container.
* A bind function called **>>=** that unwraps a function: we'll use it to chain the functions together.

So for a monad m, some function f and a value v:
* you should be able to create a monad, using a type constructor, that will work with some type that can hold a value.
* you should be able to unwrap and wrap values without loos of information (m >>= return = m).
* nesting bind functions should be the same as calling them sequentially.

### Building a monad
We need to define the components described, in our example we implement the drunken pirate example using a monad. In details:
* *data Position t = Position t* is the type constructor
* *stagger* and *crawl* are based on the type *Position* (the container)
* *rtn* is the return function that simply gives back the value of the monad
* *>>==* is the bind function: it is just call the associated function with the value of the monad

Is worth noting that the name of the return and bind functions are different from the build in monad functions in Haskell (*return* and *>>=*) to avoid collisions.

```haskell
-- monad approach (drunken_monad.hs)
module Main where
  data Position t = Position t deriving (Show)

  stagger (Position d) = Position (d + 2)
  crawl (Position d) = Position (d + 1)

  rtn x = x
  x >>== f = f x

-- execution
treasureMap (Position 0) -- Position 5
```

### Do notation
The do notation give us a bit of syntactic sugar and it is particularly useful to manage problems like I/O. In the next example we are using different monads in sequence using the do notation.

```haskell
-- do nation usage (io.hs)
module Main where
  tryIo = do  putStr "Enter your name: " ;
              line <- getLine ;
              let { backwards = reverse line } ;
              return ("Hello. Your name backwards is " ++ backwards)
```

### Different computational strategies
To every monad is associated a computational strategy. A list is in fact a monad instantiated using *[]* and having a bind function that concatenates all the elements contained. Its return function is wrapping the function in a list.

```haskell
instance Monad [] where
  m >>= f = concatMap f m
  return x = [x]
```

An example of usage of the monad list is the follow, where we create combinations of values taken from two different lists.

```haskell
-- function definition
let cartesian (xs,ys) = do x <- xs; y <- ys; return (x,y)

-- execution
cartesian ([1..2], [3..4]) -- [(1,3),(1,4),(2,3),(2,4)]
```

#### Password cracker
Let's implement a simple password cracker where we just brute force the values from two lists. The password is hard coded in a function that returns a boolean related to the result of the match.

```haskell
-- password cracker (password.hs)
module Main where
  crack = do x <- ['a'..'c'] ; y <- ['a'..'c'] ; z <- ['a'..'c'] ;
             let { password = [x, y, z] } ;
             if attempt password
               then return (password, True)
               else return (password, False)

  attempt pw = if pw == "cab" then True else False
```

### Maybe monad
The maybe monad is used to manage the failure of a function. An example of this problem is string search, where we return the index of a string: if the string is present, we return its index otherwise the type **Nothing**. The maybe monad is using the type **Just** to wrap a value or Nothing. Return is wrapping the result in **Just**. Binding is returning Nothing if there is no value of a function that returns the value if it is present.

```haskell
-- maybe moand definition
data Maybe a = Nothing | Just a

instance Monad Maybe where
    return         = Just
    Nothing  >>= f = Nothing
    (Just x) >>= f = f x
```

Let's take for example the we want to get the first paragraph of a web page: we need to get the HTML page, its body and first paragraph of the it.
