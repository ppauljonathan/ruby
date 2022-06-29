# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Time
  @add_time_hash = Hash.new(0)
  def self.make_time_hash(time_arr)
    time_arr.each do |each_time|
      @add_time_hash[:second] += each_time.sec
      @add_time_hash[:minute] += each_time.min
      @add_time_hash[:hour] += each_time.hour
    end
  end

  def self.format_time_hash
    @add_time_hash[:minute] += @add_time_hash[:second] / 60
    @add_time_hash[:hour] += @add_time_hash[:minute] / 60
    @add_time_hash[:day] += @add_time_hash[:hour] / 24
    @add_time_hash[:second] %= 60
    @add_time_hash[:minute] %= 60
    @add_time_hash[:hour] %= 24
  end

  def self.add_time(time_arr)
    make_time_hash(time_arr)
    format_time_hash
    output_time = Time.new(1, 1, 1, @add_time_hash[:hour], @add_time_hash[:minute], @add_time_hash[:second])
    if @add_time_hash[:day].nonzero?
      "#{@add_time_hash[:day]} day & #{output_time.strftime('%H:%M:%S')}".inspect
    else
      output_time.strftime('%H:%M:%S').inspect
    end
  end
end
if ARGV.empty?
  puts 'Please provide an input'
else
  SEARCH_REGEXP = /^([0-9]|0[0-9]|1[0-9]|2[0-3]):([0-9]|[0-5][0-9]):([0-9]|[0-5][0-9])$/.freeze
  time_array = []
  puts 'Invalid 24-hour time value'.inspect unless ARGV.all?(SEARCH_REGEXP)
  ARGV.each do |time_string|
    time_hms_string = time_string.split(':')
    time_array.push(Time.new(1, 1, 1, time_hms_string[0], time_hms_string[1], time_hms_string[2]))
  end
  puts Time.add_time(time_array)
end

