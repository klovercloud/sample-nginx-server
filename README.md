# Sample Nginx Server

####
### Modifications

- Default nginx.pid file path changed to /etc/nginx/run/nginx.pid (check nginx/nginx.conf)
- Nginx root directory changed (check nginx/config/default.conf)
- Necessary directory permissions added to nginx user in Dockerfile
- Users can modify the nginx/nginx.conf & nginx/config/default.conf file based on their requirements

####
### Local Testing with Docker

**Build**
```sh
docker build -t klovercloud/nginx-server:latest .
```
**Run**
```sh
docker run -d --read-only --tmpfs=/var/cache/nginx --tmpfs=/var/log/nginx --tmpfs=/etc/nginx/run -p 8080:8080 klovercloud/nginx-server:latest
```
####
### Run in KloverCloud
- Persistent Volume is required
- The following paths should be in the Volume Mount paths
/var/cache/nginx
/var/log/nginx
/etc/nginx/run
