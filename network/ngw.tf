resource "aws_eip" "myeip" {
    domain= "vpc"
    tags={
        "Name" = "myeip"
    } 
}

resource "aws_nat_gateway" "my-ngw" {
    allocation_id = aws_eip.myeip.id
    subnet_id     = aws_subnet.subnets["public1"].id
    tags={
        Name = "my-ngw"
    } 
}