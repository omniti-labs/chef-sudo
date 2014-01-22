return unless node[:authorization][:sudo][:enabled]

file "keep ssh agent forwarding through sudo" do
  path "/etc/sudoers.d/keep_ssh_agent"
  action :create
  owner "root"
  group "root"
  mode "0440"
  backup false
  content "Defaults env_keep += \"SSH_AUTH_SOCK\"\n"
end
