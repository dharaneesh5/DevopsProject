resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = var.public_subnet1_az
  map_public_ip_on_launch = true 

  tags = {
    Name = "public-subnet1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = var.public_subnet2_az
  map_public_ip_on_launch = true 

  tags = {
    Name = "public-subnet2"
  }
}
resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet1_cidr
  availability_zone       = var.private_subnet1_az
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet1"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet2_cidr
  availability_zone       = var.private_subnet2_az
  map_public_ip_on_launch = false 

  tags = {
    Name = "private-subnet2"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "my-igw"
  }
}
# Security group for ALB

resource "aws_security_group" "alb-sg" {
  name = "alb-sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
   ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

   ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
 
}

#Security group for public-subnet

resource "aws_security_group" "public_sg" {
  name = "pub-sg"
  vpc_id = aws_vpc.vpc.id

   ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_groups = [ aws_security_group.alb-sg.id ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
 
}

#Security group for private-subnet

resource "aws_security_group" "private_sg" {
  name = "pri-sg"
  vpc_id = aws_vpc.vpc.id

   ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    security_groups = [aws_security_group.public_sg.id ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
 
}

#Route table for public-subnet

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
  
}

resource "aws_route_table_association" "public_sub_1a" {
  subnet_id = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_rt.id
  
}

resource "aws_route_table_association" "public_sub_2a" {
  subnet_id = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_rt.id
}

#Eip
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

#Nat

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "NAT Gateway"
  }
}

# route table for private

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "Private Route Table"
  }
}


resource "aws_route_table_association" "private_sub_1a" {
  subnet_id = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt.id
  
}

resource "aws_route_table_association" "private_sub_2a" {
  subnet_id = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_rt.id
}

#Security group for rds-database

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow access to RDS from app servers"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.public_sg.id]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS SG"
  }
}
