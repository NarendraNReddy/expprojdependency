#!/bin/bash

source ./common.sh 
checkroot

set -e

failure() {
  echo "Failed at $$1: $$2"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR


dnf install mysqllll -y
#VALIDATE $? "mysql server installation"



dnf install git -y &>>$LOGFILE