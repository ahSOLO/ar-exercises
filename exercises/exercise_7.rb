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
class Store < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 3}
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :carries_at_least_one_sex

  def carries_at_least_one_sex
    errors.add(:mens_apparel, "store must carry at least one sex") if (mens_apparel.nil? && womens_apparel.nil?)
    errors.add(:womens_apparel, "store must carry at least one sex") if (mens_apparel.nil? && womens_apparel.nil?)
  end
end

class Employee < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than: 40, less_than: 200}
  has_one :store
end

store_name = gets.chomp
Store.create(name: store_name).errors.each { |attrib, message| puts "#{attrib}, #{message}" }