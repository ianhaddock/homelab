## Transmission
* Creates a [Transmission][1] container using a custom [container image][4]
* managed with systemd service file
* Adds recommended sysctl values

Update the setting.json after stopping the container. Transmission writes the current settings when stopped. This will overwrite any changes you make to the file while the container is running. If you see a pid file in the config folder, transmission is still running.

### RPi2b installs 
Installs transmission directly when target armv7l arch
* build from source manually, see comments in yml file

## Flexget
* creates rootless [FlexGet][2] container using custom [flexget image][3]
* managed with user systemd service file

## Motorsort
* Adds [custom file sorting and poster creator][5] container for motorsport videos.
* managed with user systemd service file

## Crontab
* archives flexget config weekly

[1]: https://transmissionbt.com/
[2]: https://flexget.com/
[3]: https://github.com/ianhaddock/flexget
[4]: https://github.com/ianhaddock/transmission-container
[5]: https://github.com/ianhaddock/motorsort
