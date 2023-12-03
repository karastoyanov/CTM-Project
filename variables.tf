variable "token" {	
    type = string	
    default = "dop_v1_2ed920945c724f12d8b1e2dfec38ac26c04855403e7ec729ab783319814b9c01"	
    description = "API TOKEN"	
}	

variable "pvt_key" {	
    type = string	
    default = "$HOME/.ssh/digital_ocean/id_rsa"	
    description = "Private SSH Key Location"	
}