source 'https://rubygems.org'

group :test, :development do
  gem 'rake'
end

group :test do
  gem 'berkshelf',  '~> 4.0'
  gem 'foodcritic', '~> 5.0'
  gem 'rubocop',    '~> 0.23'

  gem 'test-kitchen', '~> 1.2'
  gem 'kitchen-ec2',  '~> 0.10'
end

group :test, :local do
  gem 'stove',           '~> 3.2'
  gem 'kitchen-vagrant', '~> 0.15'
end
