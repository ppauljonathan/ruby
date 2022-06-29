# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Fibonacci
  def initialize
    @first_num = 0
    @second_num = 1
    @fibonacci_num = 0
  end
  def fibonacci_printer_till_limit(limit)
    while @fibonacci_num <= limit
      yield(@fibonacci_num) if @fibonacci_num.nonzero?
      @first_num = @second_num
      @second_num = @fibonacci_num
      @fibonacci_num = @first_num + @second_num
    end
  end
end

if ARGV.length.zero?
  print 'Please provide an input'
else
  fibonacci_printer_object = Fibonacci.new
  fibonacci_printer_object.fibonacci_printer_till_limit(ARGV[0].to_i) { |number| print "#{number} " }
end
