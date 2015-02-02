require 'minitest'
require 'minitest/autorun'
require 'vimrunner'

class Minitest::Test
  def self.prepare_vim
    @@file_name = 'tomdoc.rb'

    @@vim = Vimrunner.start
    @@vim.prepend_runtimepath(File.expand_path('../..', __FILE__))
    @@vim.command('runtime after/plugin/tomdoc.vim')
  end

  Minitest.after_run do
    @@vim.kill
    if File.exists?(@@file_name)
      File.delete(@@file_name)
    end
  end

  # Public: assert the expected syntax is applied in the given pattern, within
  # the text in the block.
  #
  # expected_syntax - The syntax name that will be asserted.
  # pattern         - The pattern where the expected_syntax must be applied.
  # block           - The code snippet where the pattern will search.
  #
  # Examples
  #
  #    assert_syntax_in 'tomdocKeywords', 'Returns' do
  #      # Returns nothing.
  #    end
  #
  # Returns nothing.
  def assert_syntax_in(expected_syntax, pattern, &block)
    edit_with_vim(block.call)

    assert_includes syntax_in(pattern), expected_syntax
  end

  # Public: refute the expected syntax is applied in the given patter, within
  # the text in the block.
  #
  # expected_syntax - The syntax name that will be asserted.
  # pattern         - The pattern where the expected_syntax must be applied.
  # block           - The code snippet where the pattern will search.
  #
  # Examples
  #
  #    refute_syntax_in 'tomdocKeywords', 'Returns' do
  #      Returns nothing.
  #    end
  #
  # Returns nothing.
  def refute_syntax_in(expected_syntax, pattern, &block)
    edit_with_vim(block.call)

    refute_includes syntax_in(pattern), expected_syntax
  end

  # Public: assert the file syntaxes include the given syntax.
  #
  # syntax_name - The syntax name that must be included in the file syntaxes.
  #
  # Examples
  #
  #    assert_file_syntax_include 'tomdoc' do
  #      # Public: this is a method.
  #    end
  #
  # Returns nothing.
  def assert_file_syntax_include(syntax_name, &block)
    edit_with_vim(block.call)

    assert_includes file_syntaxes.split('.'), syntax_name
  end

  private

  def file_syntaxes
    @@vim.echo "&syntax"
  end

  def syntax_in(pattern)
    @@vim.search pattern
    @@vim.echo <<-EOF
       map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    EOF
  end

  def edit_with_vim(code)
    File.open(@@file_name, 'w') { |f| f.write code }

    @@vim.edit @@file_name
  end
end
