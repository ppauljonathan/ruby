# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Array
  def hash_grouped_by_length
    group_by(&:length)
  end

  def sort_by_odd_even_and_store_in_hash
    hash_grouped_by_length.inject(Hash.new { |h, k| h[k] = [] }) do |hash, (key, val)|
      hash[key.odd? ? 'odd' : 'even'].push(val)
      hash
    end
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  array_of_input = ARGV[0][1...-1].delete("'").split(',')
  print array_of_input.sort_by_odd_even_and_store_in_hash
end
