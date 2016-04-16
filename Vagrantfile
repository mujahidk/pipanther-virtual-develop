Vagrant.configure(2) do |config|
    config.vm.box = "hashicorp/precise32"
    config.vm.hostname = "ghost.mujahidk.com"
    config.vm.network "forwarded_port", guest: 9000, host: 9000
    config.vm.provision "puppet" do |puppet|
    	puppet.options = "--verbose --debug"
    	puppet.module_path = "modules"
    end
end
