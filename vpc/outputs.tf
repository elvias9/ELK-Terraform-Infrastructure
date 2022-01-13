output "my_vpc_id" {
    value = aws_vpc.main_vpc.id
}

output "public_subnet_a_id" {
    value = aws_subnet.public_a.id
}

output "private_subnet_a_id" {
    value = aws_subnet.private_a.id
}

output "private_subnet_b_id" {
    value = aws_subnet.private_b.id
}