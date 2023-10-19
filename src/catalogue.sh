echo -e "-e \e[31m << Catalogue API  >>  \e[0m"
cp catalogue.service /etc/systemd/catalogue.service
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
echo -e "\e[31m <<< downloading artifact>>> \e[0m"
rm -rf app
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
echo -e "\e[31m <<< installing node >>> \e[0m"
npm install
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue

echo -e "\e[31m <<<install mongodb >>> \e[0m"
yum install mongodb-org-shell -y
mongo --host http://54.196.38.156:27017/app/schema/catalogue.js

