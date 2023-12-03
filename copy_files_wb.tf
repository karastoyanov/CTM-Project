resource "null_resource" "copy_files" {
  count = length(digitalocean_droplet.apache-server)

  connection {
    type        = "ssh"
    user        = "root"
    private_key = var.pvt_key  # Update with the path to your private key
    host        = digitalocean_droplet.apache-server[count.index].ipv4_address
  }

  provisioner "file" {
    source      = "Draft/CompanyWebSite/WebSiteProject/wb_bootstrap.sh"  # Update with the path to your local file
    destination = "/web-setup/"  # Update with the desired path on the remote Droplet
  }
}