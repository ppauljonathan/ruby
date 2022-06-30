require 'csv'
file_data = CSV.read('./employee_db.csv',
                    headers: true,
                    header_converters: :symbol)
p file_data.group_by { |elem| elem[2] }[" Developer"].to_a
file_to_write = File.new('./employee_data.txt', "w")

file_to_write.close
