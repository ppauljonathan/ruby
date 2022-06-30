# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Array
  def reverse_iterate(&block)
    return if length.zero?
    x = shift
    reverse_iterate(&block)
    yield x
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts ARGV[0][1...-1].delete("'").delete(' ').split(',').reverse_iterate() { |i| print "#{i} " }
end
