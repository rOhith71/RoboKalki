echo -e "\e[31m RabbitMQ installation \e[0m"

echo -e "\e[31m << installing rrabitmq repositories >> \e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash

echo -e "\e[31m <<< Installing Rabbitmq >> \e[0m"
dnf install rabbitmq-server -y

echo -e "\e[31m << Startinf RabbitMq server >> \e[0m"
systemctl enable rabbitmq-server
systemctl start rabbitmq-server

echo -e "\e[31m connect to rabbitmq \e[0m"
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"