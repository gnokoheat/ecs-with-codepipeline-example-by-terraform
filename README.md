# ecs-with-codepipeline-example-by-terraform
![GitHub](https://img.shields.io/github/license/gnokoheat/ecs-with-codepipeline-example-by-terraform) ![GitHub top language](https://img.shields.io/github/languages/top/gnokoheat/ecs-with-codepipeline-example-by-terraform) ![GitHub last commit](https://img.shields.io/github/last-commit/gnokoheat/ecs-with-codepipeline-example-by-terraform)

**ECS with Codepipeline example by Terraform**

- Building AWS ECS Infrastructure with AWS Codepipeline for Blue/Green deployment by Terraform

![](https://github.com/gnokoheat/ecs-with-codepipeline-example-by-terraform/blob/master/ecs-with-codepipeline.png?raw=true)

## Include
This terraform code include All-In-One for ECS & Codepipeline settings even VPC infra.

- AWS ECS : ECS Cluster(EC2 type), ECS Service, ESC Task definition(Dynamic port mapping)
- AWS Codepipeline : AWS Codebuild(Github), AWS Codedeploy(Blue/Green deployment)
- AWS EC2 : ECS Container Instances, ALB, ALB Target groups, Auto scaling groups, Security groups
- AWS VPC : VPC, Subnets, Routing tables, Internet gateway, Nat gateway

## Related

App for this infra code : https://github.com/gnokoheat/ecs-nodejs-app-example
