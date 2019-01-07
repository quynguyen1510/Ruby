puts 'Input number of customer : '
n = gets
arr_cus = []
class Customer
 # CUSTOMER = []

 # getter setter for object
 attr_accessor :cus_id, :cus_name, :cus_address

 def initialize(id, name, address)
   @cus_id = id
   @cus_name = name
   @cus_address = address
 end

 def display_info
   puts "Customer id #{@cus_id}"
   puts "Customer name #{@cus_name}"
   puts "Customer address #{@cus_address}"
   puts 80 * '-'
 end

 # add customer into arrCus
 # def self.add_to_arr(obj)
 #   CUSTOMER << obj
 # end

 # def self.remove(obj)
 #   CUSTOMER.pop
 # end
end

# Customer.add_to_arr(cus)
def add_cus
  puts 'ID cus : '
  id = gets.chomp
  puts 'Name cus : '
  name = gets.chomp
  puts 'Address cus : '
  address = gets.chomp
  cus = Customer.new(id, name, address)
  cus
end

# Delete cus if the input id is correct
def delete_cus(arr_cus)
  puts 'Enter ID cus you want delete :'
  id = gets.chomp
  arr_cus.delete_if { |cus| cus.cus_id == id }
end

i = 0
while i < n.to_i
  arr_cus.push(add_cus)
  i += 1
end
# for i in 0...n
#   arr_cus.push(add_cus)
# end
# Customer::CUSTOMER.each do |cus|
#   cus.display_info
# end
# Customer.remove(Customer::CUSTOMER[1])
# Customer::CUSTOMER.each do |cus|
#   cus.display_info
# end
arr_cus.each(display_info)

delete_cus(arr_cus)

arr_cus.each(display_info)