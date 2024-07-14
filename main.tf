data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical1
}

resource "aws_instance" "web" {
  # meta -agruments
  # count = length(var.server_name)

  for_each = toset(var.server_name)
  # ami             = data.aws_ami.ubuntu.id
  # ami             = var.ami_id[var.region]
  # ami             = lookup(var.ami_id, var.region, "ami-0ad21ae1d0696ad58")
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.environment == "test" ? "t2.micro" : "t2.medium"
  key_name        = aws_key_pair.deployer.id
  security_groups = [aws_security_group.sg-web.name]

  tags = {
    Name = each.key
  }
  user_data = file(var.script)

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = file(var.private_key)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    script = var.script
  }

  provisioner "file" {
    source      = var.project_source
    destination = var.project_destination
  }
}