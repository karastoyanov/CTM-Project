terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_ssh_key" "terraform" {
  name = "Default Terraform SSH key"
  public_key = file("~/.ssh/id_rsa")
}

provider "digitalocean" {
  token = var.token
}

# Create TrollParts Inc. project in DigitalOcean
# resource "digitalocean_project" "TrollParts" {
#   name        = "TrollParts"
#   description = "A project to migrate TrollParts Inc. to DigitalOcean"
#   purpose     = "Web Application"
#   environment = "Development"
#   resources = flatten([
#     digitalocean_loadbalancer.web-lb[0].id
#   ])
# }
