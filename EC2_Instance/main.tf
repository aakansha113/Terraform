#creating vpc
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Main"
  }

}

resource "aws_subnet" "ssubnet" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "subnet1"
  }
  #availability_zone = "us-east-2"
  cidr_block = "10.0.0.0/24"

}
resource "aws_internet_gateway" "igww" {
  tags = {
    Name = "igw"
  }
  vpc_id = aws_vpc.main.id

}

resource "aws_route_table" "route" {
  tags = {
    Name = "rt1"
  }
  vpc_id = aws_vpc.main.id

}

resource "aws_route_table_association" "traffic" {
  subnet_id      = aws_subnet.ssubnet.id
  route_table_id = aws_route_table.route.id

}

resource "aws_route" "attrt" {
  route_table_id         = aws_route_table.route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igww.id
}


resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "keyinstance"
  tags = {
    Name = "instance2"
  }
  subnet_id                   = aws_subnet.ssubnet.id
  associate_public_ip_address = true

}
