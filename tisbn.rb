#Testing ISBN Application

require "minitest/autorun"
require_relative "isbn.rb"

class Test_isbn < Minitest::Test

#################################################################
  def test_length_fail
    l = "0123456789"
    assert_equal(7, isbn_length(l))
  end

  def test_length_pass
    l = "0123456789"
    assert_equal(10, isbn_length(l))
  end
#################################################################
  def test_remove_dashes
    data = "0-321-14653-0"
    goal = "0321146530"
    assert_equal(goal, remove_spaces(data))
  end

  def test_rm_spaces
    isbn = "0 321 14653 0"
    goal = "0321146530"
    assert_equal(goal, remove_dashes(isbn))
  end
################################################################
  #def test_
end
