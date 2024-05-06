resource "aws_subnet" "private_subnet1" {
    cidr_block = "10.0.3.0/24"
    vpc_id     = aws_vpc.myvpc.id
    availability_zone = "eu-west-1a"
    tags = {
        Name = "private_subnet1" 
    }
}

resource "aws_subnet" "private_subnet2" {
    cidr_block = "10.0.4.0/24"
    vpc_id     = aws_vpc.myvpc.id
    availability_zone = "eu-west-1b"
    tags = {
        Name = "private_subnet2" 
    }
}