variable VPC_ZONE_IDENTIFIER {
  type        = list
}

variable MIN_SIZE{
  default = 1
}

variable DESIRED_CAPACITY{
  default = 1
}

variable MAX_SIZE{
  default = 1  
}

variable HEALTH_CHECK_TYPE{
    default = "ELB"
}

variable IMAGE_ID {}

variable INSTANCE_TYPE {
    default = "t2.micro"
}

variable KEY_NAME {
}

variable IAM_INSTANCE_PROFILE {
}

variable SECURITY_GROUPS {
    
}