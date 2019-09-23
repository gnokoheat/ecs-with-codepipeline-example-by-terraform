#example : fill your information
variable "region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "${var.region}"
}

variable "ecs_key_pair_name" {
  default = ""
}

variable "aws_account_id" {
  default = ""
}

variable "service_name" {
  default = "demo-service"
}

variable "container_port" {
  default = "8080"
}

variable "memory_reserv" {
  default = 100
}