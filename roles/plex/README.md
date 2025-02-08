# PLEX Personal Media Server

Based on official container image and adds:
* Absolute Series Scanner
* YouTube-DL-Agent
* yt-dlp batch scripts

### Mounts
Media mount is read-only to the container

### NGINX
Adds forward proxy via nginx

### Raspberry Pi2b install
If target is Raspberry Pi2b (armv7b arch), plex is installed directly.

### Crontab entries:
* weekly yt-dlp scripts, 3x
* weekly PLEX auto-update on restart action
