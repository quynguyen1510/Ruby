
# class Person
# 	attr_accessor :name

# 	def initialize(name)
# 		@name = name
# 	end 
# end 

# people = (1..4).map do |e|
# 	Person.new("name#{e}")
# end 

# for ins in people
# 	puts "self: #{ins} of people: #{ins.name}"
# end
# 

# def non_duplicated_values(values)
#   arr = []
#   values.each{ |i|
#       count = 0
#       count = values.count(i)
#       if(count == 1)
#         arr << i
#       end
#   }
#   puts arr
# end


# def non_duplicated_values(values)
#   puts values.find_all { |x| values.count(x) == 1 }
# end
# non_duplicated_values([1,2,2,2,3,4,4,5,6,7,7,7])

# class Dog
 
#   def initialize(leg)
#     @@leg = leg
#   end
 
#   def show_leg
#     puts @@leg
#   end
 
# end
 
# first = Dog.new(4)
# first.show_leg # 4
 
# second = Dog.new(10)
# second.show_leg # 10
 
# first.show_leg # 10

# def sum_of_cubes(a, b)
#   (a..b).inject{|sum,i| sum += (i**3)}
# end
# puts sum_of_cubes(1,3)

def palindromes?(sentence)
	string = sentence.downcase.gsub(" ","")
	string == string.reverse
end

p palindromes?("Never odd or even")