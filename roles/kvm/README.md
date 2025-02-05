# kvm-host


### ref:
https://gist.github.com/joseluisq/2fcf26ff1b9c59fe998b4fbfcc388342 -- Resize qcow2
https://cloud.centos.org/centos/9-stream/x86_64/images/
https://www.redhat.com/sysadmin/build-lab-quickly
https://www.redhat.com/sysadmin/build-VM-fast-ansible

### Add bridge0 network to host:
nmcli device status
nmcli connection
nmcli connection add type bridge con-name bridge0 ifname bridge0
ip link set down enp3s0
nmcli device modify enp3s0 ipv4.method disabled
nmcli connection modify enp3s0 master bridge0
nmcli connection up enp3s0
nmcli connection up bridge0

### remove bridge0 and port:
ip link set down bridge0
ip link set down enp3s0
nmcli connection delete bridge0
ip link set up enp3s0
nmcli device modify enp3s0 ipv4.method auto
nmcli connection modify enp3s0 connection.autoconnect yes

### you can also hard reset bridge nic:
ip link set down enp3s0
nmcli connection delete enp3s0
nmcli connection add type ethernet ifname enp3s0 con-name enp3s0

### and/or reload nmcli files from disk:
nmcli connection reload


### Virsh pool location:
$ virsh pool-edit default
set: <path>/mnt/vms/pool-default</path>

### Download cloud image:
cd /mnt/vms/pool-default/
wget https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2
cp CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2 vm01.qcow2

### Expand storage to 25G:
virt-filesystems -a vm01.qcow2 --all --long -h
truncate -r vm01.qcow2  vm01-new.qcow2
truncate -s 25G vm01-new.qcow2
virt-filesystems --partitions --long -a vm01.qcow2
virt-resize --expand /dev/sda1 vm01.qcow2  vm01-new.qcow2
qemu-img info vm01-new.qcow2

### Customize:
virt-customize -a vm01-new.qcow2 --hostname vm01.lab --root-password password:root --ssh-inject 'root:file:/home/user/.ssh/id_rsa.pub' --uninstall cloud-init --selinux-relabel

### Start:
virt-install --name vm01 --memory 1536 --vcpus 1 --network bridge=bridge0,mac.address='52:54:00:b4:f3:2c' --disk vm01-new.qcow2 --import --os-variant centos-stream9 --noautoconsole

old: virt-install --name vm01 --memory 1024 --vcpus 1 --network bridge=bridge0 --disk vm01-new.qcow2 --import --os-variant centos-stream9 --noautoconsole
virsh list --all
virsh domifaddr vm01  # wont show bridge0 ip

### Add bridge if vm alreadt existed:
vrish stop vm01
virt-xml vm01 --edit --network bridge=bridge0
virsh start vm01
virsh console vm01

