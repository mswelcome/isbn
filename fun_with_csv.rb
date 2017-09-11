#Fun with CSV



def fun_with_csv()
  yay = "valid"
  boo = "invalid"
  csv_arya = []

  counter = 0

  arya = CSV.read('input_isbn_file.csv')

  arya.each do |row|
    if harmony(row[1])  == "valid" || h13 == "valid"
    csv_arya << row
    csv_arya[counter] << yay
    else harmony(row[1]) == "invalid" || h13 == "invalid"
    csv_arya << row
    csv_arya[counter] << boo
    end
    counter+=1
  end
  csv_arya

def write_fun_with_csv(csv_arya) 
  CSV.open('results.csv', 'wb') do |csv|

    csv << csv_arya

  end
end
