resource "aws_subnet" "public_subnet1" {
    cidr_block = "10.0.1.0/24"
    vpc_id     = aws_vpc.myvpc.id
    availability_zone = "eu-west-1a"
    tags = {
        Name = "public_subnet1" 
    }
}

resource "aws_subnet" "public_subnet2" {
    cidr_block = "10.0.2.0/24"
    vpc_id     = aws_vpc.myvpc.id
    availability_zone = "eu-west-1b"
    tags = {
        Name = "public_subnet2" 
    }
}