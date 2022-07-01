class RateList
  YESREGEX = /^y|yes$/

  def get_item_details
    item_data = []
    print "\nName of the product: "
    item_data.push(gets.chomp)
    print 'Imported?: '
    item_data.push((gets.chomp =~ YESREGEX).is_a? Integer)
    print 'Exempted from sales tax?: '
    item_data.push((gets.chomp =~ YESREGEX).is_a? Integer)
    print 'Price: '
    item_data.push(gets.chomp.to_f)
    item_data
  end

  def initialize
    enter_more = 'yes'
    @rate_list_data = []
    while enter_more =~ YESREGEX
      @rate_list_data.push(get_item_details)
      print'Do you want to add more items to your list(y/n): '
      enter_more = gets.chomp
    end
  end

  def calc_sales_tax
    @rate_list_data.each do |item_data|
      if !item_data[2]
        item_data[2] = item_data[3] / 10.0
      else
        item_data[2] = 0.0
      end
    end
  end

  def calc_import_duty
   @rate_list_data.each do |item_data|
      if item_data[1]
        item_data[1] = item_data[3] / 20.0
      else
        item_data[1] = 0.0
      end
    end
  end

  def calc_sub_total
   @rate_list_data.each { |item_data| item_data.push(item_data[1] + item_data[2] +item_data[3]) }
  end

  def calc_grand_total
    total = 0
    @rate_list_data.each { |elem| total += elem[4] }
    total
  end

  def display
    calc_sales_tax
    calc_import_duty
    calc_sub_total
    puts "\nRate List"
    puts "ITEM".ljust(15) + "SALES_TAX".ljust(15) + "IMPORT_DUTY".ljust(15) + "PRICE".ljust(15) + "SUB_TOTAL".ljust(15)
    @rate_list_data.each do |item_data|
      item_data.each { |data_point| print data_point.to_s.ljust(15) }
      puts
    end
    puts "".ljust(45) + "GRAND_TOTAL".ljust(15) + calc_grand_total.to_i.to_f.to_s.ljust(15)
  end
end

rate_list = RateList.new()
rate_list.display
