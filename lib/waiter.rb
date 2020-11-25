class Waiter
     attr_accessor :name, :years_experience

     @@all = []

     def initialize(name, years_experience)
          @name = name
          @years_experience = years_experience

          @@all << self
     end

     def self.all
          @@all
     end

     def new_meal(customer, total, tip=0)
          Meal.new(self, customer, total, tip)
     end

     def meals
          Meal.all.select { |meal| meal.waiter == self } 
     end

     # returns the Customer instance associated with the 
     # meal that received the largest tip
     def best_tipper
          best_meal_tip = meals.max do |meal_a, meal_b|
              meal_a.tip <=> meal_b.tip
          end
          best_meal_tip.customer
     end
         

end