# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Integer
  def factorial
    if self.zero?
      1
    else
      puts (1..self).inject(:*)
    end
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  puts ARGV[0].to_i.factorial
end
