# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class String
  def is_palindrome?
    self == reverse
  end
end

if ARGV.empty? || ARGV[0].empty?
  puts 'Please provide an input'
else
  if ARGV[0].is_palindrome?
    puts 'Input string is a palindrome'
  else
    puts 'Input string is not a palindrome'
  end
end
