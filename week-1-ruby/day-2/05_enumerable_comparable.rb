puts 'begin' <=> 'end'
puts 'same' <=> 'same'
a = [5, 3, 4, 1]
puts a.sort
puts a.any? {|i| i > 6}
puts a.any? {|i| i > 4}
puts a.all? {|i| i > 4}
puts a.all? {|i| i > 0}

# map
puts a.collect {|i| i * 2}

# filter
puts a.select {|i| i % 2 == 0 } # even => [4]
puts a.select {|i| i % 2 == 1 } # odd => [5, 3, 1]
puts a.max
puts a.member?(2)

# reduce
b = a.inject(0) {|sum, i| sum + i}
puts "the total sum is #{b}"

b = a.inject {|sum, i| sum + i}
puts "the total sum (case 2) is #{b}"

b = a.inject {|product, i| product * i}
puts "the total prod is #{b}"

a.inject(0) do |sum, i|
	puts "sum: #{sum} i: #{i} sum + i: #{sum + i}"
	sum + i
end
