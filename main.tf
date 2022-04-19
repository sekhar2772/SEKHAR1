provider "aws"{
  region = "us-east-1"
}
resource "aws_instance" "ec2_example" {
  ami           = "ami-03ededff12e34e59e"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = "EC2 Instance with remote state"
  }
}

terraform {
  backend "s3" {
    bucket = "sekhar123"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
