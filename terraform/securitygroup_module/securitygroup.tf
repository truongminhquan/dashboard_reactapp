resource "aws_security_group" "public_security_group" {
    name = "public_security_group"
    description = "Security group for instances in public subnet"
    vpc_id = var.VPC_ID

    ingress{
        description = "Allow ssh from everywhere"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        description = "Allow access to all ports from alb"
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        # cidr_blocks = ["0.0.0.0/0"]
        security_groups = [aws_security_group.alb_security_group.id]

    } 

    # dynamic "ingress" {
    #     for_each = var.SECURITY_GROUP_ATTRIBUTE
    #     content {
    #         description = ingress.value[1]
    #         from_port = ingress.value[0]
    #         to_port = ingress.value[0]
    #         protocol = "tcp"
    #         # cidr_blocks = ["0.0.0.0/0"]
    #         security_groups = [aws_security_group.public_security_group.id]

    #     }
    # }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "alb_security_group" {
    name = "alb_security_group"
    description = "Security group for instances in public subnet"
    vpc_id = var.VPC_ID

    ingress{
        description = "Allow http from everywhere to alb"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 

    # dynamic "ingress" {
    #     for_each = var.SECURITY_GROUP_ATTRIBUTE
    #     content {
    #         description = ingress.value[1]
    #         from_port = ingress.value[0]
    #         to_port = ingress.value[0]
    #         protocol = "tcp"
    #         cidr_blocks = ["0.0.0.0/0"]
    #     }
    # }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_security_group" "private_security_group" {
    name = "private_security_group"
    description = "Security group for instances in private subnet"
    vpc_id = var.VPC_ID
    ingress{
        description = "Allow ssh from public instance"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [aws_security_group.public_security_group.id]

    }  
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}