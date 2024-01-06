## Business Case - Management of Cloud Infrastructures

### Introduction
This project has to demonstrate the migration of the TrollParts Inc. infrastructure from on-premise to cloud services. The cloud provider used in the project is DigitalOcean.

### Tech Stack
* DigitalOcean
* Git/GitHub
* Vagrant
* Apache
* Terraform
* Docker & Docker Compose
* Kubernetes
* Jenkins
* HTML/CSS/Python/Bash

### Architecture
#### Web Servers
Six VMs with Debian 12 and Apache are being deployed with Vagrant to serve as a web servers for the company's web site and online store. Three of the VPSs are deployed in West US region, the other three web servers are deployed in Europe region. The website is a basic HTML/CSS web page for demo purposes. The entire deployment is fully automated with bash shell script provisioning in the Vagrantfile.
#### Load Balancers
For demo purposes, a two load balancers are being deployed using Terraform as IaaC. The load balancers should distributing the traffic between web servers and helps monitoring the resource allocation. One Load balancer is deployed for the web servers in US and second load balancer for the VMs in EU region. 
#### Database Clusters
Two database clusters are deployed via Terraform, used mostly for developing/testing new applications purposes. The real-life data will be kept on local DB instances in DataCenter - 1 - Vega. 

* PostgreSQL 15 Cluster with 2 nodes to manage the spare parts catalog. For the demo deployment the cluster has 1vCPU/2GB RAM/30GB Disk. A Firewall rule is added to allow connections only via the web server droplets. Additional connection pool resource with size 20 is created to ensure that the database cluster will keep high performance with multiple client connections. 
* 2 x MongoDB 5.0 cluster with 2 nodes.A Firewall rule is added to allow connections only via the web server droplets. 
#### Docker & Docker Compose
One VM with Docker and Docker Compose for some major applications like Portainer, Cloud DBeaver, Uptime Kuma, etc.
#### Jenkins
Jenkins Server on a separate VM with GitHub Enterpise and Postman integration. The server is used for building the company's applications and micro-services. The server is integrated with private docker container registry on premise. 







#### Jira Server
Dedicated VPS for Jira and eventually other Atlassian products deployment.



#### Additional VPSs for dev/testing/deployment
Dev-Station machines ready for developing and testing new/existing applications. Directly used by devs/QAs/dev-ops, etc. 