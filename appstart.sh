#!/bin/bash

set -euo pipefail 


## --ConfigFile--
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
##--functions--
initial_setup(){
chmod +x $PROJECT_DIR/html/config/mvconf.sh
chmod +x $PROJECT_DIR/html/htmlServe/webdirectory.sh
bash $PROJECT_DIR/html/config/mvconf.sh
bash $PROJECT_DIR/html/htmlServe/webdirectory.sh
chmod +x $PROJECT_DIR/systemd/mvtarget.sh
bash $PROJECT_DIR/systemd/mvtarget.sh
}

set_MaintenanceMode(){
bash  $PROJECT_DIR/scripts/maintenance_on.sh;

}
set_NormalMode(){
bash $PROJECT_DIR/scripts/maintenance_off.sh;
}
show_Status(){
systemctl is-active nginx;
systemctl is-active ssh;

}

##--Main---
if [ "$EUID" -ne 0 ];
then echo "run this program as sudo"
     echo "exit"
     exit 1;
fi

initial_setup



while true;
do 
	echo "-----MAINTENANCE WINDOW-----"
	echo "1) Switch To Maintenance Mode"
	echo "2) Switch To Normal Mode"
	echo "3)Show Status"
	echo "q) Quit"
	read -rp "Enter Your Choice" choice;

	case  "$choice"  in
	      1)
		set_MaintenanceMode
		;;
	      2)
		set_NormalMode
		;;
	      3) 
		show_Status
		;;			
	      q|Q)
		echo "Exiting";	
		 break	
		;;
	       *) 
		echo "invalid Choice"	
		;;
	esac
done
