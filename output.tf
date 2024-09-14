# Output the IAM user details
output "admin_user_id" {
  value = aws_iam_user.admin.id
}

output "admin_user_arn" {
  value = aws_iam_user.admin.arn
}

output "admin_access_key_id" {
  value = aws_iam_access_key.admin_access_key.id
}

output "admin_secret_access_key" {
  value = aws_iam_access_key.admin_access_key.secret
  sensitive = true
}
