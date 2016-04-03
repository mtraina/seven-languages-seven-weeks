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
Atoms provide a way to manage changes that don't have to be coordinated. They don't need to manage transactions for this. Atoms are ***synchronous***.

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
(def ac (create)) ; 'solutions.atom-cache/ac
(put ac :quote "I'm your father, Luke.") ; {:quote "I'm your father, Luke."}
(println (str "Cached item: " (get ac :quote))) ; Cached item: I'm your father, Luke.
```

## Agents
Agents are similar to Atoms but they are ***asynchronous***. Users can mutate the data of an agent asynchronously using functions and the updates will occur in another thread, when the data will be available.  
We are going to show now an usage of agents: we first create a function that returns the double of the value passed in. Then we define an agent, called ***tribbles*** with initial value of 1. Later we mutate the agent sending the function to the agent: this function will run in a different thread.

```clojure
;; function that doubles the value of the parameter
(defn twice [x] (* 2 x)) ; 'user/twice

;; define an agent with initial value
(def tribbles (agent 1)) ; 'user/tribbles

;; send the function to the agent
(send tribbles twice) ; object[clojure.lang.Agent 0x759de027 {:status :ready, :val 2}]

;; get the value from the agent
@tribbles ; 2
```

## Futures
Futures are used for manage a, perhaps expensive, computation and not waiting for the result. A future will start this computation and return right away so we can continue with the flow of our program. Whenever the computation will end, the future will contain the result of it.  
In the following example we create a future that will return a string after 5 seconds. When we'll try to read the value of the future, we'll need to wait until the computation, that, as said, takes 5 seconds, finishes.

```clojure
;; create future
(def finer-things (future (Thread/sleep 5000) "take time"))

;; get the value of the future
@finer-things ; after 5 seconds, "take time"
```
