data "digitalocean_droplet" "docker-host" {
    name = "docker-host"
}

data "digitalocean_droplet" "jenkins-host" {
    name = "jenkins-host"
}

data "digitalocean_droplet" "dev-station-1" {
    name = "dev-station-1"
}

data "digitalocean_droplet" "dev-station-3" {
    name = "dev-station-3"
}


# Cluster with PostgreSQL database for the customers
resource "digitalocean_database_cluster" "cluster-jupiter" {
  name       = "postgres-cluster-jupiter"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-2gb"
  region     = "sfo3"
  node_count = 2
}

resource "digitalocean_database_db" "nexus-db" {
  cluster_id = digitalocean_database_cluster.cluster-jupiter.id
  name       = "nexus-db"
}

resource "digitalocean_database_db" "cipher-forge-db" {
  cluster_id = digitalocean_database_cluster.cluster-jupiter.id
  name       = "cipher-forge-db"
}

resource "digitalocean_database_firewall" "jupiter-firewall" {
  cluster_id = digitalocean_database_cluster.cluster-jupiter.id
  rule {
    type  = "droplet"
    value = data.digitalocean_droplet.docker-host.id
  }

  rule {
    type  = "droplet"
    value = data.digitalocean_droplet.jenkins-host.id
  }
  rule {
    type  = "droplet"
    value = data.digitalocean_droplet.dev-station-1.id
  }
  rule {
    type  = "droplet"
    value = data.digitalocean_droplet.dev-station-3.id
  }
}

resource "digitalocean_database_connection_pool" "pool-jupiter-01" {
  cluster_id = digitalocean_database_cluster.cluster-jupiter.id
  name       = "pool-jupiter-01"
  mode       = "transaction"
  size       = 20
  db_name    = "nexus-db"
  user       = "doadmin"
}

# ------------------------------------------------ #

# MongoDB cluster for company's customers
resource "digitalocean_database_cluster" "cluster-mars" {
  name       = "mongo-cluster-mars"
  engine     = "mongodb"
  version    = "5"
  size       = "db-s-1vcpu-2gb"
  region     = "fra1"
  node_count = 1
}

resource "digitalocean_database_db" "solar-scribe-db" {
  cluster_id = digitalocean_database_cluster.cluster-mars.id
  name       = "solar-scribe-db"
}

resource "digitalocean_database_db" "infinite-relic-db" {
  cluster_id = digitalocean_database_cluster.cluster-mars.id
  name       = "infinite-relic-db"
}
resource "digitalocean_database_firewall" "mars-firewall" {
  cluster_id = digitalocean_database_cluster.cluster-mars.id
    rule {
    type  = "droplet"
    value = data.digitalocean_droplet.docker-host.id
  }

  rule {
    type  = "droplet"
    value = data.digitalocean_droplet.jenkins-host.id
  }
  rule {
    type  = "droplet"
    value = data.digitalocean_droplet.dev-station-1.id
  }
  rule {
    type  = "droplet"
    value = data.digitalocean_droplet.dev-station-3.id
  }
}


