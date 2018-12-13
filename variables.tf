# Defining all variables to be used

variable "key_pair_name" {
  description = "ECS key pair name"
}

variable "region" {
  description = "AWS region"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on region"
  type = "map"
  default = {
    ap-southeast-2 = "ap-southeast-2"
  }
}

########################### VPC Config ################################

variable "sinatra-app-vpc" {
  description = "VPC for sinatra-app environment"
}

variable "sinatra-app_network_cidr" {
  description = "IP addressing for sinatra-app Network"
}

variable "sinatra-app-public-subnet-01_cidr" {
  description = "Public CIDR for externally accessible subnet"
}

variable "sinatra-app" {
  description = "Environment tag name"
}

