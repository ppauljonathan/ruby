# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Account
  @@account_counter = 0
  def initialize(name, balance)
    @@account_counter += 1
    @account_no = @@account_counter
    @name = name
    @balance = Integer(balance)
  end

  def deposit(amount)
    @balance += Integer(amount)
  end

  def withdraw(amount)
    @balance -= Integer(amount)
  end

  def transaction(account2, amount)
    withdraw(amount)
    account2.deposit(amount)
  end

  def display_details
    puts "Account number: #{@account_no}"
    puts "Account holder name: #{@name}"
    puts "Account balance: #{@balance}"
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  customer1 = Account.new(ARGV[0].split(':')[0], ARGV[0].split(':')[1])
  customer2 = Account.new(ARGV[1].split(':')[0], ARGV[1].split(':')[1])
  transaction_amount = ARGV[2].split(':')[1]
  customer1.transaction(customer2, transaction_amount)
  customer1.display_details
  puts
  customer2.display_details
end
