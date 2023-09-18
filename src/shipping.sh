echo -e "\e[31m <<Shipping api >> \e[0m"
cp shipping.service /ect/systemd/system/shipping.service
yum install maven -y

useradd roboshop

echo -e "\e[31m <<  adding artifacts into repos >> \e[0m"
rm -rf app
mkdir /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
cd /app

echo -e "\e[31m << installing shipping >> \e[0m"
mvn clean package
mv target/shipping-1.0.jar shipping.jar
echo -e "\e[31m <<< system-restart >> \e[0m"
systemctl daemon-reload
systemctl enable shipping
systemctl start shipping
yum install mysql -y
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/schema/shipping.sql
systemctl restart shipping
