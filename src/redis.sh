echo -e "\e[31m << installing redis >>> \e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
yum module enable redis:remi-6.2 -y
yum install redis -y

echo -e "\e[31m << updating port details >> \e[0m"

sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis/redis.conf

echo -e "\e[31 << Start Redis >> \e[0m"
systemctl enable redis
systemctl start redis
