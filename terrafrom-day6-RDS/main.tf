resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
    tags = {
        Name = "main-vpc"
    }   
      enable_dns_support   = true
  enable_dns_hostnames = true
}


resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id
    tags = {
        Name = "main-igw"
    }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id
    tags = {
        Name = "main-route-table"
    }
}


resource "aws_route" "route" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}


resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "route_table_association2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.route_table.id
}
resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"
        tags = {
            Name = "main-subnet"
        }
}


resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"
        tags = {
            Name = "main-subnet"
        }
}

resource "aws_security_group" "sg" {
  name        = "main-security-group"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "subnetgroup" {
  name        = "main-subnet-group"
  description = "Main subnet group"
  subnet_ids  = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
}

resource "aws_db_instance" "main" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
 identifier = "main-db-instance1"
 tags = {
   name="main-db-instance2"
 }
  username             = "admin"
  password             = "password123"
  parameter_group_name = "default.mysql8.0"
  publicly_accessible  = true
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.sg.id]
  db_subnet_group_name   = aws_db_subnet_group.subnetgroup.name
}