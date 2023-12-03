terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      #   version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.token
}

# Create TrollParts Inc. project in DigitalOcean
data "digitalocean_project" "TrollParts" {
  name = "TrollParts"
}

resource "digitalocean_project_resources" "TrollParts" {
  project = data.digitalocean_project.TrollParts.id
  # count     = length(digitalocean_droplet.apache-server)
  resources = flatten([
    [for droplet in digitalocean_droplet.apache-server : droplet.id],
    digitalocean_loadbalancer.web-lb[0].id
  ])
}
