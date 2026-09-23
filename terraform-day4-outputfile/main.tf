resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
    }
}
resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.vpc.id
    name = "my-security-group"
    description = "Allow SSH and HTTP traffic"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "ec2instance"{
    
    instance_type = var.instance_type
    ami = var.ami
    subnet_id = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  associate_public_ip_address = true
    tags={
        Name=var.tags
    }

}