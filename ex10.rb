# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Array
  def create_array_grouped_by_len
    @array_grouped_by_length = inject(Hash.new { |nh, k| nh[k] = [] }) do |h, v|
      h[v.length].push(v)
      h
    end.values.to_a
  end

  def sort_by_odd_even_and_store_in_hash
    create_array_grouped_by_len
    @array_grouped_by_length.group_by { |el| el[0].length.odd? ? 'odd' : 'even' }
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  REMOVE_SQUARE_BRACKETS_AND_APOSTROPHE_REGEX = /[\[\]\']/.freeze
  array_of_input = ARGV[0].gsub(REMOVE_SQUARE_BRACKETS_AND_APOSTROPHE_REGEX, '').split(',')
  print array_of_input.sort_by_odd_even_and_store_in_hash
end
