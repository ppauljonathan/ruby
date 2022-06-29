# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class String
  def display_search_result(search_exp)
    total_occurence = scan(search_exp).length
    highlighted_input = gsub(search_exp) { |word| word = '(' + word + ')' }
    puts highlighted_input
    puts "Total occurrences found: #{total_occurence}"
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  SEARCH_REGEXP = /#{Regexp.quote(ARGV[1])}/i.freeze
  ARGV[0].display_search_result(SEARCH_REGEXP)
end
