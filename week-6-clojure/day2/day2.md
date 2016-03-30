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
