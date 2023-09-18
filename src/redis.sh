echo -e "\e[31m << installing redis >>> \e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
yum module enable redis:remi-6.2 -y
yum install redis -y

echo -e "\e[31 << Start Redis >> \e[0m"
systemctl enable redis
systemctl start redis
