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

name "logstash"
version "1.1.9"

source :url => "https://logstash.objects.dreamhost.com/release/logstash-1.1.9-monolithic.jar",
       :md5 => "70addd3ccd37e796f473fe5647c31126"

relative_path "logstash-1.1.9"

build do
  command "mkdir -p #{install_dir}/embedded/service/logstash/tmp"
  command "cp logstash-1.1.9-monolithic.jar #{install_dir}/embedded/service/logstash"
  command "cd #{install_dir}/embedded/service/logstash;ln -sf logstash-1.1.9-monolithic.jar logstash.jar"
end
