output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.public.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "route_table_id" {
  value = aws_route_table.public.id
}

output "security_group_id" {
  value = aws_security_group.main.id
}

output "instance_id" {
  value = aws_instance.main[*].id
}

output "instance_public_ip" {
  value = aws_instance.main[*].public_ip
}

output "logs_bucket" {
  value = aws_s3_bucket.logs.bucket
}