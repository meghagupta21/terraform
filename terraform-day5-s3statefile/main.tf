# resource "aws_s3_bucket" "s3statefile" {
#     bucket = "my-terraform-statefile"


  
# }

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my-vpc2"
    }
}