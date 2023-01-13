source "https://rubygems.org"

platforms :jruby do
  gem "jruby-openssl"
end

platforms :ruby do
  if ENV["DB"] == "mysql"
    gem "mysql2"
  else
    gem "pg", "~> 1.1"
  end
end

group :test, :development do
  gem "aypex_dev_tools", github: "aypex-io/aypex_dev_tools"
  gem "debug"
  gem "email_spec"
  gem "propshaft"
end

aypex_opts = {github: "aypex-io/aypex"}
gem "aypex", aypex_opts

gemspec
