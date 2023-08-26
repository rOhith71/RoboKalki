#Its our Fronent application , this is how users interact with us and from here we navigate to
#other api

yum install nginx -y
cp .roboshop.conf /etc/nginx/default.d/roboshop.conf
systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cp roboshop.conf /etc/nginx/default.d/roboshop.conf
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
systemctl restart nginx
systemctl enable nginx
#good job