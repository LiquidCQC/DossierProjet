# Configure cloud workspace
terraform {
  cloud {
    organization = "RestoProch"

    workspaces {
      name = "Random"
    }
  }
}
provider "aws" {
  region = var.region
}

