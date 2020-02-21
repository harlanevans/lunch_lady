require 'pry'

class MainDish
  attr_accessor :item, :price
  def initialize(item, price)
    @item = item
    @price = price
    # @main_dish = []
  end
end

class SideDish
  attr_accessor :item, :price
  def initialize(item, price)
    @item = item
    @price = price
  end
end

class LunchLady
  def initialize
    @main_dishes = [
      # {item: 'meat', price: 1000}
      MainDish.new("Meat", 1000),
      MainDish.new("Bread", 3000),
      MainDish.new("Water", 5000),
      MainDish.new("Leaves", 10000),
      MainDish.new("Henry", 1000000000),
    ]
    @side_dishes = [
      SideDish.new("Toast", 400),
      SideDish.new("Chip", 500),
      SideDish.new("Ice", 1000),
    ]
    @cart = []
    @name = {}

    intro
  end

  def intro
    puts "Hello there. What is your name?"
    @name = gets.strip
    puts "Welcome to heaven, #{@name}"
    sleep 1
    puts "hello"
    menu
  end
  
  def menu
    sleep 1
    puts "Please choose from the following choices:"
    @main_dishes.each_with_index do |main, index|
      puts "#{index + 1}) #{main.item} - $#{main.price}"
    end
    main_dish_order
  end

  def main_dish_order
    user_choice = gets.to_i
      the_choice_item = @main_dishes[user_choice -1].
      the_choice_price = @main_dishes[user_choice -1].price
      @cart << the_choice_item
      puts @cart
  
  
  end

  def side_dish
    puts "Ok, Now you can choose your side dish: "
    @side_dishes.each_with_index do |side, index|
      # binding.pry
      puts "#{index + 1}) #{side.item} - $#{side.price}"
    end
    puts "4) Or Checkout"
    side_dish_order
  end

  def side_dish_order
    user_choice = gets.to_i
    case user_choice
    when 1
      puts "You chose Toast"
      @cart << @side_dishes[0].price
      continue
    when 2
      puts "You chose Chip"
      @cart << @side_dishes[1].price
      continue
    when 3
      puts "You chose Ice"
      # @cart = 500
      @cart = @cart + @side_dishes[2].price
      # @cart = 1500
      # @basket << @side_dishes[2].item
      continue
    when 4
      checkout
    else 
      error_three
    end
  end

  def continue
    puts "okidoki you ding dong. Would you like to buy more food or checkout?"
    puts "1) Buy another Main Dish"
    puts "2) Buy another Side Dish"
    puts "3) Checkout"
    continue_choice = gets.to_i
    case continue_choice
    when 1
      menu_two
    when 2
      side_two
    when 3
      checkout
    else
      error_two
    end
  end

  def checkout
    puts "Ok, #{@name}.\nYour total is: $#{@cart}\n" 
    # @basket.each do |b|
    #   puts b
    sleep 1
    puts "If you would like to order another meal, please press 1."
    puts "Otherwise, press 2!"
    user_choice = gets.to_i
    case user_choice
    when 1
      menu
    when 2
      goodbye
    else
      error 
    end
  end

  def menu_two 
    puts "Please choose from the following choices:"
    @main_dishes.each_with_index do |main, index|
      puts "#{index + 1}) #{main.item} - #{main.price}"
    end
    main_dish_order
  end

  def side_two
     puts "Ok, Now you can choose your side dish: "
    @side_dishes.each_with_index do |side, index|
      # binding.pry
      puts "#{index + 1}) #{side.item} - $#{side.price}"
    end
    puts "4) Or Checkout"
    side_dish_order
  end


  def error 
    puts "You can't choose that option please try again"
    menu
  end

  def error_two
    puts "Not a valid option, Try again."
    continue
  end

  def error_three
    puts "Not a valid option, Try again."
    side_dish
  end

  def goodbye
    puts "Have a good rest of your day #{@name}!"
    exit
  end


end



LunchLady.new
