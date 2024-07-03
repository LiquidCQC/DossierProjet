# DevOps ECF with IaC
This repositery is meant for the final evaluation of Studi DevOps Bachelor.

I choose IaC with terraform to create and manage the infrastructure requested.

# Infrastructure architecture
-> Add image of the infrastructure

This terraform is meant to be fully reusable. Terraform modules with generic variable specified in a variables.tfvars allow us to just have on file to modify if we want to change our infrastructure.
This code is based on harshitadwivedi1199
's work (https://github.com/harshitadwivedi1199/3-tier-architecture-on-aws-using-terraform)

# Variables 
Please only modify terraform.tfvars
Sensible variable (AWS provider, database root user and password) are hosted on another service with token through CLI.

# Compute 
EC2 are provided by launch template. Attached to those are bash file to install everything needed to install the react app in the frontend and a java app in the back end.

# Manual intervention
EC2 roles must be added 
The CI/CD pipeline is not yet integrated with terraform
Monitoring and alerts settings must be added 
Route 53 must be set manualy to have a domain name (needed to work with aws RUM)
