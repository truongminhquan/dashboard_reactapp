output "ec2_instance_profile_name" {
    value = aws_iam_instance_profile.ec2_instance_profile.name
}

output "ecs_service_role_arn" {
    value = aws_iam_role.ecs_service_role.arn
}

output "ecs_service_attach1" {
    value = aws_iam_policy_attachment.ecs_service_attach1
}