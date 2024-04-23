#!/bin/bash

source ./common.sh 
checkroot

set -e


dnf install mysqllll -y &>>$LOGFILE
#VALIDATE $? "mysql server installation"



dnf install git -y &>>$LOGFILE