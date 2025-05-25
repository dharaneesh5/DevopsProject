variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
}

variable "public_subnet1_az" {
  description = "Availability zone for public subnet 1"
  type        = string
}

variable "public_subnet2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
}

variable "public_subnet2_az" {
  description = "Availability zone for public subnet 2"
  type        = string
}

variable "private_subnet1_cidr" {
  description = "CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet1_az" {
  description = "Availability zone for private subnet 1"
  type        = string
}

variable "private_subnet2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
}

variable "private_subnet2_az" {
  description = "Availability zone for private subnet 2"
  type        = string
}
variable "vpc_igw" {
  description = "this is for igw in vpc"
  type        = string
}
variable "public_sg" {
    type = string
}
variable "private_sg" {
    type = string
}

variable "public-rt" {
    type = string
}

variable "public-sub1a" {
  type=string
}
variable "public-sub2a" {
  type=string
}
variable "eip" {
  type = string
}
variable "nat" {
  type = string
}

variable "private-rt" {
    type = string
}

variable "private-sub1a" {
  type=string
}
variable "private-sub2a" {
  type=string
}
