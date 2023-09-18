echo -e "\e <<Insatlling Mongo  >> \e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org -y
systemctl enable mongod
systemctl start mongod
systemctl restart mongod