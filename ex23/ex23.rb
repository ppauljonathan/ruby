# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here

require 'csv'

module FormatCsvToText
  def data_hashed_by_job
    @file_data.group_by { |elem| elem[:designation] }
  end

  def write_to_file
    @file_data = CSV.read('./employee_db.csv',
                          converters: ->(f) { f.strip },
                          headers: true,
                          header_converters: ->(f) { f.strip.downcase.to_sym })
    data_hashed_by_job.each do |(key, val)|
      write("\n#{key}#{'s' if val.length > 1}\n")
      val.each do |emp_data|
        write("#{emp_data[:name]} (EmpId: #{emp_data[:empid]})\n")
      end
    end
  end
end

class File
  include FormatCsvToText
end

file_to_write = File.open('./emp_data.txt', 'w')
begin
  file_to_write.write_to_file
rescue Errno => e
  puts "error in creating file handle\nError:\n#{e}"
rescue StandardError => e
  file_to_write.close
  puts "An error occured\nError:\n#{e}"
else
  file_to_write.close
  puts 'Executed successfully'
end
