require 'test_helper'

class TomdocSyntax < Minitest::Test
  prepare_vim

  def test_highlight_tomdocKeywords_inside_comments
    assert_syntax_in 'tomdocKeywords', 'Returns' do
      "# Returns something"
    end
  end

  def test_does_not_highlight_tomdocKeywords_outside_comments
    refute_syntax_in 'tomdocKeywords', 'Returns' do
      "Returns something"
    end
  end

  def test_highlight_tomdocDescriptions_inside_comments
    assert_syntax_in 'tomdocDescriptions', 'Public:' do
      "# Public: Do something."
    end
  end

  def test_does_not_highlight_tomdocDescriptions_outside_comments
    refute_syntax_in 'tomdocDescriptions', 'Public:' do
      "Public: Do something."
    end
  end

  def test_highlight_tomdocArguments_inside_comments
    assert_syntax_in 'tomdocArguments', 'argument' do
      "# argument - this is important"
    end
  end

  def test_does_not_highlight_tomdocArguments_outside_comments
    refute_syntax_in 'tomdocArguments', 'argument\ 1' do
      "argument - this is important"
    end
  end
end
