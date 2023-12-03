terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
    #   version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
    token = var.token
}

data "digitalocean_project" "TrollParts" {
  name        = "TrollParts"
}

resource "digitalocean_droplet" "web-site" {
  image     = "ubuntu-22-04-x64"
  name      = "terraform-test"
  region    = "fra1"
  size      = "s-1vcpu-1gb"
#   user_data = file("terramino_app.yaml")
}

resource "digitalocean_project_resources" "TrollParts" {
  project = data.digitalocean_project.TrollParts.id
  resources = [
     digitalocean_droplet.web-site.urn
  ]
}