resource "aws_internet_gateway" "my-igw" {
    tags = {
    Name = "my-igw"
    }
}

resource "aws_internet_gateway_attachment" "my-igw" {
    internet_gateway_id = aws_internet_gateway.my-igw.id
    vpc_id = aws_vpc.myvpc.id
}

 