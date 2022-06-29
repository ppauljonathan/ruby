# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class String
  def reverse_words_arrangement
    split(' ').reverse.join(' ').inspect
  end
end
if ARGV.length.zero?
  puts 'Please provide an input'
else
  puts ARGV[0].reverse_words_arrangement
end
