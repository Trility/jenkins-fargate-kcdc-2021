data "aws_iam_policy_document" "jenkins_python_policy" {
  statement {
    sid = "ECRAuthorization"

    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = ["*"]
  }

  statement {
    sid = "ECRPushPullAccess"

    effect = "Allow"

    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:InitiateLayerUpload",
      "ecr:ListImages",
      "ecr:PutImage",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:UploadLayerPart"
    ]

    resources = [
      "arn:aws:ecr:${var.region}:${var.aws_account_id}:repository/${var.jenkins_name}-worker-python",
      # "arn:aws:ecr:${var.region}:${var.aws_account_id}:repository/python-apps*",
    ]
  }

  # statement {
  #   sid = "DenyCrossAccount"
  #
  #   effect = "Deny"
  #
  #   actions = [
  #     "sts:AssumeRole"
  #   ]
  #
  #   resources = [
  #     "arn:aws:iam::123456789012:role/OrganizationAccountAccessRole",
  #   ]
  # }
}

module "jenkins_python_policy" {
  name        = "${var.jenkins_name}-worker-python"
  description = "Jenkins Python Worker Policy"
  policy      = data.aws_iam_policy_document.jenkins_python_policy.json
  source      = "../../modules/iam_policy"
}

module "jenkins_python_role" {
  name   = "${var.jenkins_name}-worker-python"
  source = "../../modules/iam_role"

  policy_arns = [
    module.jenkins_python_policy.arn
  ]

  principals = [
    {
      type = "Service"
      identifiers = [
        "ecs.amazonaws.com",
        "ecs-tasks.amazonaws.com"
      ]
    }
  ]
}
