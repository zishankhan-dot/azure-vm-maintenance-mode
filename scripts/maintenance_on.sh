#!bin/bash



#link default file from nginx to maintenance/index.html
echo "Changing file default to maintenance file"
ln -sfn  /etc/nginx/sites-available/maintainance.conf  /etc/nginx/sites-enabled/default


echo "Restarting Nginx";
systemctl restart nginx

echo "isolating it to maintenance.target";
systemctl isolate maintenance.target

echo "Maintenance Mode enabled"


