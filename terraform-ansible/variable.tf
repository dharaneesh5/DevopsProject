variable "key_name" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "ami" {
  default = "ami-0c1ac8a41498c1a9c"
}

variable "region" {
  default = "eu-north-1"
}