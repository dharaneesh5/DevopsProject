resource "aws_lb" "alb" {
  name               = "my-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_sg
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "my-app-alb"
  }
}