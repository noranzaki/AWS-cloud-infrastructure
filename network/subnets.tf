resource "aws_subnet" "subnets" {
    for_each = { for subnet in var.subnets : subnet.name => subnet }

    vpc_id            = aws_vpc.myvpc.id
    cidr_block        = each.value.cidr
    availability_zone = each.value.availability_zone
    tags = {
        Name = "${each.value.name}_subnet"
    }
}