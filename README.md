# SonarQube_SonarScanner

chmod +x install_sonarqube.sh
chmod +x install_sonarscanner.sh

sudo ./install_sonarqube.sh
./install_sonarscanner.sh
#####################

Generate SonarQube Token: Needed for authenticating with SonarQube.
Add Token to GitLab: Add the token and SonarQube URL as CI/CD variables.
Configure .gitlab-ci.yml: Define stages and jobs for building, testing, and SonarQube analysis.
Push and Run Pipeline: Push the changes to trigger the pipeline and review the analysis in SonarQube.
