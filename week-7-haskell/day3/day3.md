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
