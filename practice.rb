# puts "Input number: "
# n = gets
# chuc = n.to_i / 10 
# donvi = n.to_i % 10
# sum = chuc+donvi 
# puts "Sum of number is: #{sum}"

# same variable of 2 array
a = [1, 3, 5, 7, 9]
b = [1, 5, 4, 6, 8, 10, 9]
c = Array.new
a.each { |i|  
	b.each { |j|  
		if i == j
			c.push i
		end
	}
}
 puts "Same index of two array is",c

