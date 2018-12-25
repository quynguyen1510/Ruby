# class Box
# 	def initialize(a = 0,b = 0)
# 		@a = a
# 		@b = b		
# 	end

# 	def area
# 		@a * @b
# 	end
# end

# a = Box.new(3,2)
# puts a.area

class Customer
	#getter setter for object
	attr_accessor :cus_id, :cus_name, :cus_address

	def initialize(id,name,address)
		@cus_id = id
		@cus_name = name
		@cus_address = address
	end

	def display_infor
		puts "Customer id #@cus_id"
		puts "Customer name #@cus_name"
		puts "Customer address #@cus_address"
	end
end

cus1 = Customer.new(1,"Harry Kane","Tottenham")
# cus1.display_infor
cus2 = Customer.new(2,"Eden Hardzard","Chelsea")
cus2.display_infor
cus2.cus_name = "Thorgan Hardzard"
cus2.display_infor
