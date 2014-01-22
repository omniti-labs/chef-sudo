# sudo:default
return unless node[:authorization][:sudo][:enabled]

directory "/etc/sudoers.d (sudo default)" do
  path "/etc/sudoers.d"
  action :create
  owner 'root'
  group 'root'
  mode '0750'
end

template "/etc/sudoers" do
    if !node['authorization']['sudo']['template_cookbook'].nil? then
      cookbook node['authorization']['sudo']['template_cookbook']
    end
    source node['authorization']['sudo']['template_file'] || "sudoers.erb"
    mode 0440
    owner "root"
    group "root"
    variables(
        #:groups => node[:sudo][:groups],
        #:users => node[:sudo][:users]
        :groups => node['authorization']['sudo']['groups'],
        :users => node['authorization']['sudo']['users']
    )
end
