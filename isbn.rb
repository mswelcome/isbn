#ISBN10 Application

def harmony(data)

  if isbn_length(data) != 10
    puts "Not an ISBN10 number!"
  else
    match_valid(data)
    match_valid_10(data)
    math(data)
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

  return isbn

end

##############################################################
def match_valid_10(isbn)

  isbn.match?(/[0-9xX]/,9)

end


def match_valid(isbn)

  isbn.match?(/[0-9\'-'\ ]/)

end
##############################################################
def remove_spaces(isbn)
  # loop though elements of string - if item is ' ' or - ... remove

  isbn.delete(" ")

end

def remove_dashes(isbn)

  isbn.delete("-")

end

#############################################################
def isbn_length(l)

  l.length

end
