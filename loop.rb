#loop from 1 to 3 (..) if (...) looping form 1 to 2
for i in 1..3
	if(i > 2)
		puts "Great"
	else
		puts "Not great"
	end
end

#each (i like a index of array)
[1,2,3].each do |i|
	puts i
end