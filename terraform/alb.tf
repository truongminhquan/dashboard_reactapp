# resource "aws_lb" "my_alb" {
#     name               = "my-alb"
#     internal           = false
#     load_balancer_type = "application"
#     security_groups    = [module.securitygroup.alb_security_group_id]
#     subnets            = [module.vpc.public_subnet_1_id,module.vpc.public_subnet_2_id,module.vpc.public_subnet_3_id]

#     enable_deletion_protection = false
# }

# # target groups
# resource "aws_lb_target_group" "my_target_group" {
#   name     = "my-target-group"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = module.vpc.vpc_id
# }

# # Add listener
# resource "aws_lb_listener" "http_listener" {
#   load_balancer_arn = aws_lb.my_alb.arn
#   port              = "80"
#   protocol          = "HTTP"
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.my_target_group.arn
#   }
# }

# # register instances to target group

# # resource "aws_lb_target_group_attachment" "tg_attachment_1" {
# #   target_group_arn = aws_lb_target_group.my_target_group.arn
# #   target_id        = aws_instance.public_instance_1.id
# # #   Ports for the selected instances
# #   port             = 80
# # }

# # resource "aws_lb_target_group_attachment" "tg_attachment_2" {
# #   target_group_arn = aws_lb_target_group.my_target_group.arn
# #   target_id        = aws_instance.public_instance_2.id
# # #   Ports for the selected instances
# #   port             = 80
# # }

# # output "alb_dns_name"{
# #   value = aws_lb.my_alb.dns_name
# # }