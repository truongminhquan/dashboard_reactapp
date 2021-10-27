# Main VPC
resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "main"
    }
}

# Public subnet
resource "aws_subnet" "public_subnet_1" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.PUBLIC_SUBNETS[0]
    map_public_ip_on_launch = "true"
    availability_zone = var.AVAILABILITY_ZONE[0]
    tags = {
        Name = "public_subnet_1"
    }
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.PUBLIC_SUBNETS[1]
    map_public_ip_on_launch = "true"
    availability_zone = var.AVAILABILITY_ZONE[1]
    tags = {
        Name = "public_subnet_2"
    }
}

resource "aws_subnet" "public_subnet_3" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.PUBLIC_SUBNETS[2]
    map_public_ip_on_launch = "true"
    availability_zone = var.AVAILABILITY_ZONE[2]
    tags = {
        Name = "public_subnet_3"
    }
}

# Private subnet
resource "aws_subnet" "private_subnet_1" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.PRIVATE_SUBNETS[0]
    map_public_ip_on_launch = "false"
    availability_zone = var.AVAILABILITY_ZONE[0]
    tags = {
        Name = "private_subnet_1"
    }
}

resource "aws_subnet" "private_subnet_2" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.PRIVATE_SUBNETS[1]
    map_public_ip_on_launch = "false"
    availability_zone = var.AVAILABILITY_ZONE[1]
    tags = {
        Name = "private_subnet_2"
    }
}

resource "aws_subnet" "private_subnet_3" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.PRIVATE_SUBNETS[2]
    map_public_ip_on_launch = "false"
    availability_zone = var.AVAILABILITY_ZONE[2]
    tags = {
        Name = "private_subnet_3"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "main_igw" {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
        Name = "gateway"
    }
}

# Route table
resource "aws_route_table" "main_route_table" {
    vpc_id = aws_vpc.main_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main_igw.id
    }
    

    tags = {
        Name = "main_route_table"
    }
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.main_vpc.id

    tags = {
        Name = "private_route_table"
    }
}

# route associations public
resource "aws_route_table_association" "main_public_1a" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.main_route_table.id
}

resource "aws_route_table_association" "main_public_2a" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.main_route_table.id
}

resource "aws_route_table_association" "main_public_3a" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.main_route_table.id
}

# route associations private
resource "aws_route_table_association" "main_private_1a" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "main_private_2a" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "main_private_3a" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_vpc_endpoint" "s3_vpc_endpoint" {
  vpc_id       = aws_vpc.main_vpc.id
  service_name = "com.amazonaws.ap-southeast-1.s3"
}

resource "aws_vpc_endpoint_route_table_association" "vpc_endpoint_association" {
  route_table_id  = aws_route_table.private_route_table.id
  vpc_endpoint_id = aws_vpc_endpoint.s3_vpc_endpoint.id
}

# # NACL
# resource "aws_network_acl" "main-public-nacl" {
#     vpc_id = aws_vpc.main-vpc.id

#     dynamic "ingress" {
#         for_each = var.NACL_ATTRIBUTE
#         content {
#             rule_no    = ingress.value[0]
#             action     = ingress.value[1]
#             from_port = ingress.value[2]
#             to_port = ingress.value[2]
#             protocol = "tcp"
#             cidr_block = "0.0.0.0/0"
#         }
#     }

#     egress {
#         rule_no    = 100
#         action     = "allow"
#         from_port       = 0
#         to_port         = 0
#         protocol        = "-1"
#         cidr_block = "0.0.0.0/0"
#     }

#     # Associated subnet
#     subnet_ids = [aws_subnet.public-subnet-1.id]

#     tags = {
#         Name = "main-public-nacl"
#     }
# }