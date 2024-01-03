resource "digitalocean_container_registry" "pirates-treasure" {
  name = "pirates-treasure-registry"
  subscription_tier_slug = "starter"
  region = "fra1"
}