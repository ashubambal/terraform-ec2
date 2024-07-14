
locals {
  environment = var.environment
  tags = {
    Name = "app-${var.environment}"
  }
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu_focal.id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.deployer.id
  security_groups = [aws_security_group.sg-web.name]
  tags = local.tags
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