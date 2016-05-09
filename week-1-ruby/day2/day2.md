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

### Running code from a file
Simply save the code in a file with extension *rb* and run with the command *ruby*.

```bash
ruby hello.rb   # hello, world
```

## Classes
Ruby allows to create classes and defining object as instances of them. It does support single inheritance.  

In the class *Tree*, the method initialize is called when the class is created whilst the methods *visit_all* and *visit* are methods exposed by the class.

```ruby
# define a class (03_tree.rb)
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end
```

## Mixin
Ruby uses modules for implementing a kind of multiple inheritance.

```ruby
# module definition (to_file.rb)
module ToFile
  def filename
    "object_#{self.object_id}.txt"
  end

  def to_f
    File.open(filename, 'w') {|f| f.write(to_s)}
  end
end
```

In this example we created a module named **ToFile** that expose a method that write the class to a file. Is worth noting that the method *to_f* is calling a method named *to_s* that does not exist in the **ToFile** module: it will be implemented by the user of the module.

```ruby
class Person
  include ToFile
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end
```

The class **Person** includes the module **ToFile** and it does implement the method *to_s* that will be, as stated before, called by the method *to_f* of **ToFile**.
