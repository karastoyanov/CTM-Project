# Cluster with PostgreSQL database for the customers
resource "digitalocean_database_cluster" "cluster-jupiter" {
  name       = "postgres-cluster-jupiter"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-2gb"
  region     = "fra1"
  node_count = 2
}
resource "digitalocean_database_db" "spareparts-db" {
  cluster_id = digitalocean_database_cluster.cluster-jupiter.id
  name       = "spareparts-db"
}

resource "digitalocean_database_firewall" "jupiter-firewall" {
  cluster_id = digitalocean_database_cluster.cluster-jupiter.id
  rule {
    type = "ip_addr"
    value = "0.0.0.0"
  }
}




# MongoDB cluster for company's customers
resource "digitalocean_database_cluster" "cluster-mars" {
  name       = "mongo-cluster-mars"
  engine     = "mongodb"
  version    = "5"
  size       = "db-s-1vcpu-2gb"
  region     = "fra1"
  node_count = 1
}

resource "digitalocean_database_db" "customers-db" {
  cluster_id = digitalocean_database_cluster.cluster-mars.id
  name       = "customers-db"
}


