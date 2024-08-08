#!/bin/bash

# Variables
SONAR_SCANNER_VERSION="4.8.0.2856"
SONAR_SCANNER_HOME="/opt/sonar-scanner"

# Download and install SonarScanner
cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
sudo unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip
sudo mv sonar-scanner-${SONAR_SCANNER_VERSION}-linux $SONAR_SCANNER_HOME
sudo chown -R $USER:$USER $SONAR_SCANNER_HOME

# Add SonarScanner to PATH
echo "export PATH=\$PATH:$SONAR_SCANNER_HOME/bin" >> ~/.bashrc
source ~/.bashrc

echo "SonarScanner installation is complete."
