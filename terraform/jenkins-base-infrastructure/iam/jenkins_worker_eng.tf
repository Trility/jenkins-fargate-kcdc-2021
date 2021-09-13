data "aws_iam_policy_document" "jenkins_eng_policy" {
  statement {
    sid = "SSMParameterAccess"

    effect = "Allow"

    actions = [
      "ssm:Get*"
    ]

    resources = [
      "arn:aws:ssm:${var.region}:${var.aws_account_id}:parameter/*"
    ]
  }

  statement {
    sid = "LogMessagesToCloudWatch"

    effect = "Allow"

    actions = [
      "logs:CreateLogSteam",
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:GetLogEvents",
      "logs:PutLogEvents"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "PassRolesToJenkinsWorkers"

    effect = "Allow"

    actions = [
      "iam:PassRole"
    ]

    resources = [
      "arn:aws:iam::${var.aws_account_id}:role/${var.jenkins_name}-worker-eng",
      module.jenkins_python_role.arn
    ]
  }

  statement {
    sid = "JenkinsWorkersManagement"

    effect = "Allow"

    actions = [
      "ecs:DeregisterTaskDefinition",
      "ecs:DescribeContainerInstances",
      "ecs:DescribeTaskDefinition",
      "ecs:DescribeTasks",
      "ecs:ListClusters",
      "ecs:ListTaskDefinitions",
      "ecs:RegisterTaskDefinition"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "JenkinsWorkerTasks"

    actions = [
      "ecs:RunTask"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "StopJenkinsWorkers"

    effect = "Allow"

    actions = [
      "ecs:ListContainerInstances",
      "ecs:StopTask"
    ]

    resources = [
      "arn:aws:ecs:${var.region}:${var.aws_account_id}:cluster/${var.jenkins_name}"
    ]
  }

  statement {
    sid = "KillJenkinsWorkers"

    effect = "Allow"

    actions = [
      "ecs:DescribeTasks",
      "ecs:StopTask"
    ]

    resources = [
      "arn:aws:ecs:${var.region}:${var.aws_account_id}:task/${var.jenkins_name}-worker-*"
    ]
  }

  statement {
    sid = "ECRAuthorization"

    effect = "Allow"

    actions = [
      "ecr:GetAuthorizationToken"
    ]

    resources = ["*"]
  }

  statement {
    sid = "ECRAdminAccess"

    effect = "Allow"

    actions = [
      "ecr:*"
    ]

    resources = [
      "*"
    ]
  }

  # statement {
  #   sid = "AllowCrossAccountAccess"
  #
  #   effect = "Allow"
  #
  #   actions = [
  #     "sts:AssumeRole"
  #   ]
  #
  #   resources = [
  #     "arn:aws:iam::123456789012:role/${var.jenkins_name}-worker-eng",
  #     "arn:aws:iam::098765432101:role/${var.jenkins_name}-worker-eng",
  #   ]
  # }
  #
  # statement {
  #   sid = "ExplicitDenyRoleAccess"
  #
  #   effect = "Deny"
  #
  #   actions = [
  #     "sts:AssumeRole"
  #   ]
  #
  #   resources = [
  #     "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/Administrator",
  #     "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/OrganizationAccountAccessRole",
  #   ]
  # }
}

module "jenkins_eng_policy" {
  name        = "${var.jenkins_name}-worker-eng"
  description = "Jenkins Eng Worker Policy"
  policy      = data.aws_iam_policy_document.jenkins_eng_policy.json
  source      = "../../modules/iam_policy"
}

module "jenkins_eng_role" {
  name   = "${var.jenkins_name}-worker-eng"
  source = "../../modules/iam_role"

  policy_arns = [
    module.jenkins_eng_policy.arn,
    module.jenkins_policy.arn
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
