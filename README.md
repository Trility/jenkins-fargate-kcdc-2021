# Jenkins/Fargate KCDC 2021 Presentation

Ephemeral Jenkins (yes, that Jenkins) with AWS Fargate

## Additional Repos

* https://github.com/Trility/jenkins-fargate-kcdc-2021-jenkins-job-dsl
* https://github.com/Trility/jenkins-fargate-kcdc-2021-jenkins-library

## Steps

* Deploy Jenkins Base Infrastructure Terraform
* Update Docker files with outputs from Jenkins Base Infrastructure
* Build and push containers
* Update Jenkins Service Terraform
* Deploy Jenkins Service Terraform
