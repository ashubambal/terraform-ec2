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
}

variable "ami_id" {
  description = "AWS machine AMI"
  type        = map(any)
  default = {
    "us-east-1" = "ami-0a0e5d9c7acc336f1"
    "us-west-1" = "ami-0ff591da048329e00"
  }
}
