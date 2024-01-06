# K8S clustering
resource "digitalocean_kubernetes_cluster" "nebula-orbit" {
  name    = "nebula-orbit"
  region  = "sfo3"
  version = "1.28.2-do.0" # Recommended version

  node_pool {
    name       = "nebula-orbit-x001v001"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }
}

resource "digitalocean_kubernetes_cluster" "quantum-wave" {
  name    = "quantum-wave"
  region  = "sfo3"
  version = "1.28.2-do.0" # Recommended version


  node_pool {
    name       = "quantum-wave-x001v001"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }
}

resource "digitalocean_kubernetes_cluster" "zenith-pulse" {
  name    = "zenith-pulse"
  region  = "sfo3"
  version = "1.28.2-do.0" # Recommended version

  node_pool {
    name       = "zenith-pulse-x001v001"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

}

resource "digitalocean_kubernetes_cluster" "zenith-pulse-2" {
  name    = "zenith-pulse-2"
  region  = "sfo3"
  version = "1.28.2-do.0" # Recommended version

  node_pool {
    name       = "zenith-pulse-x001v002"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }
}
