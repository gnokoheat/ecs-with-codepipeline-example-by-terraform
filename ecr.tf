data "aws_iam_policy_document" "assume_by_ecr" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecr" {
  name               = "${var.service_name}-ECR-ReadForECSServiceAccount"
  assume_role_policy = "${data.aws_iam_policy_document.assume_by_ecr.json}"
}

resource "aws_ecr_repository" "this" {
  name  = "${var.service_name}"
}

resource "aws_ecr_repository_policy" "this" {
  repository = "${var.service_name}"
  policy     = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "${var.service_name}",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "${aws_iam_role.ecr.arn}",
          "${aws_iam_role.codebuild.arn}",
          "${aws_iam_role.codedeploy.arn}",
          "${aws_iam_role.pipeline.arn}"
        ]
      },
      "Action": [
        "ecr:BatchCheckLayerAvailability",
        "ecr:BatchGetImage",
        "ecr:DescribeImages",
        "ecr:DescribeRepositories",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetLifecyclePolicy",
        "ecr:GetLifecyclePolicyPreview",
        "ecr:GetRepositoryPolicy",
        "ecr:ListImages"
      ]
    }
  ]
}
EOF
}
