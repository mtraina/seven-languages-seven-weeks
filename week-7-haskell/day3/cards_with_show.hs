module Main where
  data Suit = Spades | Hearts
  data Rank = Ten | Jack | Queen | King | Ace

  type Card = (Rank, Suit)
  type Hand = [Card]
