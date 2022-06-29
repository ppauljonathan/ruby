class Integer
  def find_primes_below
    num_array = (2..self).to_a
    (2..Math.sqrt(self)).each do |step_size|
      (step_size - 2..self - 2).step(step_size).each { |index| num_array[index] = 0 unless step_size == num_array[index] }
    end
    num_array.reject(&:zero?).inspect
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  puts ARGV[0].to_i.find_primes_below
end
