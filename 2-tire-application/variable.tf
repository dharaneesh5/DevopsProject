variable "cidr" {}
variable "region" {
  description = "this is aws region"
  type        = string
  default     = "eu-north-1"
}
variable "secret_key" {
  description = "this is secret key"
  type        = string
}
variable "access_key" {
  description = "this is access key"
  type        = string
}