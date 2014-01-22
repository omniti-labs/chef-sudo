return unless node[:authorization][:sudo][:enabled]

directory "/etc/sudoers.d (vagrant hook)" do
  path "/etc/sudoers.d"
  action :create
  owner 'root'
  group 'root'
  mode '0750'
end

file "/etc/sudoers.d/vagrant" do
  action :create_if_missing
  content "vagrant ALL=(ALL) NOPASSWD: ALL"
  owner 'root'
  group 'root'
  mode '0440'
end
