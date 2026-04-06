#!/bin/bash
# script to move maintenance.conf and live.conf to /etc/nginx/sites-available/
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "moving maintenance.conf"
sudo cp -v $PROJECT_DIR/maintenance.conf  /etc/nginx/sites-available/

echo "moving live.conf"
sudo cp -v $PROJECT_DIR/live.conf  /etc/nginx/sites-available/
