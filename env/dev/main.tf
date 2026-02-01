terraform {
  backend "s3" {
    bucket         = "vk-az"
    key            = "dev/terraform.tfstate"
    region         = "ap-northeast-3"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
module "ec2_vpc" {
  source         = "../modules/ec2_vpc"
  vpc_cidr       = "10.0.0.0/16"
  subnet_cidr    = "10.0.1.0/24"
  ami_id         = "ami-04b0f5834ea4c3e32"
  instance_type  = "t3.micro"
}
module "ebs_s3_mod" {
  source      = "../modules/ebs_s3_mod"
  bucket_name = "vk-az"
  az          = "ap-northeast-3a"
  size        = 15
}
