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

# Deploy n-count Apache Web Servers to host the company's website
resource "digitalocean_droplet" "apache-server" {
  count  = 3
  image  = "ubuntu-22-04-x64"
  name   = "company-web-site-host${count.index + 1}"
  region = "fra1"
  size   = "s-1vcpu-1gb"
}


# Deploy Load Balancer for the Apache Web Servers
resource "digitalocean_loadbalancer" "web_lb" {
  count  = 1
  name   = "nginx-load_balancer"
  region = "fra1"
  algorithm = least_connections # load balancing algorithm to determine which Droplet will be accessed
  
  # A list of rules for the Load Balancer
  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    port = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.apache-server[*].id
  size = "s-1vcpu-1gb"

}

resource "digitalocean_project_resources" "TrollParts" {
  project = data.digitalocean_project.TrollParts.id
  resources = [
    digitalocean_droplet.web-site.urn
  ]
}
