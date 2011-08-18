Encoding.default_internal = Encoding.default_external = Encoding::UTF_8 if defined?(Encoding)

require 'rubygems'
require 'rake'
require 'date'

#############################################################################
#
# Helper functions
#
#############################################################################

def name
  "spontaneous"
end

def version
  line = File.read("lib/#{name}/version.rb")[/^\s*VERSION\s*=\s*.*/]
  line.match(/.*VERSION\s*=\s*['"](.*)['"]/)[1]
end

def date
  Date.today.to_s
end

def rubyforge_project
  name
end

def gemspec_file
  "#{name}.gemspec"
end

def gem_file
  "#{name}-#{version}.gem"
end

def replace_header(head, header_name)
  head.sub!(/(\.#{header_name}\s*= ').*'/) { "#{$1}#{send(header_name)}'"}
end

#############################################################################
#
# Standard tasks
#
#############################################################################

task :default => :test

require 'rake/testtask'

$test_glob = nil
if p = ARGV.index('-')
  filenames = ARGV[(p+1)..-1]
  ARGV.slice!((p)..-1)
  $test_glob = filenames.map { |f| "test/**/test_#{f}.rb" }
end

Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.ruby_opts << '-rubygems'
  test.pattern = $test_glob || 'test/{unit,slow,functional,experimental}/test_*.rb'
  # test.pattern = $test_glob || 'test/**/test_*.rb'
  test.verbose = false
end

namespace :test do
  Rake::TestTask.new(:units) do |test|
    test.libs << 'test'
    test.ruby_opts << '-rubygems'
    test.pattern = 'test/unit/**/test_*.rb'
    test.verbose = true
  end

  Rake::TestTask.new(:slow) do |test|
    test.libs << 'test'
    test.ruby_opts << '-rubygems'
    test.pattern = 'test/slow/**/test_*.rb'
    test.verbose = true
  end

  Rake::TestTask.new(:functionals) do |test|
    test.libs << 'test'
    test.ruby_opts << '-rubygems'
    test.pattern = 'test/functional/**/test_*.rb'
    test.verbose = true
  end
  Rake::TestTask.new(:experimental) do |test|
    test.libs << 'test'
    test.ruby_opts << '-rubygems'
    test.pattern = 'test/experimental/**/test_*.rb'
    test.verbose = true
  end
  Rake::TestTask.new(:javascript) do |test|
    test.libs << 'test'
    test.ruby_opts << '-rubygems'
    test.pattern = 'test/javascript/**/test_*.rb'
    test.verbose = true
  end
  Rake::TestTask.new(:ui) do |test|
    test.libs << 'test'
    test.ruby_opts << '-rubygems'
    test.pattern = 'test/ui/**/test_*.rb'
    test.verbose = true
  end
  Rake::TestTask.new(:js) do |test|
    test.libs << 'test'
    test.ruby_opts << '-rubygems'
    test.pattern = 'test/javascript/**/test_*.rb'
    test.verbose = true
  end
end


desc "Generate RCov test coverage and open in your browser"
task :coverage do
  require 'rcov'
  sh "rm -fr coverage"
  sh "rcov test/test_*.rb"
  sh "open coverage/index.html"
end

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "#{name} #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -r ./lib/#{name}.rb"
end

#############################################################################
#
# Custom tasks (add your own tasks here)
#
#############################################################################



#############################################################################
#
# Packaging tasks
#
#############################################################################

require 'tmpdir'
@project_dir = Dir.pwd

namespace :gem do
  desc "Create tag v#{version} and build and push #{gem_file} to Rubygems"
  task :release => :build do
    Dir.chdir(@project_dir)
    unless `git branch` =~ /^\* master$/
      puts "You must be on the master branch to release!"
      exit!
    end
    sh "git commit --allow-empty -a -m 'Release #{version}'"
    sh "git tag v#{version}"
    sh "git push origin master"
    sh "git push origin v#{version}"
    sh "gem push #{@build_dir}/pkg/#{name}-#{version}.gem"
  end

  desc "Build #{gem_file} into the pkg directory"
  task :build => :gemspec do
    sh "mkdir -p pkg"
    sh "gem build #{gemspec_file}"
    sh "mv #{gem_file} pkg"
  end


  desc "Generate #{gemspec_file}"
  task :gemspec => :validate do
    # read spec file and split out manifest section
    spec = File.read(gemspec_file)
    head, manifest, tail = spec.split("  # = MANIFEST =\n")

    # replace name version and date
    replace_header(head, :name)
    replace_header(head, :version)
    replace_header(head, :date)
    #comment this out if your rubyforge_project has a different name
    replace_header(head, :rubyforge_project)

    # determine file list from git ls-files
    files = `git ls-files`.
      split("\n").
      reject { |file| file =~ /^\./ }.
      reject { |file| file =~ /^(rdoc|pkg)/ }
    compressed_assets = Dir["application/{css,js}/min/*.*"]
    files = files.concat(compressed_assets).
      sort.
      map { |file| "    #{file}" }.
      join("\n")

    # piece file back together and write
    manifest = "  s.files = %w[\n#{files}\n  ]\n"
    spec = [head, manifest, tail].join("  # = MANIFEST =\n")
    File.open(gemspec_file, 'w') { |io| io.write(spec) }
    puts "Updated #{gemspec_file}"
  end

  desc "Validate #{gemspec_file}"
  task :validate => :generate do
    libfiles = Dir['lib/*'] - ["lib/#{name}.rb", "lib/#{name}"]
    unless libfiles.empty?
      puts "Directory `lib` should only contain a `#{name}.rb` file and `#{name}` dir."
      # exit!
    end
    unless Dir['VERSION*'].empty?
      puts "A `VERSION` file at root level violates Gem best practices."
      # exit!
    end
  end

  desc "Generate the gemspec file from a template"
  task :generate => :assets do
    template = File.read('spontaneous.gemspec.tmpl')
    require 'bundler'

    File.open('spontaneous.gemspec', 'w') do |gemspec|
      bundler = Bundler.load
      dependencies = bundler.dependencies_for(:default, :runtime).map do |dependency|
        %{s.add_dependency('#{dependency.name}', [#{dependency.requirement.as_list.map { |d| d.inspect }.join(', ')}])}
      end
      development_dependencies = bundler.dependencies_for(:development).map do |dependency|
        %{s.add_development_dependency('#{dependency.name}', [#{dependency.requirement.as_list.map { |d| d.inspect }.join(', ')}])}
      end
      gemspec.write(template % [dependencies.join("\n  "), development_dependencies.join("\n  ")])
    end
  end

  desc "Bundle & compress assets"
  task :assets => :setup do
    app_dir = Spontaneous.application_dir
    bundles = {}
    [Spontaneous::Rack::Assets::JavaScript, Spontaneous::Rack::Assets::CSS].each do |mod|
      mod.constants.map { |const| [const, mod.const_get(const)] }.each do |constant, files|
        source, hash = mod.compress(files)
        if source
          source.force_encoding("UTF-8")
          bundle_url = "min" / "#{hash}"
          bundle_path = File.join(app_dir, mod.filetype, "#{bundle_url}.#{mod.filetype}")
          FileUtils.mkdir_p(File.dirname(bundle_path))
          File.open(bundle_path, 'w', :internal_encoding => Encoding::UTF_8, :external_encoding => Encoding::UTF_8) { |bundle| bundle.write(source) }
          bundles[constant] = bundle_url
        end
      end
    end
    module_path = 'lib/spontaneous/rack/assets.rb'
    module_src = File.read(module_path)
    converted = []
    module_src.lines.each do |line|
      bundles.each do |constant, url|
        line = "#{$1}%w(#{url})\n" if line =~ %r[^( *#{constant}\s*=\s*)(.+)$]
      end
      converted << line
    end
    File.open(module_path, 'w') { |file| file.write(converted.join) }

    module_path = 'lib/spontaneous/version.rb'
    module_src = File.read(module_path)
    converted = []
    module_src.lines.each do |line|
      line = "#{$1}true\n" if line =~ /^(\s*GEM\s*=\s*)(.+)$/
      converted << line
    end
    File.open(module_path, 'w') { |file| file.write(converted.join) }
  end

  task :setup do
    @build_dir = Dir.tmpdir + "/spontaneous"
    FileUtils.rm_r(@build_dir) if File.directory?(@build_dir)
    FileUtils.mkdir_p(@build_dir)
    FileUtils.cp_r(@project_dir+"/.", @build_dir)
    Dir.chdir(@build_dir)
    $:.unshift(@build_dir + "/lib")
    require File.expand_path(@build_dir + '/lib/spontaneous')
  end
end
