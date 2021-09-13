## Build and Publish to AWS ECR

```
~$ aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 123456789012.dkr.ecr.us-west-2.amazonaws.com
~$ docker build -t 123456789012.dkr.ecr.us-west-2.amazonaws.com/kcdc-jenkins-worker-python:latest
~$ docker push 123456789012.dkr.ecr.us-west-2.amazonaws.com/kcdc-jenkins-worker-python:latest
```
