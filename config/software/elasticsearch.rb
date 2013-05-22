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

name "elasticsearch"
version "0.20.4"

dependencies ["rsync"]

source :url => "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-#{version}.tar.gz",
       :md5 => "0be0d8c2e2519cfaf49892834fe87954"

relative_path "elasticsearch-0.20.4"

build do
  command "mkdir -p #{install_dir}/embedded/service/elasticsearch"
  command "#{install_dir}/embedded/bin/rsync -a ./ #{install_dir}/embedded/service/elasticsearch/"
  command "ln -sf #{install_dir}/embedded/service/elasticsearch/bin/elasticsearch #{install_dir}/embedded/bin/elasticsearch"
  command "rm -f #{install_dir}/embedded/service/elasticsearch/lib/sigar/libsigar-amd64-solaris.so"
end
