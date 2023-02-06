terraform {
  required_version = ">= 1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3"
    }
  }
}

provider "aws" {
  region = var.aws_region
  profile    = var.profile

  default_tags {
    tags = var.default_tags
  }
}

terraform {
  backend "s3" {
    region         = "eu-west-2"
    bucket         = "jenkins-terraform-backend-1"
    key            = "ecs.terraform.tfstate"
  }
}

