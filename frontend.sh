#!/bin/bash

source ./common.sh
checkroot

dnf install nginx -y &>>$LOGFILE
VALIDATE $? "nginx install"


systemctl enable nginx &>>$LOGFILE
VALIDATE $? "enable nginx "

systemctl start nginx &>>$LOGFILE
VALIDATE $? "start nginx"

rm -rf /usr/share/nginx/html/* &>>$LOGFILE
VALIDATE $? "remove nginx hmtl"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOGFILE
VALIDATE $? "download frontend code"

cd /usr/share/nginx/html &>>$LOGFILE
VALIDATE $? "Entering into nginx html folder"

unzip /tmp/frontend.zip &>>$LOGFILE
VALIDATE $? "Copy the frontend code"

cp -rf /home/ec2-user/expprojdependency/expense.conf /etc/nginx/default.d/expense.conf &>>$LOGFILE
VALIDATE $? "copying expense.conf"

systemctl restart nginx &>>$LOGFILE
VALIDATE $? "Restart nginx"