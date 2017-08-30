#ISBN Application

#def include(isbn)



#end
##############################################################
def remove_spaces(isbn)
  # loop though elements of string - if item is ' ' or - ... remove

  isbn.gsub(/[" "]/, "")

end

def remove_dashes(isbn)

  isbn.gsub(/[-]/, "")

end

#############################################################
def isbn_length(l)

  l.length

end
