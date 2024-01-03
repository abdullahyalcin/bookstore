output "bookstore_api_url" {
  value = aws_instance.instance.public_dns
}

output "myec2-public-ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "ssh-connection-command" {
  value = "ssh -i ${var.key-name}.pem ec2-user@${aws_instance.tf-ec2.public_ip}"
}