resource "aws_lb" "my_alb" {
    name               = "my-alb"
    internal           = false
    load_balancer_type = "application"
    # security_groups    = [module.securitygroup.public_security_group_id]
    security_groups    = var.SECURITY_GROUPS
    # subnets            = [module.vpc.public_subnet_1_id,module.vpc.public_subnet_2_id,module.vpc.public_subnet_3_id]
    subnets            = var.SUBNETS

    enable_deletion_protection = false
}

# target groups
resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.VPC_ID
}

# Add listener
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

# # register instances to target group

# resource "aws_lb_target_group_attachment" "tg_attachment_1" {
#   target_group_arn = aws_lb_target_group.my_target_group.arn
#   target_id        = var.PUBLIC_INSTANCE_IDS[0]
# #   Ports for the selected instances
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "tg_attachment_2" {
#   target_group_arn = aws_lb_target_group.my_target_group.arn
#   target_id        = var.PUBLIC_INSTANCE_IDS[1]
# #   Ports for the selected instances
#   port             = 80
# }

