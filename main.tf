# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical1
# }

resource "aws_instance" "web" {
  # ami             = data.aws_ami.ubuntu.id
  # ami             = var.ami_id[var.region]
  # ami             = lookup(var.ami_id, var.region, "ami-0ad21ae1d0696ad58")
  ami             = try(var.ami_id[var.region],"ami-0ad21ae1d0696ad58")
  instance_type   = var.instance_type
  key_name        = aws_key_pair.deployer.id
  security_groups = [aws_security_group.sg-web.name]

  tags = {
    Name = var.tags
  }
}