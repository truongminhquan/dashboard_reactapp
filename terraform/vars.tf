variable AWS_REGION {
  type        = string
  default     = "ap-southeast-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "ECS_AMIS" {
  default = "ami-07b84da235be1cfcb"
}

variable DOCKER_IMAGE_TAG {
}
