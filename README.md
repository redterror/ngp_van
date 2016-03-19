# The NGP VAN Ruby Gem

An unofficial Ruby wrapper for the [NGP VAN](http://developers.everyaction.com/) RESTful API.

## Quick start

Install via Rubygems:

```ruby
gem install ngp_van
```

Or add this line to your application's Gemfile:

```ruby
gem 'ngp_van'
```

## Configuration

NGP VAN can be configured using a block:

```ruby
NgpVan.configure do |config|
  config.application_name = 'MyCampaign2016'

  # See http://developers.everyaction.com/van-api#van-authentication
  config.api_key = '7285b15a-4d06-44da-8862-d9ff34ca7684|1'

  # Defaults to "https://api.securevan.com/v4/"
  config.api_endpoint = 'https://intlapi.securevan.com/v4'

  # Defaults to "NGP VAN Ruby Gem #{NgpVan::VERSION}"
  config.user_agent = 'CustomUserAgent'
end
```

Options can also be set on the configuration object:

```ruby
% NgpVan.configuration.api_key = '7285b15a-4d06-44da-8862-d9ff34ca7684|1'
# => "7285b15a-4d06-44da-8862-d9ff34ca7684|1"
```


## Development

After checking out the repo, run `rake spec` to run the tests.

A console task has also been provided to automatically load the NGP Van environment. Run `bin/console` for an interactive prompt that will allow you to experiment.

```ruby
% bin/console
[1] pry(main)> NgpVan::VERSION
# => "x.x.x"
[2] pry(main)> NgpVan.configuration.application_name = 'MyCampaignApplication'
# => "MyCampaignApplication"
[3] pry(main)> NgpVan.configuration.api_key = 'EA051D3A-5B2F-4AC8-BD4F-A48045069FA5|1'
# => "EA051D3A-5B2F-4AC8-BD4F-A48045069FA5|1"
[3] pry(main)> NgpVan.district_fields
# => [
#      {"districtFieldId"=>1, "name"=>"State", "parentFieldId"=>nil...,
#      {"districtFieldId"=>2, "name"=>"County", "parentFieldId"=>1...
#    ]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/christopherstyles/ngp_van.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

