numbers = [1, 2, 3, 4]
numbers << 6 #add new index for arr
numbers.unshift(0) #add new index to begining of arr

last_number = numbers.pop #cut the last item in arr
first_number = numbers.shift #cut the first item in arr
new_arr = numbers.slice(0,2) #get index from 0 and get 2 index 
new_arr.each { |i|  
	puts i
}
i = 0
while i < numbers.length
	puts numbers[i]
	i += 1
end
sum = 0
numbers.each do |num|
	if num % 2 == 0 
		sum += 1
	end
end
puts "Sum of number :#{sum}"


#hash table
hash_tk = {
 "name" => "Quy",
 "nickname" => "QuyC",
 "nationality" => "Vietnamese"
}
 
print "My name is #{hash_tk["name"]} " # My name is Leandro
print "But you can call me #{hash_tk["nickname"]} " # But you can call me Tk
print "And by the way I'm #{hash_tk["nationality"]}" # And by the way I'm Brazilian