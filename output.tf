output "bookstore_api_url" {
  value = aws_instance.instance.public_dns
}
