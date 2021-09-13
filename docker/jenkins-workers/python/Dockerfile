FROM 123456789012.dkr.ecr.us-west-2.amazonaws.com/kcdc-jenkins-worker-base:latest

# Install Python3
RUN apt-get install -y python3-pip python3-dev

ENTRYPOINT ["jenkins-slave"]
