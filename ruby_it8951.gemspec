# frozen_string_literal: true

require_relative "lib/ruby_it8951/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_it8951"
  spec.version       = RubyIt8951::VERSION
  spec.authors       = ["yagshi"]
  spec.email         = ["yagshi@live.com"]

  spec.summary       = "Control WaveShare's EPD (e-paper display) with IT-8951 controller"
  spec.description   = "This is a very simple gem to handle several IT-8951 based EPDs.  It simply transfers image data, and update EPD screen of specific area."
  spec.homepage      = "https://github.com/yagshi/ruby_it8951"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

#  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yagshi/ruby_it8951"
  spec.metadata["changelog_uri"] = "https://github.com/yagshi/ruby_it8951"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
