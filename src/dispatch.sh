echo -e "\e[31m <<<<<Installing Dispatch api >>>> \e[0m"
dnf install golang -y
echo -e "\e[31m <<<adding user roboshop >>>> \e[0m"

cp dispatch.service /etc/systemd/system/dispatch.service
useradd roboshop

echo -e "\e[31m <<<creating app directory >>> \e[0m"
rm -rf /app
mkdir /app
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip
cd /app

echo -e "\e[31m <<< installing go module >>> \e[0m"
go mod init dispatch
go get
go build
echo -e "\e[31m system reload \e[0m"
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch