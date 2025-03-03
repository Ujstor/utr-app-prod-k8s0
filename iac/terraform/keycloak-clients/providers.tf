terraform {
  backend "s3" {
    bucket                      = "tf-state-k3s0-k3s1-cluster"
    key                         = "keycloak-clients/terraform.tfstate"
    region                      = "us-east-1"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    force_path_style            = true
    endpoint                    = "https://s3.k3s0.ujstor.com"
  }
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.4.0"
    }
  }
  required_version = "~> 1.0"
}

provider "keycloak" {
  client_id = var.client_id
  username  = var.username
  password  = var.password
  url       = var.url
}
