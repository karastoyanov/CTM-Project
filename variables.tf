variable "token" {	
    type = string	
    default = "dop_v1_32058ba36daf6159bfdff6cf9a08323891c2435d38abcd6b142287a88e0337fb"	
    description = "API TOKEN"	
}	

variable "key" {	
    type = string	
    default = "$HOME/.ssh/digital_ocean/id_rsa"	
    description = "Private SSH Key Location"	
}