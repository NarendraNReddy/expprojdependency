#!/bin/bash

source ./common.sh
checkroot



echo "Enter password:"
read DB_SERVER_PASSWORD
#ExpenseApp@1



dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "mysql server installation"


systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "enable the mysqld"


systemctl start mysqld &>>$LOGFILE
VALIDATE $? "start the mysqld"

#idempotency   

mysql -h db.daws78s-nnr.online -uroot -p${DB_SERVER_PASSWORD} -e 'show databases' &>>$LOGFILE
if [ $? -ne 0 ];
then
    mysql_secure_installation --set-root-pass ${DB_SERVER_PASSWORD} &>>$LOGFILE
    VALIDATE $? "setting up username and password for DB"
else 
    echo -e "Already db username and password is set... $Y SKIPPING $N "
    
fi 

#mysql_secure_installation --set-root-pass ${DB_SERVER_PASSWORD} &>>$LOGFILE
#VALIDATE $? "setting up username and password for DB"