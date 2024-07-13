variable "instance_type" {
    description = "Specify the instance type"
    type = string
    default = "t2.medium"
}

variable "tags" {
    description = "Provide the tagging to AWS machine"
    type = string
    default = "web-server"
}