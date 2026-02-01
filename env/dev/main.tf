module "network_ec2" {
  source         = "../modules/ec2_vpc"
  vpc_cidr       = "10.0.0.0/16"
  subnet_cidr    = "10.0.1.0/24"
  ami_id         = "ami-id"
  instance_type  = "t3.micro"
}
