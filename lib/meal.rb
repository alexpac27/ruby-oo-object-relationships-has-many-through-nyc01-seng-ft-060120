require_relative './customer.rb'
# require_relative './lib/meal.rb'
require_relative './waiter.rb'
require 'pry'

class Meal
 
    attr_accessor :waiter, :customer, :total, :tip
   
    @@all = []
   
    def initialize(waiter, customer, total, tip=0)
      @waiter = waiter
      @customer = customer
      @total = total
      @tip = tip
      @@all << self
    end
   
    def self.all
      @@all
    end
  end
  
jason = Waiter.new("Jason", 4)
sarah = Waiter.new("Sarah",1)

lisa = Customer.new("Lisa", 24)
tim = Customer.new("Tim", 35)
terrance = Customer.new("Terrance", 27)

terrance.new_meal(jason, 50, 5)
lisa.new_meal(jason, 40, 15)
tim.new_meal(sarah, 45, 2)
lisa.new_meal(sarah, 35, 6)
  binding.pry