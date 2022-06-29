# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Array
  def power(exponent)
    map { |element| element**exponent }
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  print ARGV[0][1...-1].split(',').map(&:to_i).power(ARGV[1].to_i)
end
