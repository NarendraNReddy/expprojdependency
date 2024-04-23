#!/bin/bash

set -e


dnf install mysqllll -y &>>$LOGFILE
#VALIDATE $? "mysql server installation"



dnf install git -y &>>$LOGFILE