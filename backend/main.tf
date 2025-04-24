
resource "aws_instance" "name1" {
  ami           = var.ami
  key_name      = var.keyname
  instance_type = "t2.micro"
  tags = {
    Name = "Instance1"

  }
  associate_public_ip_address = true
}
