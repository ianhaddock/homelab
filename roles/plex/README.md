# PLEX Personal Media Server

Uses the official container image.

### Plugins added:
* Absolute Series Scanner
* YouTube-DL-Agent
* yt-dlp batch scripts

### Media
Media mount is read-only to the container

### Transcoding
* Hardware transcoding is enabled.
* Container has CPU and Memory limits set (see vars).
* Using tmpfs to setup a 2G ramdisk for plex transcoding. 

### NGINX
Adds forward proxy via NGINX

### Raspberry Pi2b
If target is Raspberry Pi2b (armv7b arch), plex is installed directly.

### Crontab entries:
* weekly yt-dlp scripts, 3x
* weekly PLEX auto-update container restart
