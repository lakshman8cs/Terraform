variable "project_name" {
  type        = string
  default     = "myproject18-248414"
  description = "value of the project name"
}

variable "instance_name" {
  type    = string
  default = "flask-app-instance"
}

variable "vpc-name" {
  type    = string
  default = "lakshman-network"
}

variable "subnetwork-name" {
  type    = string
  default = "lakshman-subnetwork"
}

variable "ip_cidr_range" {
  type    = string
  default = "10.2.0.0/16"
}
