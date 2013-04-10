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
       :md5 => "fad9311718aa86dda881c0668c78e377"

relative_path "mcollective-2.2.3"

build do
  command "#{install_dir}/embedded/bin/rsync -a ./bin/ #{install_dir}/embedded/bin/"
  command "#{install_dir}/embedded/bin/rsync -a ./lib/ #{install_dir}/embedded/lib/ruby/1.9.1/"
end
