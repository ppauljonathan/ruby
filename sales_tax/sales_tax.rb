# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
YES_REGEX = /^y|yes$/

class TaxCalculator
  def self.calc_sales_tax(is_valid, cost)
    is_valid ? 0.0 : cost / 10.0
  end

  def self.calc_import_duty(is_valid, cost)
    is_valid ? cost / 20.0 : 0.0
  end
end

class Product
  def initialize
    @details = []
    input_details
    calculate_tax
  end

  def input_details
    print "\nName of the product: "
    @details.push(gets.chomp)
    print 'Imported?: '
    @details.push(((gets.chomp =~ YES_REGEX).is_a? Integer))
    print 'Exempted from sales tax?: '
    @details.push(((gets.chomp =~ YES_REGEX).is_a? Integer))
    print 'Price: '
    @details.push(gets.chomp.to_f)
  end

  def calc_sub_total
    @details[1] + @details[2] + @details[3]
  end

  def calculate_tax
    @details[2] = TaxCalculator.calc_sales_tax(@details[2], @details[3])
    @details[1] = TaxCalculator.calc_import_duty(@details[1], @details[3])
    @details.push(calc_sub_total)
  end

  def to_s
    output = ''
    @details.each { |data_point| output << data_point.to_s.ljust(15) }
    output << "\n"
  end
end

class RateList
  def initialize
    @rate_list_data = []
    generate_rate_list
    calc_grand_total
  end

  def generate_rate_list
    enter_more = 'yes'
    while enter_more =~ YES_REGEX
      @rate_list_data.push(Product.new)
      print'Do you want to add more items to your list(y/n): '
      enter_more = gets.chomp
    end
  end

  def calc_grand_total
    total = 0
    @rate_list_data.each { |elem| total += elem.calc_sub_total }
    total
  end

  def to_s
    output = ''
    output << "\nRate List\n"
    output << 'ITEM'.ljust(15) + 'SALES_TAX'.ljust(15) + 'IMPORT_DUTY'.ljust(15) + 'PRICE'.ljust(15) + 'SUB_TOTAL'.ljust(15) + "\n"
    @rate_list_data.each { |item| output <<  item.to_s }
    output << ''.ljust(45) + 'GRAND_TOTAL'.ljust(15) + calc_grand_total.to_i.to_f.to_s.ljust(15)
  end
end

puts RateList.new
