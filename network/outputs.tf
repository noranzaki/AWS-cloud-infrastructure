output "subnets"{
    value=aws_subnet.subnets
}

output "vpc_id"{
    value=aws_vpc.myvpc.id
}

output "vpc_cidr"{
    value=aws_vpc.myvpc.cidr_block
}