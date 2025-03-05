![timecapsule icon](readme.png)

# Multiuser Timecapsule

Apple's networked time machine service using samba and avahi-daemon.

### Samba
* uses samba role for base setup
* Config uses `include=` in smb.conf to point to /etc/samba/smb.d/timecap.conf
* User directories at `/app_path/app_name/username`
* Per user quotas

### Avahi
* uses the `Xserve1,1` model type icon
* has a generated UUID set

### Notes
* Firewalld ipv6 reverse path filter disabled is a workaround for repeating kernel message 'ipv6 route cache full' ([bug reference][301]) ([serverfault reference][302])
* using an rpi as a timecapsule on [ovechkin.xyz][303]
* set samba user password with ansible option on [stackoverflow][304]
* a setup post on [r/selfhosted on reddit][306]
* timemachine icon from [clipartmax.com][305] 

[301]: https://bugzilla.redhat.com/show_bug.cgi?id=1813691
[302]: https://serverfault.com/questions/902161/linux-host-randomly-stops-answering-ipv6-neighbor-solicitation-requests/907895#907895
[303]: https://ovechkin.xyz/blog/2021-12-13-using-raspberry-pi-for-time-machine
[304]: https://stackoverflow.com/questions/44762488/non-interactive-samba-user-creation-via-ansible
[305]: https://www.clipartmax.com/png/small/265-2655317_time-machine-drive-mac-hard-drive-icon.png
[306]: https://www.reddit.com/r/selfhosted/comments/83vn3p/howto_make_time_machine_backups_on_a_samba
