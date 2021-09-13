data "aws_iam_policy_document" "jenkins_policy" {
  statement {
    effect = "Allow"

    actions = concat(
      terraform.workspace == "default" ? [
        "account:*",
        "organizations:*",
        "ram:*",
        "support:*",
        "trustedadvisor:*"
      ] : [],
      [
        "acm:*",
        "apigateway:*",
        "application-autoscaling:*",
        "autoscaling:*",
        "backup:*",
        "backup-storage:*",
        "cloudformation:*",
        "cloudfront:*",
        "cloudtrail:*",
        "cloudwatch:*",
        "config:*",
        "datapipeline:*",
        "dynamodb:*",
        "ec2:*",
        "ecr:*",
        "ecs:*",
        "elasticache:*",
        "elasticfilesystem:*",
        "elasticloadbalancing:*",
        "es:*",
        "events:*",
        "execute-api:*",
        "firehose:*",
        "glacier:*",
        "iam:*",
        "kafka:*",
        "kinesis:*",
        "kinesisanalytics:*",
        "kms:*",
        "lambda:*",
        "logs:*",
        "opsworks-cm:*",
        "opsworks:*",
        "rds:*",
        "redshift:*",
        "rekognition:*",
        "route53:*",
        "route53domains:*",
        "route53resolver:*",
        "s3:*",
        "secretsmanager:*",
        "servicecatalog:*",
        "servicediscovery:*",
        "ses:*",
        "sns:*",
        "sqs:*",
        "ssm:*",
        "states:*",
        "sts:*",
        "swf:*",
        "tag:*",
        "waf-regional:*",
        "waf:*",
        "xray:*"
      ]
    )

    resources = [
      "*"
    ]
  }
}

module "jenkins_policy" {
  name        = var.jenkins_name
  description = "KCDC Jenkins Policy"
  policy      = data.aws_iam_policy_document.jenkins_policy.json
  source      = "../../modules/iam_policy"
}

module "jenkins_role" {
  name   = var.jenkins_name
  source = "../../modules/iam_role"

  policy_arns = concat(
    [module.jenkins_policy.arn],
    var.additional_jenkins_policies
  )

  principals = [
    {
      type = "Service"
      identifiers = [
        "ecs.amazonaws.com",
        "ecs-tasks.amazonaws.com"
      ]
    },
    {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }
  ]
}
