terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.68.0" # Pins to the latest patch version of 6.68
    }
  }
}