#!/bin/bash

# Call the Vagrant file to create the droplets
printf "\nCreating droplets with Apache Web Servers for company web site...\n"
cd Vagrant && vagrant up
sleep 5
printf "\nDroplets created successfully!\n" 



# Deploying the load balancer for the Apache web servers
printf "\nInitiating the Load Balancer for the company web site...\n"
cd ../Terraform/ && terraform plan && terraform apply
sleep 5
printf "\nLoad Balancer created successfully!\n"