class Waiter
 
    attr_accessor :name, :yrs_experience
    attr_reader :customer, :total, :tip
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end

    def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
    end
  
    def meals
      Meal.all.select do |meal|
        meal.waiter == self #checking for waiter now
      end
    end

    def best_tipper
      best_tipped_meal = meals.max do |meal_a, meal_b|
        meal_a.tip <=> meal_b.tip
      end
     
      best_tipped_meal.customer
    end
   
    def most_frequent_customer
      all_customers = self.meals.map {|meal| meal.customer.name}
      all_customers.max_by{|cus| all_customers.count(cus)}
    end

    def worst_meal
      all_tips = self.meals.map {|meal| meal.tip}
      self.meals.find {|meal| meal.tip == all_tips.min}
    end

    def self.average_tips
     
      all_yrs_exp = Waiter.all.map{|waiter| waiter.yrs_experience}

      waiter_most_exp = Waiter.all.find {|waiter| waiter.yrs_experience == all_yrs_exp.max}
      most_exp_tips_array = waiter_most_exp.meals.map{|meal| meal.tip}
      most_avg_tips = most_exp_tips_array.inject{ |sum, el| sum + el }.to_f / most_exp_tips_array.size
      
      waiter_least_exp = Waiter.all.find {|waiter| waiter.yrs_experience == all_yrs_exp.min}
      least_exp_tips_array = waiter_least_exp.meals.map{|meal| meal.tip}
      least_avg_tips = least_exp_tips_array.inject{ |sum, el| sum + el }.to_f / least_exp_tips_array.size
      
       hash = {most_exp: most_avg_tips, least_exp: least_avg_tips}
      p hash
    end

  end

  