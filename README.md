## Business Case - Management of Cloud Infrastructures

### Introduction
This project has to demonstrate the migration of the TrollParts Inc. infrastructure from on-premise to cloud services. The cloud provider used in the project is DigitalOcean.

### Tech Stack
* DigitalOcean
* Git/GitHub/GitHub Actions
* Vagrant
* Apache
* Terraform
* Docker
* HTML/CSS/Python/Bash

### Architecture
#### Web Servers
Two VMs with Debian 12 and Apache are being deployed with Vagrant to serve as a web servers for the company's web site and online store. The website is a basic HTML/CSS web page for demo purposes. The entire deployment is fully automated with bash shell script provisioning in the Vagrantfile.

|![web-server-1](https://github.com/karastoyanov/CTM-Project/blob/main/PrntScreens/Step%201%20-%20Apache_Web_Servers/Screenshot%202024-01-04%20at%2002.53.43.png?raw=true)   	|![](https://github.com/karastoyanov/CTM-Project/blob/main/PrntScreens/Step%201%20-%20Apache_Web_Servers/Screenshot%202024-01-04%20at%2002.54.11.png?raw=true)   	|![](https://github.com/karastoyanov/CTM-Project/blob/main/PrntScreens/Step%201%20-%20Apache_Web_Servers/Screenshot%202024-01-04%20at%2002.54.29.png?raw=true)   	|![](https://github.com/karastoyanov/CTM-Project/blob/main/PrntScreens/Step%201%20-%20Apache_Web_Servers/Screenshot%202024-01-04%20at%2002.54.39.png?raw=true)   	|
|---	|---	|---	|---	|

#### Load Balancer
For demo purposes, a load balancer is being deployed using Terraform as IaaC. The load balancer should distributing the traffic between both web servers and helps monitoring the resource allocation.

|![](https://github.com/karastoyanov/CTM-Project/blob/main/PrntScreens/Step%202%20-%20Load_Balancer/Screenshot%202024-01-04%20at%2003.05.08.png?raw=true)   	|![](https://github.com/karastoyanov/CTM-Project/blob/main/PrntScreens/Step%202%20-%20Load_Balancer/Screenshot%202024-01-04%20at%2003.05.23.png?raw=true)   	|![](https://github.com/karastoyanov/CTM-Project/blob/main/PrntScreens/Step%202%20-%20Load_Balancer/Screenshot%202024-01-04%20at%2003.13.50.png?raw=true)   	|![](https://github.com/karastoyanov/CTM-Project/blob/main/PrntScreens/Step%202%20-%20Load_Balancer/Screenshot%202024-01-04%20at%2003.39.41.png?raw=true)   	|![](https://github.com/karastoyanov/CTM-Project/blob/main/PrntScreens/Step%202%20-%20Load_Balancer/Screenshot%202024-01-04%20at%2003.39.06.png?raw=true) |
|---	|---	|---	|---	|---|

#### Docker & Docker Compose

#### Portainer

#### Uptime Kuma

#### Database Clusters

#### Cloud DBeaver

#### Jenkins

#### Container Registry




