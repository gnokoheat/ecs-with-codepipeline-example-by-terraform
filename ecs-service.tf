resource "aws_ecs_service" "this" {
  name            = "${var.service_name}"
  task_definition = "${aws_ecs_task_definition.this.id}"
  cluster         = "${aws_ecs_cluster.this.arn}"

  load_balancer {
    target_group_arn = "${aws_lb_target_group.this.0.arn}"
    container_name   = "${var.service_name}"
    container_port   = "${var.container_port}"
  }

  launch_type                        = "EC2"
  desired_count                      = 1
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  depends_on = ["aws_lb_listener.this"]
}
