#!/bin/bash
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add - && \
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list && \
apt-get update && apt-get install mongodb-org -y 2>/dev/null && \
systemctl start mongod && \
systemctl enable mongod
