# https://github.com/jenkinsci/docker/blob/master/README.md

FROM jenkins/jenkins:lts

# Copy plugins.txt to the container and install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Copy themes to jenkins_home
COPY themes/* /usr/share/jenkins/ref/userContent/

# Install AWS CLI tools
USER root
RUN apt-get update && apt-get install -y \
  apt-transport-https \
  dirmngr \
  python3-setuptools \
  python3-pip \
  zip

RUN pip3 install awscli --upgrade

# Copy Configs to Container
RUN mkdir -p /opt/jenkins/casc_configs
COPY configs/* /opt/jenkins/casc_configs/
RUN chmod 755 /opt/jenkins/casc_configs
RUN chmod 644 /opt/jenkins/casc_configs/*

# drop back to the regular jenkins user - good practice
USER jenkins
