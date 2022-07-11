# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Time
  SEARCH_REGEXP = /^([0-9]|0[0-9]|1[0-9]|2[0-3]):([0-9]|[0-5][0-9]):([0-9]|[0-5][0-9])$/.freeze
  def self.convert_string_to_time(time_array_of_strings)
    time_array_of_strings.map do |time_string|
      time_hms_arr = time_string.split(':')
      Time.new(1, 1, 1, time_hms_arr[0], time_hms_arr[1], time_hms_arr[2])
    end
  end

  def self.add_two_time(time1, time2)
    time1 + time2.sec + time2.min * 60 + time2.hour * 60 * 60
  end

  def self.format_time_object(time_obj)
    if (time_obj.day - 1).nonzero?
      "#{time_obj.day - 1} day & #{time_obj.strftime('%H:%M:%S')}".inspect
    else
      time_obj.strftime('%H:%M:%S').inspect
    end
  end

  def self.add_time(time_array_of_strings)
    if time_array_of_strings.all?(SEARCH_REGEXP)
      time_array = convert_string_to_time(time_array_of_strings)
      time_sum = time_array.inject { |time_acc, time_el| add_two_time(time_acc, time_el) }
      format_time_object(time_sum)
    else
      '"Invalid 24-hour time value"'
    end
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts Time.add_time(ARGV)
end
