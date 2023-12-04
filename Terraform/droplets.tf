# Deploy n-count Apache Web Servers to host the company's website
resource "digitalocean_droplet" "apache-server" {
  count  = 3
  image  = "ubuntu-22-04-x64"
  name   = "company-web-site-host${count.index + 1}"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  provisioner "remote-exec" {
    inline = [
      "chmod +x /web-setup/web_bootstrap.sh",
      "./web-setup/web_bootstrap.sh",
    ]
  }
}
