# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Vehicle
  def initialize(name, price)
    @name = name
    @price = Integer(price)
  end
  def to_s
    puts "#{self.class} Name: #{@name}"
    puts "#{self.class} Price: #{@price}"
  end
end

class Bike < Vehicle
  def initialize(name, price, dealer)
    super(name, price)
    @dealer = dealer
    @percent_price_increase = @price / 100.0
  end
  def to_s
    super.to_s
    puts "#{self.class} Dealer: #{@dealer}"
  end
  def price_increase(percentage)
    @price += percentage.to_f * @percent_price_increase
    @percent_price_increase = @price / 100.0
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  bike = Bike.new(ARGV[0], ARGV[1], ARGV[2])
  bike.to_s
  puts
  bike.price_increase ARGV[3]
  puts "After #{ARGV[3].to_f} percent hike in price:"
  bike.to_s
end
