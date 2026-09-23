# resource "aws_vpc" "my-vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "my-vpc"
#   }
# }

# //subnet

# resource "aws_subnet" "my-subnet" {
#   vpc_id     = aws_vpc.my-vpc.id
#   cidr_block = "10.0.1.0/24"
#   tags = {
#     Name = "my-subnet"
#   }
# }
# //route table
# resource "aws_route_table" "my-route-table" {
#   vpc_id = aws_vpc.my-vpc.id
#   tags = {
#     Name = "my-route-table"
#   }
# }
# //internet gateway
# resource "aws_internet_gateway" "my-igw" {
#   vpc_id = aws_vpc.my-vpc.id
#   tags = {
#     Name = "my-igw"
#   }
# }
# //route subnet association

# resource "aws_route_table_association" "my-route-table-association" {
#   subnet_id      = aws_subnet.my-subnet.id
#   route_table_id = aws_route_table.my-route-table.id
# }
# //instance
# resource "aws_instance" "my-instance" {
#   ami           = "ami-0b2c9d1f3edcfd709"
#   instance_type = "t2.micro"
#   subnet_id     = aws_subnet.my-subnet.id
#   tags = {
#     Name = "my-instance1"
#   }
# }
# //security group
# resource "aws_security_group" "my-security-group" {
#   vpc_id = aws_vpc.my-vpc.id
#   name   = "my-security-group"
#   description = "Allow SSH and HTTP traffic"
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
