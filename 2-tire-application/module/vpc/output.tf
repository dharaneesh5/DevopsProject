output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_subnet1.id,
    aws_subnet.public_subnet2.id
  ]
}
output "alb_sg" {
    value = aws_security_group.alb-sg.id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_subnet1.id,
    aws_subnet.private_subnet2.id
  ]
}

output "public_sg" {
  value = aws_security_group.public_sg.id
}

output "private_sg" {
  value = aws_security_group.private_sg.id
}
