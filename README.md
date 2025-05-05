🚀 Beginner's Guide: Setting Up and Starting Your Terraform Project


🎯 Goal: To guide beginners through the complete setup process of starting a Terraform project—from scratch—using Git Bash and VS Code.

🧑‍💻 Step 1: Open Your Laptop and Prepare Your Workspace


Create a folder to store your Terraform project:

💡 For Windows Users:

Press Windows + E to open File Explorer.

Go to a location like Documents or Desktop.

Right-click → New → Folder.

Name the folder:


terraform-3tier-project

🧰 Step 2: Install Required Tools

Before writing code, you’ll need a few tools:

✅ 1. Install Git & Git Bash

Download from: https://git-scm.com/downloads

During installation, select "Use Git Bash only" when prompted for terminal preference.

After install, right-click anywhere → choose Git Bash Here to open the terminal.

✅ 2. Install VS Code

Download from: https://code.visualstudio.com/

Install with default options.

Open it from the Start menu or desktop icon.

✅ 3. Install Terraform

Download from: https://developer.hashicorp.com/terraform/downloads

Extract and add the path to your system’s environment variables.

To verify:


terraform -v

📂 Step 3: Open Git Bash and Navigate to Your Folder

Right-click on the terraform-3tier-project folder.

Choose "Git Bash Here".

You should see a terminal window open with a path like:


~/Documents/terraform-3tier-project

Now you’re inside your project folder via the terminal.

🧱 Step 4: Create Your Terraform Files

Use Git Bash to create files:

mkdir is command used in gitbash to create directories

touch is command that is used in gitbash to create folders

Hence,for creation of five fifferent folders ,ad touch before names of folders.

touch main.tf variables.tf outputs.tf terraform.tfvars

Similarly,mkdir is used to create folders

mkdir modules

cd modules

mkdir vpc ec2 alb rds

Note :Create folders by using mkdir command before creating files using touch command.

This creates the base files and folders.

📝 Step 5: Open the Project in VS Code

Method 1: From Git Bash

Inside your project folder, run:


code .

This opens the current folder in Visual Studio Code.

If code is not recognized, follow these steps:

In VS Code → Press Ctrl+Shift+P

Type: Shell Command: Install 'code' command in PATH → Press Enter

Restart Git Bash

Method 2: From File Explorer

Open VS Code.

Click File → Open Folder.

Select your terraform-3tier-project folder.

📜 Step 6: Start Writing Your Terraform Code

In VS Code, inside main.tf, write a sample Terraform block:


provider "aws" {
  region = "us-east-1"
}
In variables.tf, declare variables:


variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}
Save your files using Ctrl + S.

🔧 Step 7: Initialize and Apply with Terraform
Back in Git Bash:

Initialize Terraform:


terraform init

Check what Terraform will do:


terraform plan(This is necessory to see the entire plan of what terraform is going to do)

Apply the configuration:


terraform apply

Type yes .

Initialize a Git repo:

git init

Add and commit your code:

git add .

git commit -m "Initial commit for 3-tier Terraform architecture"

Push to GitHub:

Create a repo on GitHub.

Follow the instructions to push:


git remote add origin https://github.com/your-username/terraform-3tier-project.git

git push -u origin main


Importance of the Three-Tier Web Application Infrastructure Project

In today's cloud-native world, deploying applications that are scalable, secure, and highly available is essential. This project demonstrates the implementation of a three-tier architecture on AWS using Terraform, an industry-standard tool for Infrastructure as Code (IaC). Here's why this project holds significant value:

✅ 1. Real-World Relevance

Three-tier architecture (Presentation → Application → Database) is a widely adopted design pattern used by modern enterprise applications and cloud services.

Replicates production-level deployment practices used by companies like Netflix, Airbnb, and Amazon.

✅ 2. Infrastructure as Code (IaC) Proficiency


Builds foundational skills in Terraform, helping learners understand how infrastructure is declared, versioned, and deployed in code rather than manually through a cloud console.

Promotes repeatability, auditability, and collaboration—core principles of DevOps.

✅ 3. End-to-End Automation

Automates provisioning of VPCs, subnets, EC2 instances, RDS databases, and Load Balancers using Terraform modules.

Reduces human error and increases deployment speed, making the process CI/CD-friendly.

✅ 4. Security and Best Practices

Emphasizes secure architecture using:

Public/private subnet division or seperation 

Encrypted databases and isolated network flows

✅ 5. Career Advancement

Acts as a portfolio-grade project that demonstrates practical skills in cloud architecture, Terraform, networking, and automation—all of which are highly valued by employers.

⚙️ Complexity of the Project


While the project is structured to help beginners progress step-by-step, it does involve a moderate-to-high level of complexity due to the following factors:

⚠ 1. Multi-Tier Network Design

