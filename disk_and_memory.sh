#!/bin/bash

#everyday in the morning at 9am IST & 7pm IST, check disk space and free memory,
#store output in /tmp dir at as diskspace.txt and process.txt

disk_space="/tmp/diskspace.txt"
process_file="/tmp/process.txt"

echo "the disk space is "

df -h > "$disk_space"

echo "free memory"

free > "$process_file"



#-------------------------------------------------------------------------------------------------
#The > operator is used for output redirection in shell scripting. 
#It allows you to send the output of a command to a file instead of printing it to the terminal.
#-------------------------------------------------------------------------------------------------
# ">" redirects the output of a command to a file here
#-------------------------------------------------------------------------------------------------

#crontab -e
# * * * * * CMD


#first * ->minnute (0-59)
#second * ->hour(0-23)
#third  * ->day of the month(0-31)
#fourth  * -> month(1-12)
#fifth * ->day of week(0-6)
#CMD -> any command

#UTC timings are used in crontab

#--------------------------------------------------------------------------------------------------
