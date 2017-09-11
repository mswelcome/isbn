 #ISBN13 Application

require 'csv'



def h13(data)
    if isbn13_length(remove_spaces_dashes(data)) != 13 || match_valid_characters_13(data) == false
      "invalid"
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


  if isbn[-1] == data[-1]
    "valid"
  else
    "invalid"
  end

end
##############################################################
def match_valid_characters_13(data)
  arya = data.split(//)
  valid = true
  arya[0..-2].each {|char| valid = false if char.match?(/[0-9- ]/) == false}
  valid
end
##############################################################
def remove_spaces_dashes(data)
  data.gsub(/[- ]/, '')
end
#############################################################
def isbn13_length(data)
  data.length
end
