variable "instance_type" {
  description = "Specify the instance type"
  type        = string
}

variable "tags" {
  description = "Provide the tagging to AWS machine"
  type        = string
}

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
#   default     = ["web-testing", "web-production","dev"]
  default     = ["web-testing", "web-dev","web-production"]

}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "test"
  validation {
    condition     = contains(["test", "prod"], var.environment)
    error_message = "Not goinig to support this environment"
  }
}

variable "ami_id" {
  description = "AWS machine AMI"
  type        = map(any)
  default = {
    "us-east-1" = "ami-0a0e5d9c7acc336f1"
    "us-west-1" = "ami-0ff591da048329e00"
  }
}
