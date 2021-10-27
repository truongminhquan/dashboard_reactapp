resource "aws_iam_role" "ec2_instance_role" {
  name               = "role"
  assume_role_policy = "${file(var.ASSUME_ROLE_POLICY)}"
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_instance_role.name
}

# s3 full access policy
resource "aws_iam_role_policy" "s3_full_access_policy" {
  name = "s3_full_access_policy"
  role = aws_iam_role.ec2_instance_role.id
  policy  = "${file(var.S3_FULL_ACCESS_POLICY)}"
}

# ecs service role
resource "aws_iam_role" "ecs_service_role" {
  name = "ecs_service_role"
  assume_role_policy = "${file(var.ECS_SERVICE_ASSUME_ROLE_POLICY)}"
}

# ecs ec2 role policy
resource "aws_iam_role_policy" "ecs_ec2_role_policy" {
  name   = "ecs_ec2_role_policy"
  role   = aws_iam_role.ec2_instance_role.id
  policy = "${file(var.ECS_EC2_ROLE_POLICY)}"

}

resource "aws_iam_policy_attachment" "ecs_service_attach1" {
  name       = "ecs_service_attach1"
  roles      = [aws_iam_role.ecs_service_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}