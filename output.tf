output "public_IP" {
  value = [for key, value in aws_instance.web : value.public_ip]
}