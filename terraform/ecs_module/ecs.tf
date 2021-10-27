# cluster
resource "aws_ecs_cluster" "main_cluster" {
  name = "main_cluster"
}

# service
resource "aws_ecs_service" "main_reacctapp_service" {
  name            = "main_reactapp"
  cluster         = aws_ecs_cluster.main_cluster.id
  # task_definition = aws_ecs_task_definition.main_reactapp_task_definition.arn
  task_definition = var.MAIN_REACTAPP_TASK_DEFINITION_ARN

  desired_count   = 3

  # iam_role        = module.iam.ecs_service_role_arn
  iam_role = var.ECS_SERVICE_ROLE_ARN
  load_balancer {
    # target_group_arn = aws_lb_target_group.my_target_group.arn
    target_group_arn = var.TARGET_GROUP_ARN
    container_name   = "main_reactapp_container"
    container_port   = 80
  }
  
  # depends_on      = [module.iam.ecs_service_attach1]
  depends_on      = [var.DEPENDS_ON]

}