# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class String
  def highlight_search_result(search_exp)
    search_regexp = /#{search_exp}/i.freeze
    puts gsub(search_regexp) { |word| '(' + word + ')' }
    puts "Total occurrences found: #{scan(search_regexp).length}"
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  ARGV[0].highlight_search_result(ARGV[1])
end
