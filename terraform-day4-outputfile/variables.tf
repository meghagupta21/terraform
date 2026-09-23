variable "instance_type" {
    description = "instance type"
default = ""
}

variable "ami" {
    description = "ami id"
    default = ""
}

variable "tags" {
    description = "tags for the instance"
    default = {
        Name = ""
    }
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    default = ""
}

variable "vpc_name" {
    description = "Name for the VPC"
    default = ""
}