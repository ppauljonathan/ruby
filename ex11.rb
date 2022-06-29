# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Integer
  def pascal_triangle_generator
    (1..self).each do |index|
      c = 1
      (1..index).each do |value|
        yield "#{c} "
        c = c * (index - value) / value
      end
      yield "\n"
    end
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  ARGV[0].to_i.pascal_triangle_generator { |pascal_triangle_element| print pascal_triangle_element }
end
