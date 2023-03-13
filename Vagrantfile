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

end
