resource "aws_security_group" "public_sg" {
    name        = "public_sg"
    description = "Allow ssh inbound traffic and all outbound traffic"
    vpc_id      = aws_vpc.myvpc.id

    tags = {
        Name = "public_sg"
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
}

resource "aws_security_group" "private_sg" {
    name        = "private_sg"
    description = "Allow ssh and port 3000 from vpc cidr only"
    vpc_id      = aws_vpc.myvpc.id
    tags = {
        Name = "private_sg"
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        cidr_blocks = [aws_vpc.myvpc.cidr_block]
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [aws_vpc.myvpc.cidr_block]
    }

}