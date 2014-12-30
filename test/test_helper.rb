require 'minitest'
require 'minitest/autorun'
require 'vimrunner'

class Minitest::Test
  def self.prepare_vim
    @@file_name = 'tomdoc.rb'

    @@vim = Vimrunner.start
    @@vim.prepend_runtimepath(File.expand_path('../..', __FILE__))
    @@vim.command('runtime plugin/tomdoc.vim')
  end

  Minitest.after_run do
    @@vim.kill
    File.delete(@@file_name)
  end

  def assert_syntax_in(expected_syntax, pattern, &block)
    edit_with_vim(block.call)

    assert_includes syntax_in(pattern), expected_syntax
  end

  def refute_syntax_in(expected_syntax, pattern, &block)
    edit_with_vim(block.call)

    refute_includes syntax_in(pattern), expected_syntax
  end

  private

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
