# Haskell
Haskell is a static, strong typed functional language.

## Basic Commands

### Strings
Strings are list of characters. They can be concatenated with the ++ operator.

```haskell
-- string
"ab" -- "ab"

-- list of characters
['a', 'b'] -- "ab"

-- string concatenation
"hello" ++ " world"
```

### Booleans
Booleans are like the other ***infix*** languages.

```haskell
-- equal
(4 + 5) == 9 -- true

-- non equal
(5 + 5) /= 10 -- false
(5 + 5) /= 9 -- true
```

Haskell is guessing if there is a follow-up line on what we type, so in an ***if*** block both then and else has to be present.

```haskell
-- incorrect block
if (5 == 5) then "true" -- parse error (possibly incorrect indentation or mismatched brackets)

-- correct block
if (5 == 5) then "true" else "false"
```

Is worth noting that ***if*** is a function and not a control structure, so it is returning a value.

### Type system
Haskell will try to infer the type of the variables, so the compiler won't show the type of a value if not forced to do it with the flat ***:t***.

```haskell
4 -- 4
:t 4 -- 4 :: Num a => a
```

### Let
Let is used to bind a variable to a value. You can also bind functions to variables.

```haskell
-- bind the variable
let x = 10

-- get the value of the variable
x -- 10

--- bind a function
let double x = x * 2

-- execute
double 2 -- 4
```

## Functions
Functions are the foundations of the programming paradigm of Haskell. We specify functions is two parts: an optional type specification and an implementation.

We define a function in a separate file, ***double.hs*** and load it into the console. The file defines a ***module*** that is a way in Haskell to collect related code into similar scope.

```haskell
-- load the module
load day01/double.hs
-- [1 of 1] Compiling Main             ( day01/double.hs, interpreted )

-- execute the function
double 5 -- 10
```

In the file ***double.hs*** we only defined the implementation without the (optional) type: the following definition is the complete one.

```haskell
module Main where
    double :: Integer -> Integer
    double x = x + x
```

### Recursion
We now present some functions using recursion. The first is the factorial, it is using pattern matching.

```haskell
-- factorial definition (factorial.hs)
module Main where
  factorial :: Integer -> Integer
  factorial 0 = 1
  factorial x = x * factorial (x - 1)

-- execution
factorial 3 -- 6
```

It is possible to use guards inside the pattern matching to check some conditions.

```haskell
-- factorial with guard (factorial_with_guard.hs)
module Main where
  factorial :: Integer -> Integer
  factorial x
      | x > 1 = x * factorial(x -1)
      | otherwise = 1
```

## Tuples and lists
Haskell depends on tail-recursion optimization to deal with recursion.  
Let's now implements a Fibonacci sequence with pattern matching.

```haskell
-- fibonacci (fib.hs)
module Main where
  fib :: Integer -> Integer
  fib 0 = 1
  fib 1 = 1
  fib x = fib (x - 1) + fib (x - 2)
```

The code is simple to read but inefficient, for numbers greater than 30, the computation takes too long.

Tuples permit to have a more efficient implementation. The following example shows how to implement the Fibonacci series with tuples.
The type definition accept a tuple of three elements as parameter and returns a tuple of three elements as result. The function named **fibTuple** calculated the value of the Fibonacci sequence and keeps track of the next value and index. The calculated value of Fibonacci is in the first position of the tuple, so per extract it we add a function, called **fibResult** that binds a tuple and returns only the first element. Then we create another method, called **fib**, that will invoke the previous two and this will be the method we will call from the module to start the computation.

```haskell
-- types and functions definition (fib_tuple.hs)
module Main where
  fibTuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
  fibTuple (x, y, 0) = (x, y, 0)
  fibTuple (x, y, index) = fibTuple (y, x + y, index - 1)

  fibResult :: (Integer, Integer, Integer) -> Integer
  fibResult (x, y, z) = x

  fib :: Integer -> Integer
  fib x = fibResult (fibTuple (0, 1, x))

-- execution
fib 100 -- 354224848179261915075
```
