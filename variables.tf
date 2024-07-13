# variable "instance_type" {
#   description = "Specify the instance type"
#   type        = string
# }

# variable "tags" {
#   description = "Provide the tagging to AWS machine"
#   type        = string
# }

variable "region" {
  description = "AWS region name"
  type        = string
  validation {
    condition     = contains(["us-east-1", "us-west-1"], var.region)
    error_message = "Not going to support this region"
  }
}

variable "server_name" {
  description = "name of the server that we are going to deploy"
  type        = list(string)
}

variable "environment" {
  description = "Environment Name"
  type        = string
  validation {
    condition     = contains(["test", "prod"], var.environment)
    error_message = "Not goinig to support this environment"
  }
}

variable "ami_id" {
  description = "AWS machine AMI"
  type        = map(any)
}

variable "key_path" {
  description = "Your public SSH Key path"
  type        = string
  validation {
    condition     = fileexists(var.key_path)
    error_message = "Public SSH key not found"
  }
}

variable "ports" {
  description = "List of ports objects"
  type        = any
}