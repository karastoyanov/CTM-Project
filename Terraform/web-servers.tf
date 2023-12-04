# Deploy n-count Apache Web Servers to host the company's website
resource "digitalocean_droplet" "apache-server" {
  count    = 3
  image    = "ubuntu-22-04-x64"
  name     = "company-web-site-host${count.index + 1}"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.terraform.fingerprint]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.pvt_key)
    host        = element(digitalocean_droplet.apache-server.*.ipv4_address, count.index)
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /web-setup/web_bootstrap.sh",
  #     "./web-setup/web_bootstrap.sh",
  #   ]
  # }
}


# Copy the web bootstrap shell script
resource "null_resource" "copy_files_wb_boostrap" {
  count = length(digitalocean_droplet.apache-server)

  provisioner "file" {
    source      = "Draft/CompanyWebSite/WebSiteProject/wb_bootstrap.sh"
    destination = "/web-setup/"
  }

  provisioner "file" {
    source      = "Services/CompanyWebSite/WebSiteProject/company-website" 
    destination = "/var/www/company-site/"
  }

  provisioner "file" {
    source      = "Services/CompanyWebSite/WebSiteProject/apache2.conf"
    destination = "/etc/apache2/sites-available/trollparts.conf"
  }
}