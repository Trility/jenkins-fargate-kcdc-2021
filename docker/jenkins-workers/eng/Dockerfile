FROM 123456789012.dkr.ecr.us-west-2.amazonaws.com/kcdc-jenkins-worker-base:latest

# Install Packages
USER root
RUN apt-get update

# Install Python3
RUN apt-get install -y python3-pip python3-dev

# Install Terraform 1.0.6
RUN curl https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_linux_amd64.zip --output terraform.zip && \
    unzip terraform.zip && \
    mv terraform /bin && \
    rm terraform.zip

ENTRYPOINT ["jenkins-slave"]
