file = File.new('./employee_db.csv', "r")
while line = file.getc
  print line
end
file.close
