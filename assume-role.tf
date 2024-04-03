/*
here we are connecting with user which do not/have limited original access but we assume role-which has required access
*/

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  cloud { 
    organization = "anuphatwar08" 
    workspaces { 
      name = "assume_role" 
      } 
  }

}

provider "aws" {
  region = "us-east-1"
  # profile = "terraform-cli-user"
  # assume_role {
  #   role_arn = "arn:aws:iam::654654494415:role/terraform-cli-role"
  # }
}

# resource "aws_s3_bucket" "test-s3-bucket" {
#   bucket = "test-s3-bucket"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

resource "aws_instance" "test-ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"

  tags = {
    Name = "test-ec2"
  }
}