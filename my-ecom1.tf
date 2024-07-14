module "my-ecom1" {
  source              = "./modules/ecom"
  ports               = var.ports
  key_path            = var.key_path
  script              = var.script
  private_key         = var.private_key
  project_source      = var.project_source
  project_destination = var.project_destination
  environment         = var.environment
  instance_type       = var.instance_type
}