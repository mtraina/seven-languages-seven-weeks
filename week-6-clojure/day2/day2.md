## Recursion
Functional languages depend on recursion rather than iteration.  
The following function calculate recursively the size of a sequence: if the list is empty, the size is 0 otherwise it is the sum of one and the rest of the sequence.
```clojure
;; recursive size function definition
(defn size [v]
  (if (empty? v)
    0
    (inc (size (rest v)))))

;; call size  
(size [1 2 3])
```
### Tail recursion optimization
Recursively call a function can end up consuming all the stack, to avoid this functional languages use a concept called **tail recursive optimization**. In Clojure it is not implicit but you can explicitly recur using the construct **loop** and **recur**.

#### Loop
Loop binds the variables to the values, similarly to **let**.
```clojure
(loop [x 1] x) ; 1
```

#### Recur
Recur invokes the recursion through **loop**. In this specific example recur will pass the rest of the vector and the counter increased by 1 to the loop binding.

```clojure
(defn size [v]
  (loop [l v, c 0]
    (if (empty? l)
      c
      (recur (rest l) (inc c)))))
```

## Sequences
Sequences are abstractions around all the containers of the Clojure ecosystem (collections, strings, streams, directories, etc.).

#### Test a sequence
You can use a predicate to check if a sequence satisfies it.

```clojure
(some nil? [1 2 nil]) ; true
```

#### Filter
Filter returns only the elements of a sequence that satisfy the predicate.

```clojure
;; define a sequence
(def words ["luke" "chewie" "han" "lando"])

;; filter only the words longer than 4 characters
(filter (fn [word] (> (count word) 4)) words)
```

#### Map
Map applies a function on all the elements of a sequence and return the result.

```clojure
;; map the square root of the elements of a sequence
(map (fn [x] (* x x)) [1 1 2 3 5]) % (1 1 4 9 25)
```

#### List comprehension
This syntactic construct that combines multiple list and filters, taking the possible combinations of the list and applying the filters.

```clojure
;; define the colors vector
(def colors ["red" "blue"])

;; define the toys vector
(def toys ["block" "car"])

;; create a filter for words shorter than 5 characters
(defn small-word? [w] (< (count w) 4))

;; iterate the sequences and apply the filter using "when"
(for [x colors, y toys, :when (small-word? y)]
  (str "I like " x " " y "s")) ; ("I like red cars" "I like blue cars")
```

#### Reduce
It is the equivalent of the fold left operation saw in other languages.

```clojure
(reduce + [1 2 3 4]) ; 10
```

#### Sort
We can sort using the natural comparator or a custom defined one.

```clojure
;; natural sorting
(sort [3 1 2 4]) ; (1 2 3 4)

;; custom sorting, by absolute value
(defn abs [x] (if (< x 0) (- x) x))

(sort-by abs [-1 -4 3 2]) ; (-1 2 3 -4)
```

### Lazy evaluation
An infinite sequence can be described in **Clojure** using lazy evaluation: in this way the sequence library computes the values only when they are actually consumed.

#### Finite sequence with range
A range creates a sequence with the upper bound not included.

```clojure
(range 1 10) ; (1 2 3 4 5 6 7 8 9)

;; range with increment
(range 1 10 3) ; (1 4 7)
```

#### Infinite sequences and take
We'll introduce now infinite sequences.  
Repeat creates an infinite sequence of one element: we use take to get a finite part of it.

```clojure
(take 3 (repeat "Use the Force, Luke"))
; ("Use the Force, Luke" "Use the Force, Luke" "Use the Force, Luke")
```

Cycle repeats the element of a list.

```clojure
(take 5 (cycle [:lather :rinse :repeat]))
; (:lather :rinse :repeat :lather :rinse)
```

Drop discards the desired number of elements. In this case we are applying the functions inside out.

```clojure
(take 5 (drop 2 (cycle [:lather :rinse :repeat])))
; (:repeat :lather :rinse :repeat :lather)
```

##### Left-to-right operator (->>)
For applying the functions from left to right we can use the **->>** operator. In this example we'll get the same result as the **drop** one

```clojure
(->> [:lather :rinse :repeat] (cycle) (drop 2) (take 5))
; (:repeat :lather :rinse :repeat :lather)
```

##### Iterate
Iterate takes a function and a starting value and applies repeatedly the former to the latter.

```clojure
(take 5 (iterate inc 1)) ; (1 2 3 4 5)
```

##### Fibonacci example
Let's calculate the Fibonacci sequence using the methods we introduced before.
* Let's first create a function that destructures a vector of two and returns the next pair of value in the Fibonacci sequence.
* The next step is to use **iterate** to crete an infinite sequence of Fibonacci values.
* Then we use **map** and **first** to get only the first element of the vector returned from the function.
* At the end we use **take** to get only 5 elements from the infinite sequence of Fibonacci.

```clojure
;; define a Fibonacci function
(defn fib-pair [[a b]]  [b (+ a b)])

;; combine the functions together to get the first 5 elements
(take 5
(map
(first
(iterate fib-pair [1 1]))) ; (1 1 2 3 5)
```
