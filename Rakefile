# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'dm-echo-adapter'

task :default => 'spec:run'

PROJ.name = 'dm-echo-adapter'
PROJ.authors = 'Paul Sadauskas'
PROJ.email = 'psadauskas@gmail.com'
PROJ.url = 'http://github.com/paul/dm-echo-adapter'
PROJ.version = DataMapper::Adapters::EchoAdapter::VERSION
PROJ.rubyforge.name = 'dm-echo-adapter'

PROJ.spec.opts << '--color'

# EOF
