#Fun with CSV

require 'csv'
require_relative 'isbn.rb'
require_relative 'isbn13'


def fun_with_csv()
  yay = "valid"
  boo = "invalid"
  csv_arya = []

  counter = 0

  arya = CSV.read('input_isbn_file.csv', headers: true)

  arya.each do |row|
    if harmony(row[1])  == "valid" || h13(row[1]) == "valid"
    csv_arya << row
    csv_arya[counter] << yay
    else harmony(row[1]) == "invalid" || h13(row[1]) == "invalid"
    csv_arya << row
    csv_arya[counter] << boo
    end
    counter+=1
    end
  csv_arya
end

def write_fun_with_csv(csv_arya)
  CSV.open('mswresults.csv', 'wb') do |csv|
    csv << ["Item ", "ISBN ", "Validation " ]
    csv << csv_arya
    
  end
end

write_fun_with_csv(fun_with_csv())
