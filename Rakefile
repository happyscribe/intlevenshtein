begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "levenshteint"
    gemspec.summary = "A levenshtein distance calculator for arrays of integers"
    gemspec.description = "Provides a fast, cross-Ruby implementation of the levenshtein distance algorithm for arrays of integers."
    gemspec.authors = ["Albert Segarra"]
    gemspec.add_dependency "ffi", '~> 1.9'
    gemspec.add_development_dependency "rspec", '~> 2.99'
    gemspec.add_development_dependency "jeweler", '~> 2.0'
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

