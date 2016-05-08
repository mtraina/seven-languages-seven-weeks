# Ruby
Ruby is a strong typed dynamic language.

## Duck typing
Ruby doesn't type check the code until is going to execute it. The following snippet shows an example if this concept: **a** is an array containing a string and a float, the method doesn't check the type of the elements until it calls the method **to_i** that convert the element to an integer. Because both string and float provide this method, the execution works fine.

```ruby
 a = ['100', 100.0]

 while i < 2
   puts a[i].to_i
   i=i+1
end
# 100
# 100
```
