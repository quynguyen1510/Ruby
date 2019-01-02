class Integer
	def my_times
		c = 0
		while c < self
			yield(c) #call block in my_each
			c += 1
		end
		self 
	end 
end 

class Array
	def my_each
		# 3.my_times 
		size.my_times do |i|
			yield(self[i]) 
		end
	self
	end 

	def my_map
		arr = []
		self.my_each do |i|
			tmp = yield(i)
			arr << tmp
		end
		arr
	end
end 
[1,2,3].my_each{|i| puts "#{i} time"}
puts [1,2,3].my_map{|e| e+2}