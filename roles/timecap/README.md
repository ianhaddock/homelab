## Timecapsule

Apple's networked time machine service.

Using references from [ovechkin.xyz][303] and [stackoverflow][304].

### As implemented
* enabled on restart
* set to 1Tb max storage space
* disables ipv6_rpfilter

### Why disable ipv6 in firewalld
Log spam, a repeating kernel message 'ipv6 route cache full' ([bug reference][301]) ([serverfault reference][302])














[301]: https://bugzilla.redhat.com/show_bug.cgi?id=1813691
[302]: https://serverfault.com/questions/902161/linux-host-randomly-stops-answering-ipv6-neighbor-solicitation-requests/907895#907895

[303]: https://ovechkin.xyz/blog/2021-12-13-using-raspberry-pi-for-time-machine
[304]: https://stackoverflow.com/questions/44762488/non-interactive-samba-user-creation-via-ansible
