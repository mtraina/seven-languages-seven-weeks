## Classes and types
The Haskell's typesystem is one of its strongest features, allowing type inference.

### User defined types
The use of the word **data** let us define our own types. For example we can represent a deck of cards defining the suit and the rank with all their possible values.

```haskell
module Main where
  data Suit = Spades | Hearts
  data Rank = Ten | Jack | Queen | King | Ace
  type Card = (Rank, Suit)
  type Hand = [Card]
```
