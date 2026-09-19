variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "environment" {
  type = string
}

resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags       = { Name = "vpc-${var.environment}" }
}

output "vpc_id" {
  value = aws_vpc.this.id
}