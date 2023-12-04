
# Copy the web bootstrap shell script
resource "null_resource" "copy_files_wb_boostrap" {
  count = length(digitalocean_droplet.apache-server)

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.pvt_key)  # Update with the path to your private key
    host        = digitalocean_droplet.apache-server[count.index].ipv4_address
  }

  provisioner "file" {
    source      = "Draft/CompanyWebSite/WebSiteProject/wb_bootstrap.sh"  # Update with the path to your local file
    destination = "/web-setup/"  # Update with the desired path on the remote Droplet
  }
}

# Copy website file to the /var/www directory
resource "null_resource" "copy_files_website_dir" {
  count = length(digitalocean_droplet.apache-server)

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.pvt_key)  # Update with the path to your private key
    host        = digitalocean_droplet.apache-server[count.index].ipv4_address
  }

  provisioner "file" {
    source      = "Services/CompanyWebSite/WebSiteProject/company-website"  # Update with the path to your local file
    destination = "/var/www/company-site/"  # Update with the desired path on the remote Droplet
  }
}

# Copy the Apache conf 
resource "null_resource" "copy_files_apache_conf_file" {
  count = length(digitalocean_droplet.apache-server)

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.pvt_key)  # Update with the path to your private key
    host        = digitalocean_droplet.apache-server[count.index].ipv4_address
  }

  provisioner "file" {
    source      = "Services/CompanyWebSite/WebSiteProject/apache2.conf"  # Update with the path to your local file
    destination = "/etc/apache2/sites-available/trollparts.conf"  # Update with the desired path on the remote Droplet
  }
}