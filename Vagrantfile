nodes = [
  { :hostname => 'jumphost', :ip => '192.168.0.42'},
  { :hostname => 'server',  :ip => '192.168.0.43'}
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = "bento/debian-12"
      nodeconfig.vm.hostname = node[:hostname] + ".box"
      nodeconfig.vm.network "public_network", ip: node[:ip]

      nodeconfig.vm.provider "vmware_desktop" do |v|
        v.gui = true
      end
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqNOWKBXOjOymiq1GDAfzGg26+O7uDHdie6t/IUfQc+nT3NTvx3n1bQYdW/koixKLSK8IdOInkwk5nyxUC7MzeZqlSQmjHkdGPoUKP6hIFmf0fNsBjY6E+gBtq7qeR+vi9MeLSoT0gtNI9hOI4CUMAquNoAxpoorJclQxgG2tSzAtaWe35gsn1opG4keIaEg1EnFBJzrSBcSB/G+/gegz+QVDpxy0iHmAHxCLD7/agxABVXb04RDUn2vCw7f77iaQSCsT22XkrpzACoBJtEja7LtmZTZQvitD+voi1uRxZMoQYoH+FAlKWvGNrCfQE2E8GPE6zUXR2geREd9Lgxcw5 harvester" >> ~/.ssh/authorized_keys
  SHELL
      
end
