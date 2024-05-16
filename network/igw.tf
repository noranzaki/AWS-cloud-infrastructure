resource "aws_internet_gateway" "my-igw" {
    vpc_id=aws_vpc.myvpc.id
    tags = {
    Name = "my-igw"
    }
}