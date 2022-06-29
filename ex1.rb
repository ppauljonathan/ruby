# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class String
  NON_ALPHABET_REGEX = /[^a-z]/i
	def occurence_hash
    hasher = split("")
    .reject { |char| char =~ NON_ALPHABET_REGEX}
    .reduce(Hash.new(0)) do |result, char|
      result[char] += 1
      result
    end
    hasher
  end
end

if ARGV.length.zero? 
  puts "Please provide an input"
else
  puts ARGV[0].occurence_hash
end
