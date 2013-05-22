name "geminabox"
version "0.7.0"

dependencies ["rubygems"]

env = { "GEM_HOME" => nil, "GEM_PATH" => nil }

build do
  gem "install geminabox --no-rdoc --no-ri -v #{version}", :env => env
end
