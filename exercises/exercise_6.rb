require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Kay", last_name: "Vee", hourly_rate: 41)
@store1.employees.create(first_name: "Knush", last_name: "Popo", hourly_rate: 100)
@store2.employees.create(first_name: "Andy", last_name: "Roo", hourly_rate: 120)
@store2.employees.create(first_name: "Pop", last_name: "Tart", hourly_rate: 80)