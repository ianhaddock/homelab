## ZFS on Centos

Installs and adds fileshares if enabled.

### As configured:
* Add zfs repo
* Install zfs
* Enable at startup


### Notes:

zfs can bork when new kernel gets installed.
Rolling back to the old kernel worked, but not great.
Below fixed, but needs to be run each kernel update.

```
# checks:
# get current kernel
uname -a

# list installed kernels
sudo dnf list kernel

# confirm zfs-kmod is not enabled
sudo dnf config-manager --disable zfs-kmod

# confirm zfs is enabled
sudo dnf config-manager --enable zfs

# build openzfs:
# build a test area
mkdir ~/zfs ; cd $_

# dependencies to build ZFS from release tarball:
$ sudo dnf install -y zfs-dkms zfs-release libuuid-devel libblkid-devel libtirpc-devel kernel-devel

# pull latest tarball:
$ wget https://github.com/openzfs/zfs/releases/download/zfs-2.2.4/zfs-2.2.4.tar.gz

# unpack tarball
tar xvf zfs-*

# default configure, make, make install
sudo ./configure
sudo make
sudo make install

# reload into kernel
sudo modprobe -v zfs

# reboot, but the pool wont automount yet

# list available pools to import
sudo zpool import

# manually load a pool
sudo zpool import tank

# create zpool.cache file to load pool at startup:
sudo zpool set cachefile=/usr/local/etc/zfs/zpool.cache tank

```

