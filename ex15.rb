class Integer
  def find_primes_below
    prime_list = []
    2.step(self) do |possible_prime|
      prime_list.push(possible_prime)
      2.step(Math.sqrt(possible_prime)) do |divisors|
        if (possible_prime % divisors).zero?
          prime_list.pop
          break
        end
      end
    end
    prime_list
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  p ARGV[0].to_i.find_primes_below
end
