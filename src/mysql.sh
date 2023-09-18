echo -e "\e[31m << MYSql Installation >> \e[0m "
cp mysql.repo /etc/yum.repos.d/mysql.repo
yum module disable mysql -y
echo -e "\e[31m <<Installing community server >> \e[0m"
yum install mysql-community-server -y
systemctl enable mysqld
systemctl start mysqld
echo -e "\e[31m << connecting >> \e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
mysql -uroot -pRoboShop@1
