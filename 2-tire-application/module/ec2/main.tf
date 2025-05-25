resource "aws_instance" "instance-1" {
    ami = "ami-0c1ac8a41498c1a9c"
    instance_type = "t3.micro"
    key_name = "jenkins"
    subnet_id = var.public_subnet_ids[0]
    vpc_security_group_ids = [var.public_sg]
    associate_public_ip_address = true

    tags = {
      name = "public-instance-1"
    }
}
resource "aws_instance" "instance-2" {
    ami = "ami-0c1ac8a41498c1a9c"
    instance_type = "t3.micro"
    key_name = "jenkins"
    subnet_id =  var.public_subnet_ids[1]
    vpc_security_group_ids = [var.public_sg]
    associate_public_ip_address = true

     tags = {
      name = "public-instance-2"
    }
}
resource "aws_instance" "instance-3" {
    ami = "ami-0c1ac8a41498c1a9c"
    instance_type = "t3.micro"
    key_name = "jenkins"
    subnet_id =  var.private_subnet_ids[0]
    vpc_security_group_ids = [var.private_sg]
    associate_public_ip_address = false

     tags = {
      name = "private-instance-1"
    }
}
resource "aws_instance" "instance-4" {
    ami = "ami-0c1ac8a41498c1a9c"
    instance_type = "t3.micro"
    key_name = "jenkins"
    subnet_id =  var.private_subnet_ids[1]
    vpc_security_group_ids = [var.private_sg]
    associate_public_ip_address = false

     tags = {
      name = "private-instance-2"
    }
}