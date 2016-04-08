## Classes and types
The Haskell's typesystem is one of its strongest features, allowing type inference.

### User defined types
The use of the word **data** let us define our own types. For example we can represent a deck of cards defining the suit and the rank with all their possible values. ***Suit*** and ***Rank*** define few values and we describe a ***Card*** as a tuple of ***Rank*** and ***Suit*** and a ***Hand*** as a list of ***Cards***.

```haskell
module Main where
  data Suit = Spades | Hearts
  data Rank = Ten | Jack | Queen | King | Ace

  type Card = (Rank, Suit)
  type Hand = [Card]
```
