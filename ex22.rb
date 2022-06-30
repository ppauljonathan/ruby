# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class FirstLastNameError < StandardError
  def message
    "There is some error with the name given"
  end
end

class Name
  def initialize(firstname, lastname)
    begin
      raise FirstLastNameError, 'Firstname must start with uppercase letter' if firstname.capitalize != firstname
      raise FirstLastNameError, 'Lastname cannot be blank' unless lastname
    rescue FirstLastNameError => e
      puts e
    else
      puts "Your name is #{[firstname, lastname].join(' ')}"
    end
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  Name.new(ARGV[0], ARGV[1])
end
