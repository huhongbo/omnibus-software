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

name "graylog2"
version "0.12.0"

dependencies ["rsync"]

source :url => "https://github.com/Graylog2/graylog2-server/releases/download/#{version}/graylog2-server-#{version}.tar.gz",
       :md5 => "31886d2b68da880a59c44ce4e9e3c734"

relative_path "graylog2-server-#{version}"

build do
  command "mkdir -p #{install_dir}/embedded/service/graylog2"
  command "#{install_dir}/embedded/bin/rsync -a ./ #{install_dir}/embedded/service/graylog2/"

  %w{graylog2ctl}.each do |cmd|
    command "ln -sf #{install_dir}/embedded/service/graylog2/bin/#{cmd} #{install_dir}/embedded/bin/#{cmd}"
  end
end
