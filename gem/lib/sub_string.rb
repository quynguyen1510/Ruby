dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def sub_strings(string,dictionary)
  result = {}
  array_string = string.split(" ")
  
  dictionary.each do |character|
  	count = 0
    array_string.each do |item|
      if item.downcase.include?(character.downcase)
        count += 1
        result.store("#{character}",count) 
      end
    end 
  end
  p result
end
sub_strings("Howdy partner, sit down! How's it going?",dictionary)