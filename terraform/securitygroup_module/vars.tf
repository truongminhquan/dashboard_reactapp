/**
First element indicates port number
Second element indicates description
*/
variable SECURITY_GROUP_ATTRIBUTE {
  type        = list
  default     = [[22, "Allow SSH"], [80, "Allow HTTP"]]
}

variable VPC_ID {
}