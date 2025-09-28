terraform {
  backend "s3" {
    bucket = "techfood-terraform-state"
    key    = "techfood/terraform.tfstate"
    region = "us-east-1"
  }
  # resto da configuração...
}

# terraform {
#   cloud {
#     organization = "TechFood"

#     workspaces {
#       name = "nao criado ainda"
#     }
#   }
# }