#!bin/bash

#return to normal mode (multi-user.target)
systemctl isolate multi-user.target


#switching link from defualt to livefile
echo "Switching link from default to live/index.html";
ln -sfn /etc/nginx/sites-available/index.html  /etc/nginx/sites-enabled/default

#restart nginx 
echo "restarting nginx";
systemctl restart nginx


echo "Normal mode Enabled";



