region   = "us-east-1"
key_path = "cred/id_rsa.pub"
ports = [
  {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80
    to_port     = 90
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["192.168.2.0/24"]
  }
]
script              = "./deploy.sh"
private_key         = "cred/id_rsa"
project_source      = "./src/"
project_destination = "/var/www/html/"
environment         = "test"