# resource "aws_s3_bucket" "s3statefile" {
#     bucket = "my-terraform-statefile"


  
# }

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my-vpc2"
    }
}
resource "aws_instance" "myec2" {
    ami           = "ami-0b2c9d1f3edcfd709"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.subnet.id
    tags = {
        Name = "my-ec2-instance"
    }
}