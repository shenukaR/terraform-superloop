provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_security_group" "ssh_access" {
  name        = "allow-ssh-shenuka"
  description = "Allow SSH access for my IP"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = [var.allowed_ip] # Replace with your specific IP address
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "demoec2" {
  ami                    = var.ami # Ubuntu 20.04 LTS
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = "shenuka-superloop"
  }
}

output "instance_id" {
  value = aws_instance.demoec2.id
}

output "instance_public_ip" {
  value = aws_instance.demoec2.public_ip
}

output "instance_private_ip" {
  value = aws_instance.demoec2.private_ip
}