# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Integer
  def find_primes_below
    init_prime = 2
    prime_list = []
    init_prime.step(self,1) do |number|
      divisor = 0
      init_prime.step(Math.sqrt(number),1) {|div| divisor +=1 if number%div == 0}
      prime_list << number if divisor == 0
    end
    prime_list
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  print ARGV[0].to_i.find_primes_below
end
