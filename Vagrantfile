nodes = [
  { :hostname => 'jumpbox', :ip => '192.168.1.42'},
  { :hostname => 'server',  :ip => '192.168.1.43'},
  { :hostname => 'node-0',  :ip => '192.168.1.44'},
  { :hostname => 'node-1',  :ip => '192.168.1.45'}
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = "bento/debian-12"
      nodeconfig.vm.hostname = node[:hostname] + ".box"
      nodeconfig.vm.network "public_network", ip: node[:ip]
      nodeconfig.vm.provider "vmware_desktop" do |v|
        v.vmx["ethernet0.pcislotnumber"] = "160"
        v.vmx["ethernet1.pcislotnumber"] = "224"
      end
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
  SHELL
      
end
