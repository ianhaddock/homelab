# dev environment

Vagrant.configure("2") do |config|
  config.vm.provision "ansible" do |ansible|  # provisioning
    ansible.playbook = "initial-setup.yaml"
  end

  config.vm.define "blog" do |blog|
    blog.vm.box = "bento/centos-stream-9"
    blog.vm.define "blog" # update default vm definition name
    blog.vm.hostname = "blog"
    blog.vm.synced_folder ".", "/vagrant", disabled: true
    blog.vm.network "private_network", # private for ansible
      ip: "192.168.40.41"
    blog.vm.network "public_network", # public network
      use_dhcp_assigned_default_route: true
    blog.vm.provider "vmware_desktop" do |vmware1|
      vmware1.vmx["memsize"] = "512"
      vmware1.vmx["numvcpus"] = "1"
    end
    blog.vm.post_up_message = "Blog very small VPS server."
  end

  config.vm.define "rpi2b" do |rpi2b|
    rpi2b.vm.box = "roboxes-x64/debian11"
    rpi2b.vm.define "rpi2b" # update default vm definition name
    rpi2b.vm.hostname = "rpi2b-vagrant"
    rpi2b.vm.synced_folder ".", "/vagrant", disabled: true
    rpi2b.vm.network "private_network", # private for ansible
      ip: "192.168.40.42"
    rpi2b.vm.network "public_network", # public network
      use_dhcp_assigned_default_route: true
    rpi2b.vm.provider "vmware_desktop" do |vmware2|
      vmware2.vmx["memsize"] = "1024"
      vmware2.vmx["numvcpus"] = "4"
      vmware2.vmx["cpuexecutioncap"] = "18"  # as % of i7-9750H perf
    end
    rpi2b.vm.post_up_message = "rpi2b home server."
  end

  config.vm.define "devbox" do |devbox|
    devbox.vm.box = "bento/centos-stream-9"
    devbox.vm.define "devbox" # update default vm definition name
    devbox.vm.hostname = "devbox"
    devbox.vm.synced_folder ".", "/vagrant", disabled: true
    devbox.vm.network "private_network", # private for ansible
      ip: "192.168.40.43"
    devbox.vm.network "public_network", # public network
      use_dhcp_assigned_default_route: true
    devbox.vm.provider "vmware_desktop" do |vmware3|
      vmware3.vmx["memsize"] = "2048"
      vmware3.vmx["numvcpus"] = "2"
    end
    devbox.vm.post_up_message = "Devbox Xeon box."
  end
  
end
