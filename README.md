<<<<<<< HEAD
# 🌐 Three-Tier Web Application Infrastructure with Terraform

This project demonstrates a fully automated and scalable **three-tier architecture** on AWS using **Terraform**.  
It includes a **frontend load balancer**, **Nginx-based application layer**, and a **backend RDS database**, all provisioned through Infrastructure as Code (IaC).

>  

---

---

## Features

-  **Modular structure** with separate Terraform modules for:
  - VPC (with public/private subnets)
  - EC2 (App Layer with Nginx)
  - ALB (Application Load Balancer)
  - RDS (Relational Database Service)
-  **Nginx installed automatically** on EC2 using `user_data` script.
-  **Highly available and secure** using:
  - Public/Private Subnet isolation
  - NAT Gateway and Internet Gateway
  - Security Groups for controlled traffic
-  **Scalable design** using `count` to launch multiple EC2 instances.
-  **Output variables** for visibility into deployed resources.

---

##  Technologies Used

- **Terraform** (IaC)
- **AWS** (VPC, EC2, ALB, RDS, Security Groups)
- **Nginx** (Application Layer)
- **Ubuntu** or **Amazon Linux** AMI

---





=======
## Step by Step guide 

Building a Three-Tier Web Application Infrastructure with Terraform on AWS

📘 Overview

This guide walks you through creating a three-tier architecture on AWS using Terraform, which includes:

Frontend Layer: Application Load Balancer (ALB)

Application Layer: EC2 instances running Nginx

Backend Layer: RDS (MySQL or PostgreSQL)

Infrastructure: Built using Terraform modules (IaC)

 Prerequisites
Before you start make sure you have done all the work described below:

✅ AWS Account

✅ Terraform installed (terraform -v)

✅ AWS CLI configured (aws configure)

✅ IAM User with EC2, VPC, RDS, and IAM permissions

✅ Basic knowledge of Terraform and AWS

🗂️ Project Structure

terraform-3tier-architecture/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── alb/
│   └── rds/


Each module contains its own main.tf, variables.tf, and outputs.tf.


🧱 Step 1: Create VPC Module
Create modules/vpc/ with:


# modules/vpc/main.tf

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { Name = "main-vpc" }
}

Include resources for:

Public & private subnets

Internet Gateway

NAT Gateway

Route Tables


🖥️ Step 2: Create EC2 Module


In modules/ec2/:


resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count

  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = [var.sg_id]

  user_data = file("${path.module}/install_nginx.sh")
}


install_nginx.sh contains shell script to install and start Nginx.


⚖️ Step 3: Create Load Balancer Module


In modules/alb/:


resource "aws_lb" "app_alb" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [var.sg_id]
}

Also create:

Target group

Listener (HTTP 80)

Attach EC2 instances to the target group

🗄️ Step 4: Create RDS Module


In modules/rds/:


resource "aws_db_instance" "db" {
  
  identifier        = "app-db"
 
  engine            = "mysql"
 
  instance_class    = "db.t3.micro"
  
  allocated_storage = 20
 
  name              = var.db_name
 
  username          = var.db_user
 
  password          = var.db_password
 
  vpc_security_group_ids = [var.db_sg_id]
 
  db_subnet_group_name   = var.db_subnet_group
}
⚙️ Step 5: Define Root Configuration


In your root main.tf:


module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  ...
}


module "ec2" {
  source = "./modules/ec2"
  ...
}


module "alb" {
  source = "./modules/alb"
  ...
}

module "rds" {
  source = "./modules/rds"
  ...
}


🔑 Step 6: Handle Variables and Outputs

Define all necessary variables in variables.tf and user-defined values in terraform.tfvars. Expose important outputs like:


output "alb_dns_name" {
  value = module.alb.lb_dns_name
}


🚀 Step 7: Deploy the Infrastructure
Run the following commands:


terraform init
terraform validate
terraform plan
terraform apply
Accept the plan, and wait for the infrastructure to be deployed.

🔍 Step 8: Verify and Test


Access your app using the ALB DNS output.

Verify EC2 instances are running Nginx.

Check RDS connectivity and configuration in AWS Console.

🧹 Step 9: Destroy Resources


To avoid charges:


terraform destroy

