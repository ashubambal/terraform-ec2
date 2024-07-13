resource "aws_security_group" "sg-web" {
  description = "SG for web server"
  name        = "allow-tls"
  ingress {
    description = "Allowing port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}