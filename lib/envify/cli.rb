# frozen_string_literal: true

module Envify
  class Cli < Thor
    def self.exit_on_failure?
      true
    end

    class_option :destination, aliases: '-d',
                               desc: 'Specify destination to be used for generating .env file (staging -> env.staging)'

    method_options alias: 'g'
    desc 'generate', 'Create .env by evaluating .env.erb (or .env.staging.erb -> .env.staging when using -d staging)'
    def generate
      if destination = options[:destination]
        env_template_path = ".env.#{destination}.erb"
        env_path          = ".env.#{destination}"
      else
        env_template_path = '.env.erb'
        env_path          = '.env'
      end

      File.write(env_path, ERB.new(File.read(env_template_path), trim_mode: '>').result, perm: 0o600)
    end
  end
end
