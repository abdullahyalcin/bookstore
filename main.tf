resource "aws_instance" "instance" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.al2023
  tags = {
    Name = "Web Server of Bookstore"
  }
  key_name = var.key-name

}

resource "aws_security_group" "sec-grp" {
  name = "secgrp-port80"
  vpc_id = data.aws_vpc.selected
  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

}

