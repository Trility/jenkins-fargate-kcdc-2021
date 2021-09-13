FROM jenkins/inbound-agent

# Install Packages
USER root
RUN apt-get update && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  gnupg2 \
  software-properties-common \
  build-essential \
  curl \
  dirmngr \
  python3-setuptools \
  python3-pip \
  zip \
  jq

RUN pip3 install awscli --upgrade

# Install Additional repos and run apt-update
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable"
RUN apt-get update

# Install Docker Engine
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

ENTRYPOINT ["jenkins-slave"]
