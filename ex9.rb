# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Array
  def make_hash_length
    group_by(&:length).sort.to_h
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  output_hash = ARGV[0].gsub(/[\[\]\']/i, '').split(',').make_hash_length
  puts output_hash
end
