resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = { Name = "app-vpc" }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "app-ec2"
  }
}
