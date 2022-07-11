# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class CapitalizeError < StandardError
  def message
    'Error in capitalization'
  end
end

class Name
  def initialize(name)
    @firstname = name[0]
    @lastname = name[1]
    check_name
  end

  def check_name
    begin
      raise CapitalizeError, 'Firstname must start with uppercase letter' if @firstname.capitalize != @firstname
      raise NameError, 'Lastname cannot be blank' unless @lastname
    rescue => e
      puts e.message
    else
      display_name
    end
  end

  def display_name
    puts "Your name is #{@firstname} #{@lastname}"
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  Name.new(ARGV)
end
