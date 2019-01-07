def sub_strings(*args)
  result = {}
  case args.size
  when 1
    dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
    p array_string = args[0].split(" ")
    dictionary.each do |character|
  	  count = 0
      array_string.each do |item|
        if item.downcase.include?(character.downcase)
          count += 1
          result.store("#{character}",count) 
        end
    end 
  end	
  when 2
    array_string = args[0].split(" ")
    args[1].each do |character|
  	  count = 0
      array_string.each do |item|
        if item.downcase.include?(character.downcase)
          count += 1
          result.store("#{character}",count) 
        end
    end 
  end
  end
  result
end

p sub_strings("Howdy partner, sit down! How's it going?")