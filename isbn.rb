#ISBN10 Application

require 'csv'


def harmony(data)

  if isbn_length(remove_spaces_dashes(data)) != 10 || match_valid(data) == false || match_valid_10(data) == false
    "invalid"
  else
    math(remove_spaces_dashes(data))
  end
end

###############################################################
def math(data)
  pop = data.chop
  s = pop.split(//)
  int = []

  s.each do |i|
      int <<  i.to_i
  end

  product = []
  int.each_with_index do |digit,index|
    product << digit * (index + 1)
  end

  sum = 0
  product.each do |i|
    sum += i
  end

  checksum = sum%11

  isbn = ""

  isbn << pop

  if checksum == 10
    checksum = "x"
    isbn << checksum
  else
    isbn << checksum.to_s
  end


  if isbn[-1] == data[-1]
    res = "valid"
  else
    res = "invalid"
  end
  res
end

##############################################################
def match_valid_10(data)

  data.match?(/[0-9xX]/,9)

end


def match_valid(data)
  arry = data.split(//)
  valid = true
  arry[0..-2].each {|char| valid = false if char.match?(/[0-9\- ]/) == false}
  valid
end
##############################################################
def remove_spaces_dashes(data)
  if data == nil

  else data.gsub(/[- ]/, '')
  end
end
#############################################################
def isbn_length(l)

  if l == nil

  else l.length
  end

end

yay = "valid"
boo = "invalid"
csv_arya = []

counter = 0

arya = CSV.read('input_isbn_file.csv')

arya.each do |row|
    if harmony(row[1])  == "valid"
    csv_arya << row
    csv_arya[counter] << yay
    else harmony(row[1]) == "invalid"
    csv_arya << row
    csv_arya[counter] << boo
    end
    counter+=1
end

CSV.open('results.csv', 'wb') do |csv|

    csv << [csv_arya]

  
end




puts "#{csv_arya}"
