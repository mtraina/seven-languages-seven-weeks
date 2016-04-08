## Classes and types
The Haskell's typesystem is one of its strongest features, allowing type inference.

### User defined types
The use of the word **data** let us define our own types. For example we can represent a deck of cards defining the suit and the rank with all their possible values. ***Suit*** and ***Rank*** define few values and we describe a ***Card*** as a tuple of ***Rank*** and ***Suit*** and a ***Hand*** as a list of ***Cards***.  
We then create a function that convert the ***Rank*** to a value and we define those values ourselves, e.g, assigning the value 1 to the card ***Ten***.  
The last function is going to translate a ***Card*** to its value.

```haskell
-- define the functions to represent a deck of cards (backwards.hs)
module Main where
  data Suit = Spades | Hearts
  data Rank = Ten | Jack | Queen | King | Ace

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

-- execution
cardValue(Jack, Hearts) -- 2  
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
