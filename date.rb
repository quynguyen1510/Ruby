current_time = Time.new
puts current_time

# current day of year
puts current_time.yday

# current day of week like (Monday is the first day of week)
puts current_time.wday

case current_time.wday
	when 0
		puts "Sunday"
	when 1
		puts "Monday"
	when 2
		puts "Tuesday"
	when 3
		puts "Wednesday"
	when 4
		puts "Thursday"
	when 5
		puts "Friday"
	when 6
		puts "Satuday"
end
			
		
			
		
		