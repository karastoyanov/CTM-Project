terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
        version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.token
}

# Create TrollParts Inc. project in DigitalOcean
resource "digitalocean_project" "development" {
  name        = "TrollParts"
  description = "A project to migrate TrollParts Inc. to DigitalOcean"
  purpose     = "Web Application"
  environment = "Development"
  resources = flatten([
    [for droplet in digitalocean_droplet.apache-server : droplet.id],
    digitalocean_loadbalancer.web-lb[0].id
  ])
}
