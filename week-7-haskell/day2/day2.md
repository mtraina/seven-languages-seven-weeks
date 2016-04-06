## High-order functions

### Anonymous functions

#### Map
Map is an useful function to manipulate the value of a list and return it in a new one.

```haskell
map (+ 1) [1, 2, 3] -- [2,3,4]
```

Let's create a slightly more complicated example with **map**: we define a function that returns the square of all the elements of the list.

```haskell
-- square the elements of a list (map.hs)
module Main where
  squareAll list = map square list
    where square x = x * x
```

#### Filter
Filter is testing the items in a list.

```haskell
filter odd [1, 2, 3, 4, 5] -- [1,3,5]
```

#### Fold left
Fold left is, starting from an initial value, applying a function to all the elements of a list.

```haskell
-- fold left with initial value of 0
foldl (\x carryOver -> carryOver + x) 0 [1 .. 10] -- 55

-- another way to express fold left
foldl1 (+) [1 .. 10] -- 55
```
