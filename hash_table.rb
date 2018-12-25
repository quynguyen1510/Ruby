#create hash
item = Hash.new

#add hash[key] = value for hash
item["name"]="Quy Nguyen"

puts item["name"]
print "Hash.length : #{item.length}\n"

print "Hash.invert : #{item.invert}\n"

#cut the first key from hash
# puts item.shift.inspect

#mer with other hash
puts "Original hash : #{item.inspect}"
puts "Merge hash : #{item.merge({'age' => 21})}"