Using multiple layers (frontend, app, and DB) across public and private subnets requires an understanding of networking concepts such as route tables, NAT Gateways, and Internet Gateways.

⚠ 2. Modular Terraform Codebase

Uses a modular architecture to break the project into reusable and seperate components (VPC, EC2, ALB, RDS).

While this promotes scalability, it adds a to learning in understanding how modules interact and share variables.

⚠ 3. State Management and Remote Backends

Handling Terraform state files securely (e.g., via S3 and DynamoDB) can be challenging and is critical in collaborative environments.

⚠ 4. Debugging and Dependency Management

Due to the interdependencies between components (e.g., ALB needs EC2, EC2 needs VPC), diagnosing configuration errors requires a logical and systematic approach.

⚠ 5. Real-Cloud Costs and Resources

AWS resources used in the project (e.g., EC2 instances, RDS) use real costs. Users must learn to manage budgets and clean up resources after testing

# 🌐 Three-Tier Web Application Infrastructure with Terraform

This project shows a fully automated and scalable **three-tier architecture** on AWS using **Terraform**.  
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

# #Importance of each resource in the Three-Tier Terraform Project
This guide explains the purpose behind each infrastructure component and setup step, so you understand why you're doing what you're doing.

 1. VPC (Virtual Private Cloud)
 
 Why it's necessary:

A VPC is like one's own private datacenter inside AWS.

It isolates your resources from the public internet.

One has to define their subnets, route tables, and IP ranges here.

 
 2. Subnets (Public & Private)

 Why it's necessary:

Public Subnet: These are responsible for the resources or manages  resources that must be internet-facing (e.g., Load Balancer).

Private Subnet: They manage those resources that use internal services like EC2 and databases that should not be directly accessible from the internet or services that are not seen or accessed by users but are private.



🔹 3. Internet Gateway & NAT Gateway

Internet Gateway (IGW): Allows public subnets (like your Load Balancer) to connect to the internet.

NAT Gateway: Lets private subnets (e.g., your EC2 app servers) to use outbound traffic (e.g., to download updates), without being publicly accessible.

Your EC2 needs to install Nginx via the internet but shouldn’t be open to the public. NAT Gateway helps with that.

🔹 4. Security Groups

📌 Why it's necessary:

Acts as a firewall for your AWS resources.

Controls who can access what, e.g.:

Only allow traffic on port 80 (HTTP) to the Load Balancer

Only allow traffic from the Load Balancer to EC2

Only allow EC2 to communicate  to RDS on port 3306 (MySQL)


Without security groups, every server would be either fully open or fully closed.Security groups are essential compoenents as they allow only selective access to particular resources.

🔹 5. EC2 Instances (App Layer with Nginx)

📌 Why it's necessary:

These are your actual servers that run your application.

Nginx is installed here to start an app (e.g., a website or API).


Think of EC2 as your laptop in the cloud, running your code. Nginx is like the software you install to show your website.

🔹 6. User Data Script

📌 Why it's necessary:

Automates the installation of software (like Nginx) when the EC2 instance launches.

Makes the server self-configuring.

Instead of manually logging into each server and setting things up, we write a script and let it happen automatically—like a “setup wizard.”

🔹 7. Application Load Balancer (ALB)
📌 Why it's necessary:

Sits in front of your EC2 instances.

Distributes incoming traffic evenly across multiple servers.

Ensures high availability and scalability.


If your app is getting a lot of visitors, ALB makes sure no single server gets overloaded. 

🔹 8. RDS (Relational Database Service)

📌 Why it's necessary:

Hosts your database (e.g., MySQL, PostgreSQL).

Managed by AWS: includes backups, patching, scaling.

Found in a private subnet for security.


RDS is where your app stores its data—like usernames or orders. And it's managed by AWS, so you don’t need to be a database expert.

🔹 9. Terraform Files & Modular Structure

main.tf: Central configuration to put togather everything.

variables.tf: Defines input values (like region, instance size).

outputs.tf: Displays useful info after deployment (like public IPs).

modules/: Keeps each component (VPC, EC2, ALB, etc.) in its own folder for reusability.


Instead of one big messy file, we break things down into clean, reusable chunks. It’s like organizing your closet—makes life easier as your project grows.

🔹 10. Terraform Commands (init, plan, apply)
terraform init: Downloads required providers and sets up the environment.

terraform plan: Shows what Terraform will do before making changes.

terraform apply: Applies the infrastructure changes.


 init is like  preparing the tools, plan as reviewing your blueprints, and apply as building the actual house
 
## Step by Step guide 


Building a Three-Tier Web Application Infrastructure with Terraform on AWS

📘 Overview

This guide guides you through creating a three-tier architecture on AWS using Terraform, which includes:

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

