/**
First element indicates rule number
Second element indicates action
Third element indicates port number
*/
variable NACL_ATTRIBUTE {
  type        = list
  default     = [[100,"allow",22], [110,"allow",80]]
}

variable PUBLIC_SUBNETS {
  type        = list
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable PRIVATE_SUBNETS {
  type        = list
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable AVAILABILITY_ZONE {
  type        = list
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}