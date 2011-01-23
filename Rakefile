require "rubygems"
require "rake/gempackagetask"
require "rake/rdoctask"
require "spec"
require "spec/rake/spectask"

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = %w(--format specdoc --colour)
  t.libs = ["spec"]
end

task :default => ["spec"]

spec = Gem::Specification.new do |s|
  s.name              = "rspec-multi-mock"
  s.version           = "0.1.0"
  s.summary           = "Multiple mock frameworks support for RSpec"
  s.description       = "Allows multiple mock frameworks to be in action in RSpec"
  s.author            = "Deepak N"
  s.email             = "endeep123@gmail.com"
  s.homepage          = "http://github.com/endeepak/rspec-multi-mock"
  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.rdoc)
  s.rdoc_options      = %w(--main README.rdoc)
  s.files             = %w(README.rdoc) + Dir.glob("{spec,lib/**/*}")
  s.require_paths     = ["lib"]
  s.add_development_dependency("rspec", "=1.3.1")
  s.add_development_dependency("mocha", "=0.9.8")
  s.add_development_dependency("not_a_mock", "=1.0.1")
  s.add_development_dependency("rr", "=1.0.2")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

desc "Install the gem locally"
task :install => :gem do
  sh %{gem install pkg/#{spec.name}-#{spec.version}}
end

desc "Uninstall the gem"
task :uninstall do
  sh %{gem uninstall #{spec.name}}
end

task :package => :gemspec

Rake::RDocTask.new do |rd|
  rd.rdoc_files.include("lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end
