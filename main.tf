resource "aws_iam_policy" "test_policy" {
    name        = "test_policy_template_dir"
    description = "A test policy rendered from a directory template"

    policy = templatefile(
        "${path.module}/policy_templates/role_policy.json",
        {
            control_lf_role_arns = jsonencode(local.role_arns)
        }
    )

    tags = {
        tag-key = "tag-value"
    }
}

resource "aws_iam_role" "test_role" {
    name = "test_role_template_dir"

    assume_role_policy = file("${path.module}/trust_templates/trust_policy.json")
    
    managed_policy_arns = [aws_iam_policy.test_policy.arn]
    
    tags = {
        tag-key = "tag-value"
    }
}
