# Deploy Load Balancer for the Apache Web Servers
resource "digitalocean_loadbalancer" "web-lb" {
  count     = 1
  name      = "lb-website"
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

  droplet_ids = digitalocean_droplet.apache-server[*].id
}