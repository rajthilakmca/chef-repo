#
# Author:: Matt Ray <matt@opscode.com>
# Cookbook Name:: megam_drbd
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
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

#prime the search to avoid 2 masters
node.save unless Chef::Config[:solo]

execute "Install deps " do
  user "root"
  group "root"
  command "apt-get update && apt-get upgrade -y"
end

package "drbd8-utils" do
  action :install
end


package "linux-image-extra-virtual" do
  action :install
end

service "drbd" do
  supports(
    :restart => true,
    :status => true
  )
  action :nothing
end