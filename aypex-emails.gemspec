require_relative "lib/aypex/emails/version"

Gem::Specification.new do |spec|
  spec.name = "aypex-emails"
  spec.version = Aypex::Emails::VERSION
  spec.authors = ["Matthew Kennedy"]
  spec.email = ["m.kennedy@me.com"]
  spec.homepage = "https://github.com/aypex-io/aypex-emails"
  spec.summary = "Transactional emails for Aypex eCommerce platform"
  spec.description = "Optional transactional emails for Aypex such as Order placed or Shipment notification emails"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'".

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/aypex-io/aypex-emails/tree/v#{spec.version}"
  spec.metadata["changelog_uri"] = "https://github.com/aypex-io/aypex-emails/releases/tag/v#{spec.version}"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "aypex"
  spec.add_dependency "actionmailer"

  spec.add_development_dependency "aypex_dev_tools"
end
