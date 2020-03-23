class Waiter
    attr_reader :name, :yrs_experience

    @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
    # initializes a meal using the current Waiter instance, a provided Customer instance and a total and tip
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    big_tip = meals.max { |meal_a, meal_b| 
        meal_a.tip <=> meal_b.tip}
  big_tip.customer
end
# binding.pry
end