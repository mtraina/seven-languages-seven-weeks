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
