# Ansible automation
Personal infrastructure build. 

Most Apps are in rootless Podman containers inside sudo-less, password-less user accounts.

## Uses
* RedHat 8 via the [developer subscription][2]
* CentOS Stream 8
* Podman containers
* Vagrant dev environment 


## Roles

Utilities:
* common: add base packages, users, configs
* sshd: update ssh configs
* zram: add ram compression before disk swap
* base-nginx: reverse proxy & ssl certificates
* file_store: simple https file server
* ac_backup: rsync over ssh

Apps: 
* blog: Flask app for [my blog][1]
* gitea: git repo
* pihole: DNS with ad-guard
* plex: personal media streaming service
* transmission: bittorrent client
* jenkins: automation server
* jenkins-agent: automation agent


## Setup:
Requires a configured Ansible and Vagrant environment.

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

## provision development VM
$ vagrant up --provision

# run playbook 
$ ansible-playbook --private-key ~/.ssh/ansible -u ansible -i development site.yml
 
```

[1]: https://ianhaddock.com
[2]: https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux
