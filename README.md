# ecs-with-codepipeline-example-by-terraform
Building AWS ECS Infrastructure with AWS Codepipeline for Blue/Green deployment by Terraform

## Include
This terraform code include All-In-One for ECS & Codepipeline settings even VPC infra.

- AWS ECS : ECS Cluster(EC2 type), ECS Service, ESC Task definition(Dynamic port mapping)
- AWS Codepipeline : AWS Codebuild(Github), AWS Codedeploy(Blue/Green deployment)
- AWS EC2 : ECS Container Instances, ALB, ALB Target groups, Auto scaling groups, Security groups
- AWS VPC : VPC, Subnets, Routing tables, Internet gateway, Nat gateway

## Related

App for this infra code : https://github.com/gnokoheat/ecs-nodejs-app-example
