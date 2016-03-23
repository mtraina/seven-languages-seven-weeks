# Clojure

Clojure is a **Lisp** dialect that runs on the **JVM**. It is a functional dynamic language.  
Clojure used a **prefix** notations, so the first element of a function is the name of the function to invoke followed by the parameters.
```clojure
(+ 1 1)   ; 2
(/ 2.0 4) ; 0.5
```

### Strings and chars
A very useful function is **str** that convert values to string; it can also concatenate values.
```clojure
(str 1)               ; "1"
(str "a, " "b, " "c") ; "a, b, c"
(str \f \o \r \c \e)  ; "force"
```

### Lists, maps and vectors
Lists are an ordered collection of elements. In idiomatic Clojure there are used for code whilst vectors are used for data.
```clojure
;; list creation
(list 1 2 3)  ; (1 2 3)
'(1 2 3)      ; (1 2 3)

;; first (head)
(first '(:r2d2 :c3po))  ; :r2d2

;; last
(last '(:r2d2 :c3po))   ; :c3po

;; rest (tail)
(rest '(:r2d2 :c3po))   ; (:c3po)

;; list concatenation
(cons :battle-droid '(:r2d2 :c3po)) ; (:battle-droid :r2d2 :c3po)
```

### Vectors
Vectors are, like lists, an ordered collection, but optimized for random access.
```clojure
;; vector creation
[:hutt :wookie :ewok]                 ; [:hutt :wookie :ewok]
(first [:hutt :wookie :ewok])         ; :hutt
(nth [:hutt :wookie :ewok] 2)         ; :ewok
(last [:hutt :wookie :ewok])          ; :ewok
(rest [:hutt :wookie :ewok])          ; (:wookie :ewok)

;; vector concatenation
(concat [:darth-vader] [:darth-maul]) ; (:darth-vader :darth-maul)
```

### Sets
It's an unordered collection of elements.
```clojure
;; set creation
#{:x-wing :y-wing :tie-fighter} ; #{:x-wing :y-wing :tie-fighter}

;; save the set in a variable
(def spacecraft #{:x-wing :y-wing :tie-fighter})

;; count
(count spacecraft)  ; 3
(sort spacecraft)   ; (:tie-fighter :x-wing :y-wing)

;; merge two sets
(clojure.set/union #{:skywalker} #{:vader}) ; #{:skywalker :vader}

;; diffrence
(clojure.set/difference #{1 2 3} #{2})      ; #{1 3}
```
