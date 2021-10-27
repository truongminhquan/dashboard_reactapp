resource "aws_autoscaling_group" "main_autoscaling" {
  name                 = "main_autoscaling"
  # vpc_zone_identifier  = [module.vpc.public_subnet_1_id,module.vpc.public_subnet_2_id,module.vpc.public_subnet_3_id]
  vpc_zone_identifier  = var.VPC_ZONE_IDENTIFIER
  launch_configuration = aws_launch_configuration.ec2_launch_config.name
  min_size             = var.MIN_SIZE
  desired_capacity     = var.DESIRED_CAPACITY
  max_size             = var.MAX_SIZE
  health_check_type    = var.HEALTH_CHECK_TYPE
  tag {
    key                 = "Name"
    value               = "asg_ecs_ec2_instances"
    propagate_at_launch = true
  }
}

# Launch configuration
resource "aws_launch_configuration" "ec2_launch_config" {
    image_id = var.IMAGE_ID
    instance_type = var.INSTANCE_TYPE

    # key pair
    # key_name = module.keypair.key_name
    key_name = var.KEY_NAME


    # Attach role
    # iam_instance_profile = module.iam.ec2_instance_profile_name
    iam_instance_profile = var.IAM_INSTANCE_PROFILE

    # Security group
    # security_groups = [module.securitygroup.public_security_group_id]
    security_groups = var.SECURITY_GROUPS

    # data user
    user_data = "#!/bin/bash\necho 'ECS_CLUSTER=main_cluster' > /etc/ecs/ecs.config\nstart ecs"
}

# # Attach target group to auto scaling group
# resource "aws_autoscaling_attachment" "asg_attachment_elb" {
#   autoscaling_group_name = aws_autoscaling_group.main_autoscaling.id
#   alb_target_group_arn = aws_lb_target_group.my_target_group.arn
# }