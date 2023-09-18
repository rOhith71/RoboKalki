#Its our Fronent application , this is how users interact with us and from here we navigate to
#other api
echo -e "\e[31m <<<Installing nginx >>> \e[0m"
yum install nginx -y
echo -e "\e[31m <<<Copying config file >>> \e[0m"
cp .roboshop.conf /etc/nginx/default.d/roboshop.conf
echo -e "\e31m <<enable nginx >> \e[0m"
systemctl enable nginx
systemctl start nginx

echo -e "\e[31m <<removing all files in html and installing artifacts >> \e[0m"

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
systemctl restart nginx
systemctl enable nginx
#good job