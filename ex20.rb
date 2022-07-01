# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Interest
  INTEREST_RATE = 10.0

  attr_accessor :principal, :time

  def initialize
    yield self
  end

  private

  def calc_simple_interest
    (@principal * INTEREST_RATE * @time) / 100
  end

  def calc_compound_interest
    (@principal * ((1 + INTEREST_RATE / 100)**@time)) - @principal
  end

  public

  def simple_compound_diff
    format('%<diff_value>.2f', diff_value: (calc_compound_interest - calc_simple_interest))
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  interest_difference = Interest.new do |int_obj|
    int_obj.principal = ARGV[0].to_f
    int_obj.time = ARGV[1].to_f
  end.simple_compound_diff
  puts "Interest difference= #{interest_difference}"
end
