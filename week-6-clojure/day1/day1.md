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

### Maps
A map is a key-value pair. A word preceded with : is a symbol (like atoms in Erlang).
```clojure
;; map creation
{:darth-vader "obi wan", :luke "yoda"} ; {:darth-vader "obi wan", :luke "yoda"}

;; save a map in a variable
(def mentors {:darth-vader "obi wan", :luke "yoda"})

;; get by key-value
(mentors :luke) ; "yoda"

;; merge two maps
(merge {:y-wing 2, :x-wing 4} {:tie-fighter 2}) ; {:tie-fighter 2, :y-wing 2, :x-wing 4}

;; merge specifying an operator to use when the hash already exists
(merge-with + {:y-wing 2, :x-wing 4} {:tie-fighter 2 :x-wing 3}) ; {:tie-fighter 2, :y-wing 2, :x-wing 7}

;; create a new map adding an element to an existing one
(assoc {:one 1} :two 2) ; {:two 2, :one 1}
```

### Functions
To define a function Clojure uses the keyword **defn**.
```clojure
;; create the function
(defn force-it [] (str "Use the force," "Luke."))

;; invoke the function
(force-it)
```

It is possible to add a description to the function and see it in the documentation.

```clojure
;; define the function with a description
(defn force-it
   "The first function a young Jedi needs"
   []
   (str "Use the force," "Luke"))

;; recall the documentation of the function
(doc force-it)
```

### Bindings
The process of assigning parameters based on the inbound arguments is called **binding**.
For example we can define a line as a vector of vectors and a function that binds its parameter to it. Our function is returning the last part of the line.  
```clojure
;; define a line as a vector of vectors
(def line [[0 0] [10 20]])

;; create a function that returns the last part of the line
(defn line-end [ln] (last  ln))
(line-end line) ; [10 20]
```

Instead of doing this we can bind the parameter to the second element of the line directly, this concept is called **destructuring** because we get only the part we need from an existing data structure.
```clojure
;; this function binds the parameter to the second element of the line
(defn line-end [[_ second]] second)
(line-end line) ; [10 20]
```

#### Let
Let is an operator for binding a variable to a value.
```clojure
;; define a map
(def person {:name "Jabba" :profession "Gangster"})

;; set the value of the key in the variable
(let [{name :name} person]
  (str "The person's name is " name)) ; "The person's name is Jabba"
```

#### Anonymous functions
You can define anonymous function using the construct **fn**. Here an example of a function written with the usual approach and as anonymous.
```clojure
;; define a vector of people
(def people ["Lea", "Han Solo"])

;; create a function that doubles the count of the elements of a vector
(defn twice-count [w] (* 2 (count w)))

;; map the doubles of the counts
(map twice-count people)  ;(6 16)

;; same as before in one line with an anonymous function
(map (fn [w] (* 2 (count w))) people) ; (6 16)

;; shorter form
(map #(* 2 (count %)) people) ; (6 16)
```
