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
