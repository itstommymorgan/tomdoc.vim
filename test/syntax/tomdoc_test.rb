require 'test_helper'

class TomdocSyntax < Minitest::Test
  prepare_vim

  def initialize(*)
    @code_snippet = <<-EOF
    # Public: Do something.
    #
    # argument - this is an argument.
    #
    # Examples
    #
    #   method(argument) # this is an example
    #
    # Returns Nothing.
    EOF

    @text_snippet = <<-EOF
    Public: Do something.

    argument - this is an argument.

    Examples

      method(argument) # this is an example

    Returns Nothing.
    EOF

    super
  end

  def test_file_syntax
    assert_file_syntax_include 'tomdoc' do
      @code_snippet
    end
  end

  def test_highlight_tomdocDescriptions_inside_comments
    assert_syntax_in 'tomdocDescriptions', 'Public:' do
      @code_snippet
    end
  end

  def test_does_not_highlight_tomdocDescriptions_outside_comments
    refute_syntax_in 'tomdocDescriptions', 'Public:' do
      @text_snippet
    end
  end

  def test_highlight_tomdocArguments_inside_comments
    assert_syntax_in 'tomdocArguments', 'argument' do
      @code_snippet
    end
  end

  def test_does_not_highlight_tomdocArguments_outside_comments
    refute_syntax_in 'tomdocArguments', 'argument' do
      @text_snippet
    end
  end

  def test_highlight_tomdocKeywords_inside_comments
    assert_syntax_in 'tomdocKeywords', 'Returns' do
      @code_snippet
    end
  end

  def test_does_not_highlight_tomdocKeywords_outside_comments
    refute_syntax_in 'tomdocKeywords', 'Returns' do
      @text_snippet
    end
  end
end
