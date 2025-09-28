variable "projectName" {
  default = "terraform-tech-food"
}

variable "region_default" {
  default = "us-east-1"
}

variable "cidr_vpc" {
  default = "10.0.0.0/16"
}

variable "tags" {
  default = {
    Name = "fiap-terraform-tech-food"
    Environment = "dev"
  }
}

variable "intance_type" {
  default = "t2.micro"
}