require 'csv'

class Employee
  def self.read_csv_data(path)
    CSV.read(path,
         converters: ->(f) { f.strip },
         headers: true,
         header_converters: ->(f) { f.strip.downcase.to_sym })
  end

  def self.write_details_to_file(path, details)
    File.open(path, 'w') do |output_file|
      details.each do |(desig, val)|
        output_file.write("\n#{desig}#{'s' if val.length > 1}\n")
        val.each { |emp_data| output_file.write("#{emp_data[:name]} (EmpId: #{emp_data[:empid]})\n") }
      end
    end
  end

  def self.get_data_from_csv_file(input_path, output_path)
    csv_data_hash = read_csv_data(input_path).group_by { |elem| elem[:designation] }.sort.to_h
    write_details_to_file(output_path, csv_data_hash)
  end
end
Employee.get_data_from_csv_file('./employee_db.csv', './emp_data.txt')
