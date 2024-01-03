data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]
}
data "aws_vpc" "selected" {
  default = true
}