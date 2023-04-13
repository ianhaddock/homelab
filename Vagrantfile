# dev environment

Vagrant.configure("2") do |config|
  config.vm.provision "ansible" do |ansible|  # provisioning
    ansible.playbook = "vagrant.yml"
  end

  config.vm.define "blog" do |blog|
    blog.vm.box = "bento/centos-stream-8"
    blog.vm.define "blog" # update default vm definition name
    blog.vm.hostname = "blog"
    blog.vm.network "private_network", # private for ansible
      ip: "192.168.40.41"
    blog.vm.network "public_network", # public network
      use_dhcp_assigned_default_route: true
    blog.vm.provider "vmware_desktop" do |vmware1|
      vmware1.vmx["memsize"] = "512"
      vmware1.vmx["numvcpus"] = "1"
    end
    blog.vm.post_up_message = "Blog server runs blog, gitea."
  end

  config.vm.define "west" do |west|
    west.vm.box = "bento/centos-stream-8"
    west.vm.define "west" # update default vm definition name
    west.vm.hostname = "west"
    west.vm.network "private_network", # private for ansible
      ip: "192.168.40.42"
    west.vm.network "public_network", # public network
      use_dhcp_assigned_default_route: true
    west.vm.provider "vmware_desktop" do |vmware2|
      vmware2.vmx["memsize"] = "2048"
      vmware2.vmx["numvcpus"] = "2"
    end
    west.vm.post_up_message = "West server runs home apps."
  end

  config.vm.define "east" do |east|
    east.vm.box = "bento/centos-7.9"
    east.vm.box_version = "202110.25.0"
    east.vm.define "east" # update default vm definition name
    east.vm.hostname = "east"
    east.vm.synced_folder ".", "/vagrant", disabled: true
    east.vm.network "private_network", # private for ansible
      ip: "192.168.40.40"
    east.vm.network "public_network", # public network
      use_dhcp_assigned_default_route: true
    east.vm.provider "vmware_desktop" do |vmware3|
      vmware3.vmx["memsize"] = "1024"
      vmware3.vmx["numvcpus"] = "1"
    end
    east.vm.post_up_message = "East server runs ACSM."
  end
  
  config.vm.define "devbox" do |devbox|
    devbox.vm.box = "bento/centos-stream-8"
    devbox.vm.define "devbox" # update default vm definition name
    devbox.vm.hostname = "devbox"
    devbox.vm.synced_folder ".", "/vagrant", disabled: true
    devbox.vm.network "private_network", # private for ansible
      ip: "192.168.40.44"
    devbox.vm.network "public_network", # public network
      use_dhcp_assigned_default_route: true
    devbox.vm.provider "vmware_desktop" do |vmware4|
      vmware4.vmx["memsize"] = "1024"
      vmware4.vmx["numvcpus"] = "1"
    end
    devbox.vm.post_up_message = "Devbox."
  end
  
  
end
