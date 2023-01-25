require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
# Validations for both models

# 1) Add validations to two models to enforce the following business rules:
# Employees must always have a first name present
# Employees must always have a last name present
# Employees have a hourly_rate that is a number (integer) between 40 and 200
# Employees must always have a store that they belong to (can't have an employee that is not assigned a store)
# Stores must always have a name that is a minimum of 3 characters
# Stores have an annual_revenue that is a number (integer) that must be 0 or more
# BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)
class Employee < ActiveRecord::Base
  validates :first_name, :last_name, :store, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
end

class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :carries_mens_or_womens
end

def carries_mens_or_womens
  if mens_apparel == false && womens_apparel == false || mens_apparel == nil || womens_apparel == nil
    errors.add(:womens_apparel, "Must contain either men's or women's apparel")
    errors.add(:mens_apparel, "Must contain either men's or women's apparel")
  end
end

# 2) Ask the user for a store name (store it in a variable)
puts "Provide a store name"
input = gets.chomp

# 3) Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, and womens_apparel)
store = Store.create(name: input)

# 4) Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record
puts store.valid?
puts store.errors[:name]
puts store.errors[:annual_revenue]
puts store.errors[:womens_apparel]
puts store.errors[:mens_apparel]