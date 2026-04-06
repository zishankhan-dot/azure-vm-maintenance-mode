#!/bin/bash
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# moving maintenance folder to standard directory 
echo "moving maintenance"
sudo cp -rv $PROJECT_DIR/maintenance  /var/www/

# moving live folder to standard directory 
echo "moving live"
sudo cp -rv $PROJECT_DIR/live  /var/www/

echo "moving complete"

