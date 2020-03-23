require 'pry'
class Customer
  attr_reader :name, :age

    @@all = []

    def initialize(name, age)
    @name = name
    @age = age
    @@all << self
    end

    def self.all
    @@all
    end
    
    def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.customer == self}
    end

    def waiters
        meals.map{|meal| meal.waiter}
    end



            #initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip

end