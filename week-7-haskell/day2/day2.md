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

## Lazy evaluation
Haskell uses lazy evaluation, so it is possible, for example, to create infinite lists. The next example shows a way to create one of this list accpeting a starting point and a step as parameters.

```haskell
-- range function (my_range.hs)
module Main where
    myRange start step = start:(myRange (start + step) step)

-- take 5 from an infinite range
take 5 (myRange 10 1) -- [10,11,12,13,14]
```

Let's have a look to another example, here creating a Fibonacci sequence using lazy evaluation and composition. The function **lazyFib** is creating an infinite Fibonacci sequence starting from two elements of it. The function **fib** is starting the computation from the beginning. The last function, **fibNth** is taking x elements from the Fibonacci series, then dropping all the elements but the last, then return the head of that list, that is the Fibonacci number related to the parameter we passed to the function.

```haskell
-- lazy Fibonacci sequence (lazy_fib.hs)
module Main where
    lazyFib x y = x:(lazyFib y (x + y))

    fib = lazyFib 1 1

    fibNth x = head (drop (x - 1) (take (x) fib))
```

At last we can see the application of a partial function to a lazy list. In this case we double the elements of an infinite list and we take few of the results, five for instance.

```haskell
-- take 5 elements from an infinite sequence and double them
 take 5 (map (*2) [1 ..]) -- [2,4,6,8,10]
```
