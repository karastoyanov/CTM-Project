# This section should declare the Web Servers initiated by Vagrant
data "digitalocean_droplet" "eu-web-server-1" {
    name = "eu-web-server-1"
}
data "digitalocean_droplet" "eu-web-server-2" {
    name = "eu-web-server-2"
}

data "digitalocean_droplet" "eu-web-server-3" {
    name = "eu-web-server-3"
}

data "digitalocean_droplet" "us-web-server-1" {
    name = "us-web-server-1"
}

data "digitalocean_droplet" "us-web-server-2" {
    name = "us-web-server-2"
}

data "digitalocean_droplet" "us-web-server-3" {
    name = "us-web-server-3"
}

# Deploy Load Balancer for the Apache Web Servers EU region
resource "digitalocean_loadbalancer" "eu-web-lb" {
  count     = 1
  name      = "lb-company-website-eu-region"
  region    = "fra1"
  algorithm = "least_connections" # load balancing algorithm to determine which Droplet will be accessed

  # A list of rules for the Load Balancer
  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [
    data.digitalocean_droplet.eu-web-server-1.id,
    data.digitalocean_droplet.eu-web-server-2.id,
    data.digitalocean_droplet.eu-web-server-3.id
  ]
}

# Deploy Load Balancer for the Apache Web Servers US region
resource "digitalocean_loadbalancer" "us-web-lb" {
  count     = 1
  name      = "lb-company-website-us-region"
  region    = "sfo3"
  algorithm = "least_connections" # load balancing algorithm to determine which Droplet will be accessed

  # A list of rules for the Load Balancer
  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = [
    data.digitalocean_droplet.us-web-server-1.id,
    data.digitalocean_droplet.us-web-server-2.id,
    data.digitalocean_droplet.us-web-server-3.id
  ]
}