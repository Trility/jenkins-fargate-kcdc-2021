resource "aws_iam_role" "role" {
  name                 = var.name
  max_session_duration = var.max_session_duration
  assume_role_policy   = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "attachment" {
  count      = "${length(var.policy_arns)}"
  role       = aws_iam_role.role.name
  policy_arn = "${element(var.policy_arns, count.index)}"
}
