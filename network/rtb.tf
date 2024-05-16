resource "aws_route_table" "route_tables" {
  count=2
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block =  var.cidr_zero
    gateway_id = count.index == 0? aws_internet_gateway.my-igw.id:aws_nat_gateway.my-ngw.id
  }
  tags = {
    Name = count.index == 0? "public_rtb": "private_rtb"
  }
}
resource "aws_route_table_association" "subnet_association" {
 
  for_each = { for s, subnet in var.subnets : s => subnet }

  subnet_id      = aws_subnet.subnets[each.value.name].id
  route_table_id = each.value.type == "public" ? aws_route_table.route_tables[0].id : aws_route_table.route_tables[1].id
  provisioner "local-exec" {
    command = "echo ${each.value.name}"
  }

}
