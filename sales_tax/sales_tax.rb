YESREGEX = /^y|yes$/

class TaxCalculator
  def self.calc_sales_tax(is_valid, cost)
    is_valid ? 0.0 : cost / 10.0
  end

  def self.calc_import_duty(is_valid, cost)
    is_valid ? cost / 20.0 : 0.0
  end
end

class Product
  def get_item_details
    print "\nName of the product: "
    @item_data.push(gets.chomp)
    print 'Imported?: '
    @item_data.push((gets.chomp =~ YESREGEX).is_a? Integer)
    print 'Exempted from sales tax?: '
    @item_data.push((gets.chomp =~ YESREGEX).is_a? Integer)
    print 'Price: '
    @item_data.push(gets.chomp.to_f)
    @item_data
  end

  def calc_sub_total
    @item_data[1] + @item_data[2] + @item_data[3]
  end

  def initialize
    @item_data = []
    get_item_details
    @item_data[2] = TaxCalculator.calc_sales_tax(@item_data[2], @item_data[3])
    @item_data[1] = TaxCalculator.calc_import_duty(@item_data[1], @item_data[3])
    @item_data.push(calc_sub_total)
  end

  def display
    @item_data.each { |data_point| print data_point.to_s.ljust(15) }
    puts
  end
end


class RateList
  def initialize
    enter_more = 'yes'
    @rate_list_data = []
    while enter_more =~ YESREGEX
      @rate_list_data.push(Product.new())
      print'Do you want to add more items to your list(y/n): '
      enter_more = gets.chomp
    end
  end

  def calc_grand_total
    total = 0
    @rate_list_data.each { |elem| total += elem.calc_sub_total }
    total
  end

  def display
    puts "\nRate List"
    puts "ITEM".ljust(15) + "SALES_TAX".ljust(15) + "IMPORT_DUTY".ljust(15) + "PRICE".ljust(15) + "SUB_TOTAL".ljust(15)
    @rate_list_data.each { |elem| elem.display }
    puts "".ljust(45) + "GRAND_TOTAL".ljust(15) + calc_grand_total.to_i.to_f.to_s.ljust(15)
  end
end

RateList.new().display
