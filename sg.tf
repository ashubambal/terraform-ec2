resource "aws_security_group" "sg-web" {
  description = "SG for web server"
  name        = "allow-tls"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "Allowing port 22"
      from_port   = port.value.from_port
      to_port     = try(port.value.to_port, port.value.from_port)
      protocol    = "tcp"
      cidr_blocks = port.value.cidr_blocks
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}