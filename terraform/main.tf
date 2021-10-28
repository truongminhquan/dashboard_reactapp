module keypair {
  source = "./keypair_module"
  PATH_TO_PUBLIC_KEY = "mykey.pub"
}

module iam {
  source = "./iam_module"
  ASSUME_ROLE_POLICY = "./policies/ec2_assume_role_policy.json"
  ECS_SERVICE_ASSUME_ROLE_POLICY = "./policies/ecs_service_assume_role_policy.json"
  ECS_EC2_ROLE_POLICY = "./policies/ecs_ec2_role_policy.json"
}

module vpc {
  source = "./vpc_module"
}

module securitygroup {
  source = "./securitygroup_module"
  VPC_ID = module.vpc.vpc_id
}

module alb {
  source = "./alb_module"
  SECURITY_GROUPS = [module.securitygroup.alb_security_group_id]
  SUBNETS = [module.vpc.public_subnet_1_id,module.vpc.public_subnet_2_id,module.vpc.public_subnet_3_id]
  VPC_ID = module.vpc.vpc_id
}

module ecr {
  source = "./ecr_module"
}

module task_definition {
  source = "./task_definition_module"
  REPOSITORY_URL = module.ecr.demo_ecr_reactapp_repository_url
  # IMAGE_TAG = 1
  IMAGE_TAG = var.DOCKER_IMAGE_TAG
  TASK_DEFINITION_TEMPLATE_PATH = "task_definition_template/reactapp_task_definition.json"
}

module ecs {
  source = "./ecs_module"
  MAIN_REACTAPP_TASK_DEFINITION_ARN = module.task_definition.main_reactapp_task_definition_arn
  ECS_SERVICE_ROLE_ARN = module.iam.ecs_service_role_arn
  TARGET_GROUP_ARN = module.alb.my_target_group_arn
  DEPENDS_ON = module.iam.ecs_service_attach1
}

module auto_scaling_group {
  source = "./auto_scaling_group_module"
  VPC_ZONE_IDENTIFIER = [module.vpc.public_subnet_1_id,module.vpc.public_subnet_2_id,module.vpc.public_subnet_3_id]
  MIN_SIZE = 2
  DESIRED_CAPACITY = 3
  MAX_SIZE = 5
  IMAGE_ID = var.ECS_AMIS
  KEY_NAME = module.keypair.key_name
  IAM_INSTANCE_PROFILE = module.iam.ec2_instance_profile_name
  SECURITY_GROUPS = [module.securitygroup.public_security_group_id]
}