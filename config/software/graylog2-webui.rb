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

name "graylog2-webui"
version "0.11.0"

dependencies ["rsync"]

source :url => "http://download.graylog2.org/graylog2-web-interface/graylog2-web-interface-#{version}.tar.gz",
       :md5 => "35d20002dbc7f192a1adbcd9b53b2732"

relative_path "graylog2-web-interface-0.11.0"

build do
  bundle "install --without development test --path=#{install_dir}/embedded/service/gem_dntmon"
  command "mkdir -p #{install_dir}/embedded/service/graylog2-webui"
  command "#{install_dir}/embedded/bin/rsync -a ./ #{install_dir}/embedded/service/graylog2-webui/"
end
