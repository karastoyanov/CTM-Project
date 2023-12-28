# Cluster with PostgreSQL database for the customers
resource "digitalocean_database_cluster" "cluster-jupiter" {
  name       = "postgres-cluster-jupiter"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}

# Customers Database with MongoDB database
resource "digitalocean_database_cluster" "cluster-mars" {
  name       = "mongo-cluster-mars"
  engine     = "mongodb"
  version    = "6"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}

resource "digitalocean_database_db" "spareparts-db" {
  cluster_id = "digitalocean_database_cluster.cluster-jupiter"
  name       = "spareparts-db"
}
