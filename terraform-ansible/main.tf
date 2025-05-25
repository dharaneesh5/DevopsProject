provider "aws" {
  region     = var.region
}

resource "aws_security_group" "sg" {
  name        = "ansible-sg"
  description = "Allow SSH within group and from my IP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "master" {
  ami                         = var.ami
  instance_type               = "t3.micro"
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true


  tags = {
    Name = "master"
  }


 # creating a directory for website hosting
 provisioner "remote-exec" {
    inline = ["mkdir -p /home/ubuntu/website"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }


  # Upload website to master (so Ansible can access it)
provisioner "file" {
  source      = "./website/"
  destination = "/home/ubuntu/website/"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}

  # Upload Ansible playbook
  provisioner "file" {
    source      = "app/playbook.yml"
    destination = "/home/ubuntu/playbook.yml"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # 2. Upload the private SSH key 
  provisioner "file" {
    source      = var.private_key_path
    destination = "/home/ubuntu/key.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  # Upload inventory
  provisioner "file" {
    content     = templatefile("template/inventory.tpl", { child_ips = aws_instance.child[*].private_ip, key_path = "/home/ubuntu/key.pem" })
    destination = "/home/ubuntu/inventory"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
      timeout     = "10m"
    }
  }

  # Install Ansible and run playbook
  provisioner "remote-exec" {
    inline = [
      "set -ex",
      "sudo apt update",
      "sudo apt install -y ansible",
      "sudo chmod 400 /home/ubuntu/key.pem"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
      timeout     = "10m"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "set -ex",
      "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i /home/ubuntu/inventory /home/ubuntu/playbook.yml"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
      timeout     = "10m"
    }
  }
}
resource "aws_instance" "child" {
  count                       = 3
  ami                         = var.ami
  instance_type               = "t3.micro"
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]

  tags = {
    Name = "child-${count.index + 1}"
  }

  #---------------------------------
  #--------------------------------------------
}
