class Customer
     attr_accessor :name, :age

     @@all = []

     def initialize(name, age)
          @name = name
          @age = age

          @@all << self
     end

     def self.all
          @@all
     end

     def new_meal(waiter, total, tip=0)
          Meal.new(waiter, self, total, tip)
     end

     def meals
          Meal.all.select { |meal_order| meal_order.customer == self }
     end

     # returns an Array of Waiter instances associated with this customer's meals
     # Use map 
     def waiters
          meals.map { |meal| meal.waiter }
     end





  
end