# Envify

Create `.env` by evaluating `.env.erb` (or `.env.staging.erb -> .env.staging` when using `-d staging`)

## Installation

```bash
gem install envify
```

## Usage

```bash
envify generate -d example
```

or

```bash
envify g -d example
```

## Example

- Bitwarden

```shell
<% if (session_token=`bw unlock --raw`.strip) != "" %>
YOUR_SECRET=<%= `bw get notes 000000000000000-000000-11111-1111-22222222222222 --session #{session_token}` %>
<% else raise ArgumentError, "session_token token missing" end %>
```

- 1password

```shell
<% if (session_token = `op signin --account my-one-password-account --raw`.strip) != "" %>
GITHUB_TOKEN=<%= `gh config get -h github.com oauth_token`.strip %>
YOUR_SECRET=<%= `op read "op://Vault/My App/YOUR_SECRET" -n --session #{session_token}` %>
<% else raise ArgumentError, "Session token missing" end %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/0xRichardH/envify.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
