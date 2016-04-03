## Software transactional memory (STM)
It a strategy, similar to the one used in databases, to keep different versions of a reference to maintain consistency and integrity. You can modify a reference only within the scope of a transaction.

### Reference
A reference in Clojure is a wrapped piece of data. We can assign a reference to a value (movie) and get the value of the reference using **deref**

```clojure
;; create a reference and assign to a value
(def movie (ref "Star Wars")) ; 'user/movie

;; get the reference
movie ; #object[clojure.lang.Ref 0x66cf19bb {:status :ready, :val "Star Wars"}]

;; get the value of the reference
(deref movie) ; "Star Wars"

;; same as above, just a short form
@movie ; "Star Wars"
```

If we try to change the value of the reference we'll receive an error due to the fact that no transaction is running.

```clojure
(alter movie str ": The Empire Strikes Back")
; IllegalStateException No transaction running  clojure.lang.LockingTransaction.getEx (LockingTransaction.java:208)
```

Let's then alter the reference within a transaction using the **dosync** command.

```clojure
;; prepend a string to the value of the reference
(dosync (alter movie str ": The Empire Strikes Back"))
; "Star Wars: The Empire Strikes Back"

;; replace the value of the reference with a new one
(dosync (ref-set movie "Star Wars: The Revenge of the Sith"))
; "Star Wars: The Revenge of the Sith"

;; check that the value of the reference changed
@movie ; "Star Wars: The Revenge of the Sith"
```

## Atoms
Atoms provide a way to manage changes that don't have to be coordinated. They don't need to manage transactions for this.

```clojure
(def danger (atom "Split at your own risk.")) ; 'user/danger

danger ; object[clojure.lang.Atom 0x7e437a2e {:status :ready, :val "Split at your own risk."}]

(reset! danger "Split with impunity")
```

### Cache built with Atom
A cache is a perfect fit for atoms. In the following example we define a namespace, a function for creating the cache, another for getting from it. The last function we define is related to a **put** with two different implementation, using **arity overloading**, meaning the implementation is selected depending of the number of the parameters passed to the function.

```clojure
;; namespace
(ns solutions.atom-cache
  (:refer-clojure :exclude [get]))

;; create cache function
(defn create
  []
  (atom {}))

;; get from cache function
(defn get
  [cache key]
  (@cache key))

;; put to cache function
(defn put
  ([cache value-map]
     (swap! cache merge value-map))
  ([cache key value]
     (swap! cache assoc key value)))

;; usage sample
(def ac (create))
(put ac :quote "I'm your father, Luke.")
(println (str "Cached item: " (get ac :quote)))
```
