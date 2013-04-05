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

name "openresty"
version "1.2.7.1"

dependencies ["pcre", "openssl", "zlib"]

source :url => "http://agentzh.org/misc/nginx/ngx_openresty-1.2.7.1.tar.gz",
       :md5 => "87e51a962a9cc911ba85dfc95d671117"

relative_path "ngx_openresty-1.2.7.1"

build do
  # Openresty configure does not pass ld-opt as comma-delimited
  patch :source => 'openresty-1.2.7.1-configure-fixes.patch',
        :target => "./configure"

  command ["./configure",
           "--prefix=#{install_dir}/embedded",
           "--sbin-path=#{install_dir}/embedded/sbin/nginx",
           "--conf-path=#{install_dir}/embedded/conf/nginx.conf",
           "--with-http_ssl_module",
           "--with-debug",
           "--with-ld-opt=-R#{install_dir}/embedded/lib,-L#{install_dir}/embedded/lib",
           "--with-cc-opt=\"-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include\"",
           # Merged from Openresty Cookbook
           '--with-md5-asm',
           '--with-sha1-asm',
           '--with-pcre-jit',
           '--with-pcre',
           '--with-luajit', # Necessary?
           '--without-http_ssi_module',
           '--without-mail_smtp_module',
           '--without-mail_imap_module',
           '--without-mail_pop3_module',
           '--with-ipv6'
           # AIO support define in Openresty cookbook. Requires Kernel >= 2.6.22
           # Ubuntu 10.04 reports: 2.6.32-38-server #83-Ubuntu SMP
           # However, they require libatomic-ops-dev and libaio
           #'--with-file-aio',
           #'--with-libatomic'
          ].join(" ")
  # When building with -j > 1, make emits errors about "Jobserver cannot be reached"
  command "make"
  command "make install"
end
