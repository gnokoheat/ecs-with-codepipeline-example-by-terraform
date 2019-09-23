resource "aws_ecs_task_definition" "this" {
  family                   = "${var.service_name}"
  execution_role_arn       = "${aws_iam_role.execution_role.arn}"
  task_role_arn            = "${aws_iam_role.task_role.arn}"
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  container_definitions    = <<DEFINITION
[
   {
      "portMappings": [
        {
          "hostPort": 0,
          "protocol": "tcp",
          "containerPort": ${var.container_port}
        }
      ],
      "environment": [
        {
          "name": "PORT",
          "value": "${var.container_port}"
        },
        {
          "name" : "APP_NAME",
          "value": "${var.service_name}"
        }
      ],
      "memoryReservation" : ${var.memory_reserv},
      "image": "gnokoheat/ecs-nodejs-initial:latest",
      "name": "${var.service_name}"
    }
]
DEFINITION
}
