#ISBN13 Application

def harmony(data)
    if isbn13_length(remove_spaces_dashes(data)) != 13 || match_valid_characters_13(data) == false
      puts "Not a valid ISBN13"
    else
      math_13(remove_spaces_dashes(data))
    end
end
##############################################################
def math_13(data)
  pop = data.chop
  isbn = ""
  sum = pop[0].to_i * 1 + pop[1].to_i * 3 + pop[2].to_i * 1 + pop[3].to_i * 3 + pop[4].to_i * 1 + pop[5].to_i * 3 + pop[6].to_i * 1 + pop[7].to_i * 3 + pop[8].to_i * 1 + pop[9].to_i * 3 + pop[10].to_i * 1 + pop[11].to_i * 3 + pop[12].to_i * 1
  m = sum%10
  res = (10 - m)%10
  isbn << pop
  isbn << res.to_s
  return isbn
end
##############################################################
def match_valid_characters_13(data)
  data.match?(/[0-9\'-' ]/)
end
##############################################################
def remove_spaces_dashes(data)
  data.gsub(/[- ]/, '')
end
#############################################################
def isbn13_length(data)
  data.length
end
