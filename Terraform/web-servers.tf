# Deploy n-count Apache Web Servers to host the company's website
resource "digitalocean_droplet" "apache-server" {
  count    = 3
  image    = "ubuntu-22-04-x64"
  name     = "company-web-site-host${count.index + 1}"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.terraform.fingerprint]

  provisioner "remote-exec" {
    inline = [
      "chmod +x /web-setup/web_bootstrap.sh",
      "./web-setup/web_bootstrap.sh",
    ]
  }

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.pvt_key) # Update with the path to your private key
    host        = digitalocean_droplet.apache-server[count.index].ipv4_address
  }
}


# Copy the web bootstrap shell script
resource "null_resource" "copy_files_wb_boostrap" {
  count = length(digitalocean_droplet.apache-server)

  provisioner "file" {
    source      = "Draft/CompanyWebSite/WebSiteProject/wb_bootstrap.sh" # Update with the path to your local file
    destination = "/web-setup/"                                         # Update with the desired path on the remote Droplet
  }
}

# Copy website file to the /var/www directory
resource "null_resource" "copy_files_website_dir" {
  count = length(digitalocean_droplet.apache-server)

  provisioner "file" {
    source      = "Services/CompanyWebSite/WebSiteProject/company-website" # Update with the path to your local file
    destination = "/var/www/company-site/"                                 # Update with the desired path on the remote Droplet
  }
}

# Copy the Apache conf 
resource "null_resource" "copy_files_apache_conf_file" {
  count = length(digitalocean_droplet.apache-server)

  provisioner "file" {
    source      = "Services/CompanyWebSite/WebSiteProject/apache2.conf" # Update with the path to your local file
    destination = "/etc/apache2/sites-available/trollparts.conf"        # Update with the desired path on the remote Droplet
  }
}