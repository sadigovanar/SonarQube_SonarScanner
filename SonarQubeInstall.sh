#!/bin/bash

# Variables
SONARQUBE_VERSION="10.1.0.0"
SONARQUBE_HOME="/opt/sonarqube"
SONARQUBE_USER="sonarqube"
SONARQUBE_GROUP="sonarqube"

# Update system and install required packages
sudo apt-get update
sudo apt-get install -y wget unzip openjdk-17-jdk

# Create a dedicated user for SonarQube
sudo groupadd -r $SONARQUBE_GROUP
sudo useradd -r -g $SONARQUBE_GROUP -d $SONARQUBE_HOME -s /bin/bash $SONARQUBE_USER

# Download and install SonarQube
cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONARQUBE_VERSION}.zip
sudo unzip sonarqube-${SONARQUBE_VERSION}.zip
sudo mv sonarqube-${SONARQUBE_VERSION} $SONARQUBE_HOME
sudo chown -R $SONARQUBE_USER:$SONARQUBE_GROUP $SONARQUBE_HOME

# Configure SonarQube as a service
sudo bash -c 'cat <<EOF > /etc/systemd/system/sonarqube.service
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=$SONARQUBE_HOME/bin/linux-x86-64/sonar.sh start
ExecStop=$SONARQUBE_HOME/bin/linux-x86-64/sonar.sh stop
User=$SONARQUBE_USER
Group=$SONARQUBE_GROUP
Restart=always
LimitNOFILE=65536
LimitNPROC=4096

[Install]
WantedBy=multi-user.target
EOF'

# Reload the systemd daemon and start SonarQube service
sudo systemctl daemon-reload
sudo systemctl enable sonarqube.service
sudo systemctl start sonarqube.service

echo "SonarQube installation is complete. Visit http://localhost:9000 to access SonarQube."

