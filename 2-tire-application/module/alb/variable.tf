variable "vpc_id" {
  description = "The VPC ID where the ALB Security Group will be created"
  type        = string
}
variable "public_subnet_ids" {
    description = "this is public subnet id"
    type = list(string)
}
variable "alb_sg" {
    description = "this is alb-sg"
    type=list(string)
  
}