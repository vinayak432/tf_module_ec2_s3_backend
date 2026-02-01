terraform {
  backend "s3" {
    bucket         = "vk-az"
    key            = "dev/terraform.tfstate"
    region         = "ap-northeast-3"
    encrypt        = true
  }
}