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

#### Partially applied functions and Currying
In Haskell every function has one parameter and it works like splitting functions with multiple arguments into multiple functions with a single argument and apply them sequentially.  
Let's take for example a function that multiplies two number, called **prod**, first we first argument to it and we obtain a function that will multiply an argument, the second, for a defined one, the first. The next snippet will clarify this concept.

```haskell
-- define prod
let prod x y = x * y

-- check the type of prod
:t prod -- prod :: Num a => a -> a -> a

-- apply prod to two arguments
prod 2 4 -- 8

-- in Haskell will apply (prod 2) 4, like if it was the function 'double' defined below
let double = prod 2
:t double -- double :: Num a => a -> a
double 4 -- 8
```

This process is named **Currying**.
