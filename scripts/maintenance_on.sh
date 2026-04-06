#!/bin/bash



#link default file from nginx to maintenance/index.html
echo "Changing file default to maintenance/maintenance.conf"
ln -sfn  /etc/nginx/sites-available/maintenance.conf  /etc/nginx/sites-enabled/default


echo "Restarting Nginx";
systemctl restart nginx

echo "isolating it to maintenance.target";
systemctl isolate maintenance.target

echo "Maintenance Mode enabled"


