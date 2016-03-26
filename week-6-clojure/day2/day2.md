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
Loop binds the 
```clojure
(loop [x x-initial-value, y y-initial-value]
  (do-something-with x y))
```
