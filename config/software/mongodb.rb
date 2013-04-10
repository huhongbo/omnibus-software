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

name "mongodb"
version "2.4.1"

dependencies ["rsync"]

source :url => "http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.1.tgz",
       :md5 => "26e54099e598e7689a2cf496a0b9567b"

relative_path "mongodb-2.4.1"

build do
  command "mkdir -p #{install_dir}/embedded/service/mongodb"
  command "#{install_dir}/embedded/bin/rsync -a ./ #{install_dir}/embedded/service/mongodb/"

  %w{bsondump mongo mongod mongodump mongoexport mongofiles mongoimport mongooplog mongoperf mongorestore mongos mongosniff mongostat mongotop}.each do |cmd|
    command "ln -sf #{install_dir}/embedded/service/mongodb/bin/#{cmd} #{install_dir}/embedded/bin/#{cmd}"
  end
end
