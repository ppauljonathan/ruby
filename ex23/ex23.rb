# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here

require 'csv'
class CSV
  def self.read_data_to_hash(path)
    read(path,
         converters: ->(f) { f.strip },
         headers: true,
         header_converters: ->(f) { f.strip.downcase.to_sym })
      .group_by { |elem| elem[:designation] }
  end
end

class FormatCsvToText
  def self.read_from_csv(output_file_path, input_file_path)
    @csv_hash = CSV.read_data_to_hash(input_file_path)
    write_to_file(output_file_path)
  end

  def self.write_to_file(path)
    output_file = File.open(path, 'w')
    begin
      @csv_hash.each do |(key, val)|
        output_file.write("\n#{key}#{'s' if val.length > 1}\n")
        val.each do |emp_data|
          output_file.write("#{emp_data[:name]} (EmpId: #{emp_data[:empid]})\n")
        end
      end
    rescue Errno => e
      puts "error in creating file handle\nError:\n#{e}"
    rescue => e
      output_file.close
      puts "An error occured\nError:\n#{e}"
    else
      output_file.close
      puts 'executed successfully'
    end
  end
end

FormatCsvToText.read_from_csv(__dir__ + '/emp_data.txt',
                              __dir__ + '/employee_db.csv')
