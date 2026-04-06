#!/bin/bash
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo " Moving Target file"
sudo cp -rv $PROJECT_DIR/maintenance.target  /etc/systemd/system/
echo "Successfully Moved";



