#ISBN13 Application

def math_13(data)
  pop = data.chop
  int = pop.to_i
  sum = int[0] * 1 + int[1] * 3 + int[2] * 1 + int[3] * 3 + int[4] * 1 + int[5] * 3 + int[6] * 1 + int[7] * 3 + int[8] * 1 + int[9] * 3 + int[10] * 1 + int[11] * 3 + int[12] * 1
  m = sum%10
  res = (10 - m)%10

end


##############################################################
def match_valid_characters_13(data)
  data.match?(/[0-9\'-' ]/)
end
##############################################################
def remove_spaces(data)
  # loop though elements of string - if item is ' ' or - ... remove

  data.delete(" ")

end

def remove_dashes(data)

  data.delete("-")

end
#############################################################
def isbn13_length(data)
  data.length
end
