# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Integer
  def factorial
    self.zero? ? (1) : ((1..self).inject(:*))
  end
  def combination(n)
    (factorial) / ((n.factorial) * ((self - n).factorial))
  end
  def pascal_triangle_generator
    pasc_bottom_row = []
    (0...self).each do |index|
      (0..index).each { |choices| pasc_bottom_row.push(index.combination(choices))}
      yield pasc_bottom_row
      pasc_bottom_row.clear
    end
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  ARGV[0].to_i.pascal_triangle_generator do |pascal_line|
    pascal_line.each { |elem| print "#{elem} " }
    puts
  end
end
