def stock_picker(array)
	i = 0
	hash = {}
	while i < array.size
	  j = i + 1
	  while j < array.size
	  	profit = array[j] - array[i]
	  	hash.store([i,j], profit)
	  	j += 1
	  end
	  i += 1
	end 
	p hash.key(hash.values.max)
end
stock_picker([17,3,6,9,15,8,6,1,10])