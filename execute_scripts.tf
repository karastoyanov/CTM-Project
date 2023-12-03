resource "null_resource" "execute_script" {
  count = length(digitalocean_droplet.apache-server)

  connection {
    type        = "ssh"
    user        = "root"
    private_key = var.pvt_key  # Update with the path to your private key
    host        = digitalocean_droplet.apache-server[count.index].ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /web-setup/wb_bootstrap.sh",
      "source /web-setup/wb_boostrap.sh" # Pass any arguments if needed
    ]
  }
}