# frozen_string_literal: true

require 'test_helper'

class TestEnvify < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Envify::VERSION
  end

  def test_it_generates_new_env_file
    generated_file = '.env.example'

    File.delete(generated_file) if File.exist?(generated_file)

    Envify::Cli.start(['generate', '-d', 'example'])

    assert_equal File.read(generated_file), "HELLO=world\n"
  ensure
    # clean up the generated file
    File.delete(generated_file)
  end
end
