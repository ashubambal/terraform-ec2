region      = "us-east-1"
server_name = ["web-testing", "web-production"]
ami_id = {
  "us-east-1" = "ami-0a0e5d9c7acc336f1"
  "us-west-1" = "ami-0ff591da048329e00"
}
environment = "test"
key_path    = "./id_rsa.pub"
ports = [
  {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80
    to_port     = 90
    cidr_blocks = ["192.168.1.0/24"]
  },
  {
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["192.168.2.0/24"]
  }
]