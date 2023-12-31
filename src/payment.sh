echo -e "\e[31m << Payment >> \e[0m"
yum install python36 gcc python3-devel -y
echo -e "\e << copying paymentservice file >> \e[0m"
cp payment.service /etc/systemd/system/payment.service
useradd roboshop
rm -rf /app
mkdir /app
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
cd /app

pip3.6 install -r requirements.txt
echo -e "\e[31m << Copying payment file >> \e[0m"

systemctl daemon-reload
systemctl enable payment
systemctl start payment


