require 'csv'

class FormatCsvToText
  def format
    file_data = CSV.read('./employee_db.csv', converters: lambda { |f| f.strip })[1..]
    hash_by_job = file_data.group_by { |elem| elem[2] }
    file_to_write = File.new('./employee_data.txt', "w")
    begin
      hash_by_job.each do |(k, v)|
        file_to_write.write("\n#{k}#{'s' if v.length > 1}\n")
        v.each do |emp_data|
          file_to_write.write("#{emp_data[0]} (EmpId: #{emp_data[1]})\n")
        end
      end
    rescue
      msg = "an Error occured"
    else
      msg = "executed successfully"
    end
    file_to_write.close
    msg
  end
end


puts FormatCsvToText.new.format
