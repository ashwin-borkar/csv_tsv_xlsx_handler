# frozen_string_literal: true

require_relative "lib/csv_tsv_xlsx_handler/version"

Gem::Specification.new do |spec|
  spec.name = "csv_tsv_xlsx_handler"
  spec.add_runtime_dependency "rubyXL"
  spec.version = CsvTsvXlsxHandler::VERSION
  spec.authors = ["Ashwin Borkar"]
  spec.email = ["ashwinborkar1997@gmail.com"]
  spec.homepage = "https://github.com/ashwin-borkar/csv_tsv_xlsx_handler"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ashwin-borkar/csv_tsv_xlsx_handler"
  spec.metadata["bug_tracker_uri"] = "https://github.com/ashwin-borkar/csv_tsv_xlsx_handler/issues"
  spec.summary = "A Ruby gem for handling CSV, TSV, and XLSX file formats efficiently."
  spec.description = "This gem provides easy-to-use utilities for reading, writing, and processing CSV, TSV, and XLSX files in Ruby applications. It simplifies the task of handling these common data formats, allowing you to seamlessly work with structured data in your Ruby projects."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"  # Default RubyGems server Make sure to update the homepage and allowed_push_host fields according to your gem’s
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

