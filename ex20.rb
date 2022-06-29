# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Interest
  attr_accessor :principal, :time, :rate

  def initialize
    yield self
  end

  def simple_compound_diff
    simple_interest = (@principal * @rate * @time) / 100
    compound_interest = (@principal * ((1 + @rate / 100)**@time)) - @principal
    format('%<diff_value>.2f', diff_value: (compound_interest - simple_interest))
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  interest_difference = Interest.new do |int_obj|
    int_obj.principal = ARGV[0].to_f
    int_obj.time = ARGV[1].to_f
    int_obj.rate = 10.0
  end.simple_compound_diff
  puts "Interest difference= #{interest_difference}"
end
