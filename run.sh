#!/bin/bash
echo '[INFO] Starting Nginx Server'
nginx -g 'daemon on;'
echo '[INFO] Nginx Server Started'

tail -f /dev/null