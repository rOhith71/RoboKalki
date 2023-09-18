echo -e "\e[31m <<< Installing cart api >> \e[0m"

echo -e "\e[31m <<copying cart service to systemd file \e[0m"
cp cart.service /etc/systemd/cart.service
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[31m installing nodejs \e[0m"
yum install nodejs -y
useradd roboshop
echo -e "\e[32m << creating app repo and adding artifcat  >> \e[0m"
mkdir /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip

npm install
