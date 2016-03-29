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
