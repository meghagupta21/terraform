# resource "aws_vpc" "name" {
#     cidr_block = var.cider_block
#     tags = {
#         Name = var.vpc_name
#     }
  
# }
# resource "aws_subnet" "subnet" {
#     vpc_id = aws_vpc.name.id
#     cidr_block = var.subnet_cidr
    
#     tags = {
#         Name = var.subnet_name
#     }
# }