output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.this.id
}

output "vpc_arn" {
  description = "ARN de la VPC creada"
  value       = aws_vpc.this.arn
}

output "cidr_block" {
  description = "CIDR block de la VPC"
  value       = aws_vpc.this.cidr_block
}