#!/bin/bash

echo "$program to list all the running services in your system"

if command -v systemctl &> /dev/null; then

    #list all the running services in the linux system

    systemctl list-units --type=service --status=running

else
     
     echo "systemctl command is not present in your linux system"

fi

#comments:-
#command -v systemctl &> /dev/null:
    #Checks if the systemctl command is available on the system.
    #Redirects any output (stdout and stderr) to /dev/null to suppress it.
    #systemctl list-units --type=service --state=running:
#Lists all running services on a systemd-based Linux system.
      #--type=service: Filters to show only services.
      #--state=running: Filters to show only services in the running state