terraform {
  cloud {
    organization = "TechFood"

    workspaces {
      name = "SOAT-TechChallenge-3-terraform-k8s"
    }
  }
}