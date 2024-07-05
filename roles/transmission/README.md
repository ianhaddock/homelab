## Transmission
* Creates a rootful [Transmission][1] container from a [public docker image][4]
* managed with systemd file
* Adds recommended sysctl values

### RPi2b install notes
Installs transmission directly when target armv7l arch
* build from source manually, see comments in yml file

## Flexget
* creates rootless [FlexGet][2] container using my [flexget container][3] build
* managed with user systemd file

[1]: https://github.com/transmission
[2]: https://flexget.com/
[3]: https://github.com/ianhaddock/flexget
[4]: https://github.com/linuxserver/docker-transmission
