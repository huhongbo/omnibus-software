#
# Copyright:: Copyright (c) 2012 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "graphite"
version "0.9.10"

dependencies "pip"
dependencies "py2cairo"

env = { "PATH" => "#{install_dir}/embedded/bin:#{ENV["PATH"]}" }

build do
  command "mkdir -p /opt/chef-server/embedded/service/graphite/webapp"
  command "chown -R dntmon:root /opt/chef-server/embedded/service/graphite"
  command "pip install whisper==#{version}", :env => env
  command "pip install carbon==#{version} --install-option=\"--prefix=/opt/chef-server/embedded/service/graphite\" --install-option=\"--install-lib=/opt/chef-server/embedded/service/graphite/lib\"", :env => env
  command "pip install django", :env => env
  command "pip install django-tagging", :env => env
  command "pip install graphite-web==#{version} --install-option=\"--prefix=/opt/chef-server/embedded/service/graphite\" --install-option=\"--install-lib=/opt/chef-server/embedded/service/graphite/webapp\"", :env => env
  command "pip install python-memcached", :env => env
  command "pip install pytz", :env => env
  command "pip install pyparsing", :env => env
end
