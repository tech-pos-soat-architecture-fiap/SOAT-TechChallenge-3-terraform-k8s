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

variable "jwt_layer_arn" {
  type        = string
  description = "ARN da Lambda Layer existente (jwt-layer)"
  default     = "arn:aws:lambda:us-east-1:207347338383:layer:jwt-layer:1"
}