# frozen_string_literal: true

require_relative 'lib/envify/version'

Gem::Specification.new do |spec|
  spec.name = 'envify'
  spec.version = Envify::VERSION
  spec.authors = ['Richard Hao']
  spec.email = ['richard@0xdev.dev']

  spec.summary = 'Create .env by evaluating .env.erb'
  spec.description = 'Create .env by evaluating .env.erb (or .env.staging.erb -> .env.staging when using -d staging)'
  spec.homepage = 'https://0xdev.dev'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2'

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.executables = %w[envify]
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'erb', '~> 4.0'
  spec.add_dependency 'thor', '~> 1.2'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end