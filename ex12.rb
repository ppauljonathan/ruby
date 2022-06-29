# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class String
  def count_char_types
    char_types_hash = Hash.new(0)
    each_char do |elem|
      case elem
      when ('a'..'z')
        char_types_hash[:lower] += 1
      when ('A'..'Z')
        char_types_hash[:upper] += 1
      when ('0'..'9')
        char_types_hash[:number] += 1
      else
        char_types_hash[:special] += 1
      end
    end
    puts "Lowercase characters = #{char_types_hash[:lower]}"
    puts "Uppercase characters = #{char_types_hash[:upper]}"
    puts "Numeric characters = #{char_types_hash[:number]}"
    puts "Special characters = #{char_types_hash[:special]}"
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  ARGV[0].count_char_types
end
