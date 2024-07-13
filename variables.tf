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
  type = string
  default = "us-east-1"
}