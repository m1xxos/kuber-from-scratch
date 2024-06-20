nodes = [
  { :hostname => 'jumphost', :ip => '192.168.0.42'},
  { :hostname => 'server',  :ip => '192.168.0.43'},
  { :hostname => 'node-0',  :ip => '192.168.0.44'},
  { :hostname => 'node-1',  :ip => '192.168.0.45'}
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = "bento/debian-12"
      nodeconfig.vm.hostname = node[:hostname] + ".box"
      nodeconfig.vm.network "public_network", ip: node[:ip]

    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
  SHELL
      
end
