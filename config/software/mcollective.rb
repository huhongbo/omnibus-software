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

name "mcollective"
version "2.2.3"

dependencies ["rsync"]

source :url => "http://puppetlabs.com/downloads/mcollective/mcollective-2.2.3.tgz",
       :md5 => "a40cc0f4cfd8ba5c85df508588d48e5c"

relative_path "mcollective-2.2.3"

build do
  command "mkdir -p #{install_dir}/embedded/service/mcollective"
  command "#{install_dir}/embedded/bin/rsync -a ./ #{install_dir}/embedded/service/mcollective/"
  %w{mc-call-agent mco mcollectived}.each do |cmd|
    command "ln -sf #{install_dir}/embedded/service/mcollective/bin/#{cmd} #{install_dir}/embedded/bin/#{cmd}"
  end
  command "cp -rp #{install_dir}/embedded/service/mcollective/lib/* #{install_dir}/embedded/lib/ruby/1.9.1/"
end
