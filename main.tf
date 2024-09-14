# Create an IAM user
resource "aws_iam_user" "admin" {
  name = "user-1"
  tags = {
    Name = "Admin User"
  }
}

# Create an IAM policy for admin access
resource "aws_iam_policy" "admin_policy" {
  name        = "AdminPolicy"
  description = "Administrator access policy"

  # The policy below grants full access to all AWS services and resources
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*"
        Resource = "*"
      }
    ]
  })
}

# Attach the admin policy to the IAM user
resource "aws_iam_user_policy_attachment" "admin_policy_attachment" {
  user       = aws_iam_user.admin.name
  policy_arn = aws_iam_policy.admin_policy.arn
}

# Create an IAM access key for the admin user
resource "aws_iam_access_key" "admin_access_key" {
  user = aws_iam_user.admin.name
}
