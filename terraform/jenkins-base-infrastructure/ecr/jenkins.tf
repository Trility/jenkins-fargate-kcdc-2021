data "aws_iam_policy_document" "ecr_repository_policy" {
  statement {
    sid = "AdminPushPullAccess"

    effect = "Allow"

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
      "ecr:DeleteRepository",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:DeleteRepositoryPolicy"
    ]

    principals {
      type        = "AWS"
      identifiers = [for item in var.ecr_admins : "arn:aws:iam::${var.aws_account_id}:${item}"]
    }
  }

  # statement {
  #   sid = "DeveloperPull"
  #
  #   effect = "Allow"
  #
  #   actions = [
  #     "ecr:GetAuthorizationToken",
  #     "ecr:GetDownloadUrlForLayer",
  #     "ecr:BatchGetImage",
  #     "ecr:BatchCheckLayerAvailability"
  #   ]
  #
  #   principals {
  #     type = "AWS"
  #     identifiers = [for item in var.ecr_developers : "arn:aws:iam::${var.aws_account_id}:${item}"]
  #   }
  # }
}

module "jenkins_ecr_repositories" {
  ecr_lifecycle_policy  = local.ecr_lifecycle_policy
  ecr_repository_policy = data.aws_iam_policy_document.ecr_repository_policy.json
  tags                  = var.tags
  source                = "../../modules/ecr_repository_list"

  repositories = {
    jenkins               = "${var.jenkins_name}",
    jenkins-worker-base   = "${var.jenkins_name}-worker-base",
    jenkins-worker-docker = "${var.jenkins_name}-worker-docker",
    jenkins-worker-eng    = "${var.jenkins_name}-worker-eng",
    jenkins-worker-python = "${var.jenkins_name}-worker-python",
  }
}
