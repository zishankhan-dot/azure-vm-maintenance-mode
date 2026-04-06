#!/bin/bash

#return to normal mode (multi-user.target)
systemctl isolate multi-user.target


#switching link from defualt to live config file
echo "Switching link from default to live/live.conf";
ln -sfn /etc/nginx/sites-available/live.conf  /etc/nginx/sites-enabled/default

#restart nginx 
echo "restarting nginx";
systemctl restart nginx


echo "Normal mode Enabled";



