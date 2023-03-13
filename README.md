---
gitea: none
include_toc: true
---
# Ansible automation
This is an infra. build for a small VPS and home server. 

Initially created while migrating my home lab to lower power alternatives. OSs are CentOS Stream 8 and Red Hat 8.7 Oopta (via the [developer subscription][2] program). All apps are running in rootless Podman containers within sudo-less, passwordless user accounts.  Vagrant is used as the development environment.

## Uses
* RedHat 8.7 & CentOS Stream 8
* Podman rootless containerization
* Vagrant VM test environment 

## Targets
### Small VPS
* my blog app
* simple file server
* Gitea

### Home Server
* Pihole
* Plex
* Transmission
* Jenkins

## Setup:
Requires a configured Ansible and Vagrant environment.

```
# pull the latest
$ git pull http://git.ianhaddock.com/ian/ansible.git

# install requirements
$ ansible-galaxy install -r roles/requirements.yml

# update vagrant file to conform to your IP space
$ vi Vagrantfile

# generate ansible account ssh-key
$ ssh-keygen -f ~/.ssh/ansible

# provision test VMs
$ vagrant up --provision

# run the playbook 
$ ansible-playbook --private-key ~/.ssh/ansible -u ansible -i development site.yml
 
```

[1]: https://ianhaddock.com
[2]: https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux
