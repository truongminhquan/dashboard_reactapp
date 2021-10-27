# resource "aws_instance" "public_instance_1" {
#     instance_type = "t2.micro"
#     ami = "ami-073998ba87e205747"

#     # subnet
#     subnet_id = module.vpc.public_subnet_1_id

#     # security group
#     vpc_security_group_ids = [module.securitygroup.public_security_group_id]

#     # key pair
#     key_name = module.keypair.key_name

#     # copy file
#     provisioner "file" {
#       source      = var.PATH_TO_PRIVATE_KEY
#       destination = "/tmp/${var.PATH_TO_PRIVATE_KEY}"
#     }

#     connection {
#       host        = coalesce(self.public_ip, self.private_ip)
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file(var.PATH_TO_PRIVATE_KEY)
#     }

#     # Attach role
#     iam_instance_profile = module.iam.ec2_instance_profile_name


#     # data user
#     user_data = <<-EOF
#       #! /bin/bash
#       yum update -y
#       yum install -y httpd
#       systemctl start httpd
#       systemctl enable httpd
#       echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
#     EOF

# }

# resource "aws_instance" "public_instance_2" {
#     instance_type = "t2.micro"
#     ami = "ami-073998ba87e205747"

#     # subnet
#     subnet_id = module.vpc.public_subnet_1_id

#     # security group
#     vpc_security_group_ids = [module.securitygroup.public_security_group_id]

#     # key pair
#     key_name = module.keypair.key_name

#     # copy file
#     provisioner "file" {
#       source      = var.PATH_TO_PRIVATE_KEY
#       destination = "/tmp/${var.PATH_TO_PRIVATE_KEY}"
#     }

#     connection {
#       host        = coalesce(self.public_ip, self.private_ip)
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file(var.PATH_TO_PRIVATE_KEY)
#     }

#     # Attach role
#     iam_instance_profile = module.iam.ec2_instance_profile_name


#     # data user
#     user_data = <<-EOF
#       #! /bin/bash
#       yum update -y
#       yum install -y httpd
#       systemctl start httpd
#       systemctl enable httpd
#       echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
#    EOF

# }

# output "ip_for_public_instance_1_connection" {
#   value =  "ec2-user@${aws_instance.public_instance_1.public_ip}"
# }

# output "ip_for_public_instance_2_connection" {
#   value =  "ec2-user@${aws_instance.public_instance_2.public_ip}"
# }

# resource "aws_instance" "private_instance" {
#     instance_type = "t2.micro"
#     ami = "ami-073998ba87e205747"

#     # subnet
#     subnet_id = module.vpc.private_subnet_1_id

#     # security group
#     vpc_security_group_ids = [module.securitygroup.private_security_group_id]

#     # key pair
#     key_name = module.keypair.key_name

#     # Attach role
#     iam_instance_profile = module.iam.ec2_instance_profile_name

# }

