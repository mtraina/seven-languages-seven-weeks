### Functions
It is possible to create functions using the keyword **def**.

```ruby
def tell_the_truth
  true
end
```

### Arrays
Arrays are ordered collections.

```ruby
animals = ['lions', 'tigers', 'bears']
animals[0]    # "lions"
animals[10]   # nil
animals[-2]   # "tigers"
animals[0..1] # ['lions', 'tigers']
```

### Hashes
Hashes are collections of key-value pairs.

```ruby
numbers = {1 => 'one', 2 => 'two'}
numbers[1]    # "one"
```

### Code blocks and yield
A code block is an anonymous function: you can pass it as a parameter to a function or a method.  
We pass the code block *{puts 'hiya there, kiddo'}* to the method times of Fixnum.

```ruby
3.times {puts 'hiya there, kiddo'}  
# hiya there, kiddo
# hiya there, kiddo
# hiya there, kiddo
```
