source commons.sh
pwd
Script_path={dirname $0}
echo ${Script_path}

Exit

echo -e "\e[31m << User Api Installation \e[0m"
cp user.service /etc/systemd/system/user.service

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd ${app_user}
echo -e "\e[31m << Intalling artifacts >>> \e[0m"
rm -rf app
mkdir /app
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
cd /app

echo -e "\e[31m <<< Install Node Package \e[0m"
npm install
systemctl daemon-reload
systemctl enable user
systemctl start user

echo -e "\e[31m <<< configuring mongo ip >>> \e[0m"
yum install mongodb-org-shell -y
mongo --host http://54.196.38.156/app/schema/user.js

