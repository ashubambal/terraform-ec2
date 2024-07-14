variable "region" {
  description = "AWS region name"
  type        = string
}

variable "server_name" {
  description = "name of the server that we are going to deploy"
  type        = list(string)
}

variable "key_path" {
  description = "Your public SSH Key path"
  type        = string
  validation {
    condition     = fileexists(var.key_path)
    error_message = "Public SSH key not found"
  }
}

variable "script" {
  description = "nginx installation script"
  type        = string
  validation {
    condition     = fileexists(var.script)
    error_message = "file not found"
  }
}


variable "private_key" {
  description = "Your private_key SSH Key path"
  type        = string
  validation {
    condition     = fileexists(var.private_key)
    error_message = "private key not found"
  }
}

variable "ports" {
  description = "List of ports objects"
  type        = any
}

variable "project_source" {
  description = "Enter your project folder path"
  type        = string
}

variable "project_destination" {
  description = "Enter your project destination folder path"
  type        = string
}