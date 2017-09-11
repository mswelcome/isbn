#Testing ISBN13 Application

require "minitest/autorun"
require_relative "isbn.rb"

class Test_isbn < Minitest::Test

  def test_harmony3
    data = "%877195869"
    goal = "invalid"
    assert_equal(goal, harmony(data))
  end

  def test_harmony2
    data = "877195869x"
    assert_equal("valid", harmony(data))
  end

  def test_harmony1
    data = "0321146530"
    assert_equal("valid", harmony(data))

  end

##################################################################
  def test_math_x
    data = "877195869x"
    assert_equal("valid", math(data))
  end

  def test_math
    data = "0321146530"
    assert_equal("valid", math(data))
  end
################################################################
  def test_match_invalid
    data = "r321146430"
    goal = false
    assert_equal(goal, match_valid(data))
  end

  def test_match_valid
    data = "0321146430"
    assert_equal(true, match_valid(data))
  end

  def test_match_valid_10_false
    data = "032114643t"
    goal = false
    assert_equal(goal, match_valid_10(data))
  end

  def test_match_valid_10
    data = "032114643x"
    assert_equal(true, match_valid_10(data))
  end
################################################################

  def test_remove_dashes
    data = "0-321-14653-0"
    goal = "0321146530"
    assert_equal(goal, remove_spaces_dashes(data))
  end

  def test_rm_spaces
    data = "0 321 14653 0"
    goal = "0321146530"
    assert_equal(goal, remove_spaces_dashes(data))
  end
#################################################################

  def test_length_fail
    l = "0123456789"
    assert_equal(7, isbn_length(l))
  end

  def test_length_pass
    l = "0123456789"
    assert_equal(10, isbn_length(l))
  end
end
