variable "public_subnet_ids" {
    description = "this is public subnet id"
    type = list(string)
}
variable "public_sg" {
    description = "this is public subnet id"
    type = string
}

variable "private_sg" {
    description = "this is private-sg"
    type = string
}
variable "private_subnet_ids" {
  type = list(string)
}