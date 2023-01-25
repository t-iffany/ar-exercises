require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# Your code goes here ...
# 1) load the first store and assign it an instance variable @store1
@store1 = Store.find_by(id: 1)

# 2) load the second store and assign it to @store2
@store2 = Store.find_by(id: 2)

# 3) Update the first store (@store1) instance in the database. (Change its name or something.)
@store1.update(name: 'Unicorn')