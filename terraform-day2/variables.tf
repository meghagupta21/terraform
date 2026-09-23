variable "cider_block" {
    description = "The CIDR block for the VPC"
    type        = string
    default = ""
  
}
variable "subnet_cidr" {
    type=string
    description = ""
  default = ""
}
variable "subnet_name" {
  type=string
  default = "subnet1"
}
variable "vpc_name"{
    type=string
    default="vpc1"
}