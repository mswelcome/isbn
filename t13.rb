#Testing ISBN13

require "minitest/autorun"
require_relative "isbn13.rb"

class Test_isbn < Minitest::Test

  def test_h13_nonlegalcharacters
    data = "97y 0 13 149505 %"
    goal = "invalid"
    assert_equal(goal, h13(data))
  end

  def test_h13_toomanynums
    data = "9778 0 13 149505 0"
    goal = "invalid"
    assert_equal(goal, h13(data))
  end

  def test_h13_spaces
    data = "978 0 13 149505 0"
    goal = "valid"
    assert_equal(goal, h13(data))
  end

  def test_h13_dashes
    data = "978-0-13-149505-0"
    goal = "valid"
    assert_equal(goal, h13(data))
  end

###############################################################
def test_math_13
  data = "9780470059029"
  goal = "valid"
  assert_equal(goal, math_13(data))
end

#################################################################
def test_match_valid_characters_13_dashes
  data = "978-0-13-149505-0"
  assert_equal(true, match_valid_characters_13(data))
end

def test_match_valid_characters_13_spaces
  data = '978 0 471 48648 0'
  assert_equal(true, match_valid_characters_13(data))
end

  def test_match_valid_characters_13
    data = '9780470059029'
    assert_equal(true, match_valid_characters_13(data))
  end
################################################################
  def test_remove_dashes
    data = "978-0-13-149505-0"
    goal = "9780131495050"
    assert_equal(goal, remove_spaces_dashes(data))
  end

  def test_rm_spaces
    data = "978 0 471 48648 0"
    goal = "9780471486480"
    assert_equal(goal, remove_spaces_dashes(data))
  end
#################################################################
  def test_length_1
    data = '9780470059029'
    goal = 13
    assert_equal(goal, isbn13_length(data))
  end
end
