resource "aws_instance" "instance" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.al2023.id
  key_name      = var.key-name
  vpc_security_group_ids = [aws_security_group.sec-grp.id]
  tags = {
    Name = "Web Server of Bookstore"
  }
  user_data = file("user_data.sh")
}

locals {
  secgr-dynamic-ports = [22,80,443,8080,5000]
}

resource "aws_security_group" "sec-grp" {
  name = "secgrp-port80"
  vpc_id = data.aws_vpc.selected.id
  dynamic "ingress" {
    for_each = local.secgr-dynamic-ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



