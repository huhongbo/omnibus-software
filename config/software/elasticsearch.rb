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
version "0.20.2"

dependencies ["rsync"]

source :git => "git://github.com/medcl/elasticsearch-rtf.git"

relative_path "elasticsearch-rtf"

build do
  command "mkdir -p #{install_dir}/embedded/service/elasticsearch"
  command "#{install_dir}/embedded/bin/rsync -a --delete --exclude=.git/*** --exclude=.gitignore ./elasticsearch/ #{install_dir}/embedded/service/elasticsearch/"
end
