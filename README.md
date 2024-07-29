[![Ansible Yaml Check](https://github.com/ianhaddock/homelab/actions/workflows/ansible-check.yml/badge.svg)](https://github.com/ianhaddock/homelab/actions/workflows/ansible-check.yml)

# Personal Infrastructure
Build out for my systems.

<p align="center">
  <img width="60%" height="auto" src="readme.png">
</p>

## Uses

* Vagrant
* Terraform
* Podman
* KVM Qemu
* ZFS
* RedHat via the [developer subscription][2]
* CentOS Stream
* Raspberry Pi OS (Debian 11)


## Roles

Utilities:
* common: base packages, users, configs
* sshd: ssh config, with figlet & random quote
* zram: ram compression before disk swap
* base-nginx: reverse proxy & ssl certificates
* timecap: timecapsule service
* ac_backup: rsync file backup
* file_store: simple https file server
* wakeonwin: bash alias file to wake my PC
* rpi2b_setup: rpi2b specific tweaks
* munin-node: resource monitor
* flexget: transmission automation
* piglow: support for PiGlow hardware on Raspberry Pi

Apps: 
* blog: Flask app for [my blog][1]
* gitea: git repo
* pihole: DNS with ad-guard
* munin-server: resource monitor gui
* plex: personal media streaming service
* transmission: bittorrent client
* jenkins: automation server
* jenkins-agent: automation agent


## Setup:

Requires Ansible and Vagrant on your host.

```
# pull the latest
$ git pull http://git.ianhaddock.com/ian/ansible.git

# install requirements
$ ansible-galaxy install -r roles/requirements.yml

# update Vagrantfile to conform to your VM product and IP space

# clone group_vars/all.yml file to create host_vars files
$ mkdir host_vars
$ cp group_vars/all.yml host_vars/[ip.address].yml

# edit host_vars files to match Vagrantfile
 
# generate ansible admin account ssh-key
$ ssh-keygen -f ~/.ssh/ansible

# add admin public key to common role files
$ mkdir -p roles/common/files/public_key
$ cp ~/.ssh/ansible.pub roles/common/files/public_keys/

# provision development VM
$ vagrant up --provision

# run playbook 
$ ansible-playbook --private-key ~/.ssh/ansible -u ansible -i development site.yml
 
```

[1]: https://ianhaddock.com
[2]: https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux
